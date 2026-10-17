"""Build the array-type map UELib needs to decode dynamic arrays in defaultproperties.

UE2 packages don't store the inner type of dynamic arrays in serialized defaults, so a
decompiler that can't resolve the declaring class prints "Array type was not detected"
and drops the data. This scans every `var array<...>` declaration in the v1 decompiled
scripts and emits `Package.Class.Var:PropertyType` lines for decompile.ps1.

UELib keys the map by bare variable name, so when two classes declare the same name with
different types, declarations from *Params classes win (they carry the weapon stats).

Usage: python build_vartypes.py <scripts_root> [<scripts_root> ...] > vartypes.txt
"""
import os
import re
import sys

PRIM = {
    "int": "IntProperty", "float": "FloatProperty", "byte": "ByteProperty",
    "bool": "BoolProperty", "name": "NameProperty", "string": "StrProperty",
}
STRUCT_RE = re.compile(r"struct\s+(?:\w+\s+)*?(\w+)\s*(?:extends\s+\w+\s*)?\{")
ENUM_RE = re.compile(r"enum\s+(\w+)")
ARRAY_VAR_RE = re.compile(
    r"^\s*var(?:\(\w*\))?\s+(?:\w+\s+)*?array<\s*(?:(?:editinline|export|localized|transient|const)\s+)*([\w.<>']+)\s*>\s+(\w+)", re.M
)


def main(roots):
    texts = {}
    for root in roots:
        for dirpath, _, files in os.walk(root):
            for f in files:
                if f.endswith(".uc"):
                    pkg = os.path.relpath(dirpath, root).split(os.sep)[0]
                    with open(os.path.join(dirpath, f), encoding="utf-8", errors="replace") as fh:
                        texts[(pkg, f[:-3])] = fh.read()

    structs, enums = set(), set()
    for t in texts.values():
        structs.update(STRUCT_RE.findall(t))
        enums.update(ENUM_RE.findall(t))

    by_var = {}  # var name -> (priority, line)
    for (pkg, cls), t in sorted(texts.items()):
        for typ, var in ARRAY_VAR_RE.findall(t):
            base = typ.split(".")[-1]
            if typ.lower().startswith("class<"):
                kind = "ClassProperty"
            elif base.lower() in PRIM:
                kind = PRIM[base.lower()]
            elif base in enums:
                kind = "ByteProperty"
            elif base in structs:
                kind = "StructProperty"
            else:
                kind = "ObjectProperty"
            prio = 1 if cls.endswith("Params") else 0
            line = f"{pkg}.{cls}.{var}:{kind}"
            if var not in by_var or prio > by_var[var][0]:
                by_var[var] = (prio, line)

    print("\n".join(sorted(line for _, line in by_var.values())))


if __name__ == "__main__":
    main(sys.argv[1:])
