"""Smoke tests for validate.py. Run: python tools/kit/tests/test_validate.py"""
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.dirname(HERE))
import validate  # noqa: E402

FIX = os.path.join(HERE, "fixtures")


def run():
    rep, _ = validate.validate_file(os.path.join(FIX, "sidearm_pistol_t1-testgun.md"), ["Skrith"])
    assert not rep.errors and not rep.warnings, (rep.errors, rep.warnings)
    rep, _ = validate.validate_file(os.path.join(FIX, "sidearm_pistol_t2-broken.md"), ["Testgun"])
    msgs = "\n".join(rep.errors + rep.warnings)
    for needle in ["unknown value 'sidearms'", "unknown field 'hipp'", "must not be negative", "needs at least one era tag",
                   "filename: must be", "designation must be 'T1'", "patch path 'fire_modes[Nope].rpm'",
                   "Controls table must list", "kick_deg 20", "blocklisted source-material word found: 'Testgun'"]:
        assert needle in msgs, f"expected '{needle}' in:\n{msgs}"
    print("validate.py smoke tests passed")


if __name__ == "__main__":
    run()
