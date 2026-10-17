"""Build the private name blocklist the validator uses to catch source-material names in kit entries.

Collects every BW weapon display name and its model code (e.g. "M806A2 Pistol" -> "M806A2", "M806"),
manufacturer names from weapon descriptions, and a hand list of BW lore terms. Writes
provenance/name-blocklist.txt, which is never shipped (it would itself leak the names).

Usage: python tools/kit/build_blocklist.py <bw_weapon_params.json> <scripts_v2_root> <out.txt>
"""
import json
import os
import re
import sys

LORE = ["Skrith", "UTC", "Cryon", "Enravion", "Nexron", "Krao", "Ballistic Weapons", "Runestorm", "Relics and Rayguns",
        "Unreal Tournament", "Liandri", "Izanagi", "Phayder", "Necris", "Gen Mo'Kai",
        "Majestic Firearms", "ZTV Export", "Zavod Tochnogo Voorujeniya", "Apollo Industries", "JAX Industrial", "Drake & Co",
        "Black & Wood", "Wot ya Packin", "N-TOV", "Dipheox", "Redwood Firearms", "Classic Weapons Industries",
        "Human-Skrith"]
GENERIC = {"pistol", "rifle", "gun", "knife", "grenade", "launcher", "shotgun", "machine", "machinegun", "assault", "sniper",
           "carbine", "cannon", "the", "and", "mine", "device", "blade", "sword", "staff", "minigun", "smg", "lmg", "beam",
           "plasma", "rocket", "explosive", "heavy", "light", "auto", "laser", "railgun", "revolver", "flamethrower"}


def model_codes(name):
    out = set()
    for tok in re.split(r"[ ()/'\"]+", name):
        if re.search(r"\d", tok) and len(tok) >= 2 and not re.fullmatch(r"\d+(mm|ga|x\d+)?", tok.lower()):
            out.add(tok.strip(".,"))
            base = re.match(r"([A-Za-z]+-?\d+)", tok)
            if base and len(base.group(1)) >= 2:
                out.add(base.group(1))
    return out


def main(params_json, src_root, out_path):
    data = json.load(open(params_json, encoding="utf-8"))
    words = set(LORE)
    for w in data.values():
        for nm in filter(None, [w.get("fallback_name"), (w.get("weapon") or {}).get("ItemName")]):
            words.add(nm.strip())
            words |= model_codes(nm)
            for part in re.findall(r"'([^']{3,})'", nm):  # nicknames in quotes: 'Viper'
                if part.lower() not in GENERIC:
                    words.add(part)
    for root, _, files in os.walk(src_root):
        for f in files:
            if not f.endswith(".uc"):
                continue
            with open(os.path.join(root, f), encoding="utf-8", errors="replace") as fh:
                for m in re.finditer(r"Manufacturer: ([^|\"]{3,40}?)(?:\||\.|\"|$)", fh.read()):
                    mk = m.group(1).strip()
                    if mk.lower() not in ("n/a", "various", "unknown", "various civilian manufacturers"):
                        words.add(mk)
    words = sorted({w for w in words if w and w.lower() not in GENERIC and len(w) >= 2}, key=str.lower)
    os.makedirs(os.path.dirname(out_path), exist_ok=True)
    with open(out_path, "w", encoding="utf-8") as fh:
        fh.write("# Private: source-material names the validator flags in kit entries. Never ship this file.\n")
        fh.write("# Regenerate with tools/kit/build_blocklist.py\n")
        fh.write("\n".join(words) + "\n")
    print(f"{len(words)} entries -> {out_path}")


if __name__ == "__main__":
    main(*sys.argv[1:4])
