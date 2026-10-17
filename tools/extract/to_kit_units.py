"""Convert the canonical BW stat set (raw Unreal units) into kit units.

Input:  sources/bw-2.9/extracted/bw_canonical.json   (merge_canonical.py)
        sources/bw-2.9/extracted/bw_aux_classes.json (extract_params.py side file: melee, ammo, damage types)
Output: sources/bw-2.9/extracted/bw_kit_units.json

Every converted block keeps the BW fields it was built from under "_raw", so any kit number can be
traced back. Each layout also gets "kit_estimates": bulk-based mass and hold, the tightened hip drift
cone and ads_run_instability (tools/kit/handling_model.py), as starting points for weapon entries. Conversions (see docs/research/unit-conversion.md for the reasoning):

  distance   52.5 Unreal units (uu) = 1 m
  angle      65536 rotation units = 360 deg
  time       UT2004 runs at TimeDilation 1.1, so 1 game second = 1/1.1 real seconds. Every duration is
             divided by 1.1 and every speed multiplied by 1.1 (BW's own weapon manual does the same).
  momentum   UT momentum (uu/s x UT mass) / pawn mass 100 -> velocity change. A UT pawn (mass 100) is
             read as a 100 kg armoured mercenary, so impulse_ns = momentum * 1.1 / 52.5.
  damage     unchanged, absolute HP (100 HP ordinary human, 200 HP armoured mercenary).

Usage: python to_kit_units.py <bw_canonical.json> <bw_aux_classes.json> <out.json>
"""
import json
import math
import os
import re
import sys

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "kit"))
import handling_model  # noqa: E402  (kit derivations: hipfire tightening, ads_run_instability)
import recoil_model  # noqa: E402  (mass estimate, default hold)

UU_PER_M = 52.5
ROT_PER_DEG = 65536 / 360.0
TIME_DILATION = 1.1
UT_PAWN_MASS = 100.0          # UT2004 Pawn.Mass default
KIT_REF_MASS_KG = 100.0       # the UT pawn read as a 100 kg armoured mercenary with kit
HP_HUMAN, HP_MERC = 100, 200

ZOOM_TYPES = ["irons", "fixed", "logarithmic", "minimum", "smooth"]
SPREAD_SHAPES = ["rectangle", "scatter", "circle"]
FALLOFF_TYPES = ["linear", "quadratic", "none"]
DETONATE = ["timer", "impact", "impact_after_timer", "when_still", "disarm", "none"]
PLAYER_IMPACT = ["bounce", "detonate", "stick"]
DISPLACE = ["none", "linear", "scaling"]


# ---------- unit helpers ----------
def m(uu):
    return None if uu is None else round(uu / UU_PER_M, 3)


def deg(rot):
    return None if rot is None else round(rot / ROT_PER_DEG, 3)


def sec(t):
    return None if t is None else round(t / TIME_DILATION, 4)


def mps(uu_s):
    return None if uu_s is None else round(uu_s * TIME_DILATION / UU_PER_M, 3)


def deg_s(rot_s):
    return None if rot_s is None else round(rot_s * TIME_DILATION / ROT_PER_DEG, 2)


def impulse(momentum):
    """UT momentum -> N*s on the 100 kg reference body."""
    if momentum is None:
        return None
    dv = (momentum / UT_PAWN_MASS) * TIME_DILATION / UU_PER_M
    return round(dv * KIT_REF_MASS_KG, 3)


def num(v):
    return isinstance(v, (int, float)) and not isinstance(v, bool)


def as_list(v):
    if v is None:
        return []
    if isinstance(v, dict) and v and all(str(k).isdigit() for k in v):
        return [v[k] for k in sorted(v, key=int)]
    return v if isinstance(v, list) else [v]


def class_ref(v):
    mm = re.match(r"Class'[\w]+\.(\w+)'", v or "") if isinstance(v, str) else None
    return mm.group(1) if mm else None


def clean(d):
    """Drop None values (keeps output compact)."""
    return {k: v for k, v in d.items() if v is not None}


def curve(c):
    pts = (c or {}).get("Points") or []
    return [[p.get("InVal"), p.get("OutVal")] for p in pts if isinstance(p, dict)]


def raw(src, keys):
    return {k: src[k] for k in keys if k in src}


# ---------- block converters ----------
def conv_recoil(r):
    keys = ["MaxRecoil", "DeclineTime", "DeclineDelay", "ClimbTime", "ViewBindFactor", "ADSViewBindFactor",
            "HipMultiplier", "MaxMoveMultiplier", "CrouchMultiplier", "PitchFactor", "YawFactor", "XRandFactor",
            "YRandFactor", "MinRandFactor", "EscapeMultiplier", "bViewDecline", "bUseAltSightCurve", "XCurve", "YCurve",
            "XCurveAlt", "YCurveAlt"]
    out = clean({
        "max_deg": deg(r.get("MaxRecoil")),
        "recovery_s": sec(r.get("DeclineTime")),
        "recovery_delay_s": sec(r.get("DeclineDelay")),
        "climb_s": sec(r.get("ClimbTime", 0.0)),
        "view_follow_hip": r.get("ViewBindFactor"),
        "view_follow_ads": r.get("ADSViewBindFactor"),
        "hip_mult": r.get("HipMultiplier"),
        "moving_mult": r.get("MaxMoveMultiplier"),
        "crouch_mult": r.get("CrouchMultiplier"),
        "pitch_factor": r.get("PitchFactor"),
        "yaw_factor": r.get("YawFactor"),
        "scatter_x": r.get("XRandFactor", 0.0),
        "scatter_y": r.get("YRandFactor", 0.0),
        "scatter_floor": r.get("MinRandFactor"),
        "view_recovers": bool(r.get("bViewDecline", False)),
        "pattern_yaw": curve(r.get("XCurve")),
        "pattern_pitch": curve(r.get("YCurve")),
    })
    if r.get("bUseAltSightCurve"):
        out["pattern_yaw_ads"], out["pattern_pitch_ads"] = curve(r.get("XCurveAlt")), curve(r.get("YCurveAlt"))
    out["_raw"] = raw(r, keys)
    return out


def conv_aim(a):
    keys = ["AimSpread", "AimAdjustTime", "OffsetAdjustTime", "VelocityAimAdjustMult", "CrouchMultiplier", "ADSMultiplier",
            "SprintOffset", "JumpOffset", "ViewBindFactor", "ADSViewBindFactor", "JumpChaos", "FallingChaos", "SprintChaos",
            "AimDamageThreshold", "ChaosDeclineTime", "ChaosDeclineDelay", "ChaosSpeedThreshold", "ChaosTurnThreshold"]
    sp = a.get("AimSpread") or {}
    so, jo = a.get("SprintOffset") or {}, a.get("JumpOffset") or {}
    out = clean({
        "drift_min_deg": deg(sp.get("Min")),
        "drift_max_deg": deg(sp.get("Max")),
        "ads_drift_mult": a.get("ADSMultiplier"),
        "settle_s": sec(2 * a["AimAdjustTime"]) if num(a.get("AimAdjustTime")) else None,  # BW swings over 2 x AimAdjustTime
        "moving_settle_mult": a.get("VelocityAimAdjustMult"),
        "pose_shift_s": sec(a.get("OffsetAdjustTime")),
        "crouch_mult": a.get("CrouchMultiplier"),
        "view_follow_hip": a.get("ViewBindFactor", 0.0),
        "view_follow_ads": a.get("ADSViewBindFactor"),
        "chaos_full_speed_mps": mps(a.get("ChaosSpeedThreshold")),
        "chaos_full_turn_deg_s": deg_s(a.get("ChaosTurnThreshold")),
        "chaos_recovery_s": sec(a.get("ChaosDeclineTime")),
        "chaos_recovery_delay_s": sec(a.get("ChaosDeclineDelay")),
        "sprint_chaos": a.get("SprintChaos"),
        "jump_chaos": a.get("JumpChaos", 0.0),
        "falling_chaos": a.get("FallingChaos", 0.0),
        "sprint_pose_deg": [deg(so.get("Pitch", 0)), deg(so.get("Yaw", 0))] if so else None,
        "jump_kick_deg": [deg(jo.get("Pitch", 0)), deg(jo.get("Yaw", 0))] if jo else None,
        "flinch_damage": a.get("AimDamageThreshold"),
    })
    out["_raw"] = raw(a, keys)
    return out


def conv_falloff(e):
    tr = e.get("TraceRange") or {}
    dr = e.get("DecayRange") or {}
    atten = e.get("RangeAtten", 1.0)
    lo, hi = dr.get("Min", 0.0), dr.get("Max", 0.0)
    if not hi or hi <= lo:
        hi = tr.get("Max")
    return clean({
        "range_max_m": m(tr.get("Max")),
        "range_min_m": m(tr.get("Min")) if tr.get("Min") is not None and tr.get("Min") != tr.get("Max") else None,
        "falloff_start_m": m(lo) if atten != 1.0 else None,
        "falloff_end_m": m(hi) if atten != 1.0 else None,
        "falloff_min_mult": atten if atten != 1.0 else None,
        "underwater_range_m": m(e.get("WaterTraceRange")),
    })


def conv_effect(e, aux):
    cls = e.get("_class", "FireEffectParams")
    kind = {"InstantEffectParams": "hitscan", "ShotgunEffectParams": "pellets", "ProjectileEffectParams": "projectile",
            "GrenadeEffectParams": "grenade", "MeleeEffectParams": "melee", "FireEffectParams": "function"}.get(cls, cls)
    inacc = e.get("Inaccuracy") or {}
    out = {"payload": kind}
    out.update(clean({
        "damage": e.get("Damage"),
        "pellets": e.get("TraceCount"),
        "head_mult": e.get("HeadMult"),
        "limb_mult": e.get("LimbMult"),
        "recoil_kick_deg": deg(e.get("Recoil", 0.0)),
        "shot_spread_deg": [deg(inacc.get("X", 0)), deg(inacc.get("Y", 0))] if inacc else None,
        "spread_shape": SPREAD_SHAPES[e["SpreadMode"]] if num(e.get("SpreadMode")) else None,
        "hip_spread_mult": e.get("HipSpreadFactor"),
        "heat_per_shot": e.get("Heat"),
        "shooter_push_mps": mps(e.get("PushbackForce")),
        "knockback_ns": impulse(e.get("MomentumTransfer")),
        "effect_label": e.get("EffectString") if e.get("EffectString") not in (None, "Unknown") else None,
    }))
    if kind in ("hitscan", "pellets", "melee"):
        out.update(conv_falloff(e))
        out.update(clean({
            "body_penetration": e.get("PenetrateForce") if e.get("bPenetrate") else None,
            "after_body_mult": e.get("PDamageFactor") if e.get("bPenetrate") else None,
            "wall_penetration_m": m(e.get("PenetrationEnergy")) if e.get("PenetrationEnergy") else None,
            "after_wall_mult": e.get("WallPDamageFactor") if e.get("PenetrationEnergy") else None,
            "lunge_stop": e.get("HookStopFactor"),
            "lunge_pull_mps": mps(e.get("HookPullForce")),
            "special_damage": e.get("DamageSpecial"),
        }))
    if kind == "melee":
        out.update(clean({
            "charge_bonus_mult": 1 + e["ChargeDamageBonusFactor"] if num(e.get("ChargeDamageBonusFactor")) else None,  # x(1 + factor) at full hold
            "flank_mult": e.get("FlankDamageMult"),
            "back_mult": e.get("BackDamageMult"),
            "fatigue_per_hit": e.get("Fatigue"),
        }))
    if kind in ("projectile", "grenade"):
        out.update(clean({
            "speed_mps": mps(e.get("Speed")),
            "max_speed_mps": mps(e.get("MaxSpeed")) if e.get("MaxSpeed") else None,
            "accel_mps2": round(e["AccelSpeed"] * TIME_DILATION ** 2 / UU_PER_M, 2) if e.get("AccelSpeed") else None,
            "splash_radius_m": m(e.get("DamageRadius")) if e.get("DamageRadius") else None,
            "splash_falloff": FALLOFF_TYPES[e["RadiusFallOffType"]] if num(e.get("RadiusFallOffType")) and e.get("DamageRadius") else None,
            "damage_gain_mult": e.get("MaxDamageGainFactor") if e.get("DamageGainEndTime") else None,
            "damage_gain_start_s": sec(e.get("DamageGainStartTime")) if e.get("DamageGainEndTime") else None,
            "damage_gain_end_s": sec(e.get("DamageGainEndTime")) if e.get("DamageGainEndTime") else None,
            "special_damage": e.get("DamageSpecial"),
        }))
    if kind == "grenade":
        out.update(clean({
            "impact_damage": e.get("ImpactDamage"),
            "arming_s": sec(e.get("ArmingDelay")) if e.get("bOverrideArming") or e.get("ArmingDelay") else None,
            "fuse_s": sec(e.get("DetonateDelay")),
            "detonate_unarmed": DETONATE[e["UnarmedDetonateOn"]] if num(e.get("UnarmedDetonateOn")) else None,
            "detonate_armed": DETONATE[e["ArmedDetonateOn"]] if num(e.get("ArmedDetonateOn")) else None,
            "on_body_unarmed": PLAYER_IMPACT[e["UnarmedPlayerImpactType"]] if num(e.get("UnarmedPlayerImpactType")) else None,
            "on_body_armed": PLAYER_IMPACT[e["ArmedPlayerImpactType"]] if num(e.get("ArmedPlayerImpactType")) else None,
        }))
    dts = {k: class_ref(e.get(k)) for k in ("DamageType", "DamageTypeHead", "DamageTypeArm") if class_ref(e.get(k))}
    if dts.get("DamageType"):
        out["damage_effects"] = damage_effects(dts["DamageType"], aux)
    out["_raw"] = {k: v for k, v in e.items() if k not in ("FireSound", "MuzzleFlashClass", "FlashBone", "FlashScaleFactor",
                                                          "BotRefireRate", "WarnTargetPct", "ShotTypeString", "TracerClass",
                                                          "ImpactManager", "ProjectileClass", "SpawnOffset")}
    out["_raw"].update({f"_{k}": v for k, v in dts.items()})
    return out


def damage_effects(dt_cls, aux):
    """Gameplay side effects defined on BW damage types (block, displacement, slow-on-hit...)."""
    d = (aux.get(dt_cls) or {}).get("defaults") or {}
    desc = d.get("DamageDescription") or ""
    forms = [t for t in desc.strip(",").split(",") if t]
    out = clean({
        "forms": forms or None,
        "blockable": bool(d.get("bCanBeBlocked", False)),
        "block_bypass": d.get("BlockPenetration"),
        "block_fatigue": d.get("BlockFatiguePenalty") if d.get("bCanBeBlocked") else None,
        "displaces_aim": DISPLACE[d["DisplacementType"]] if num(d.get("DisplacementType")) and d.get("DisplacementType") else None,
        "displace_min_damage": d.get("AimDisplacementDamageThreshold") if d.get("DisplacementType") else None,
        "displace_s": sec(d.get("AimDisplacementDuration")) if d.get("DisplacementType") else None,
        "hit_slow_mult": d.get("TagMultiplier") if d.get("TagDuration") else None,
        "hit_slow_s": sec(d.get("TagDuration")) if d.get("TagDuration") else None,
        "shield_damage": d.get("ShieldDamage"),
        "ignites": bool(d.get("bIgniteFires")) or None,
        "detonates_explosives": d.get("bDetonatesBombs"),
        "vehicle_damage_mult": d.get("VehicleDamageScaling"),
        "headshot_type": bool(d.get("bHeaddie")) or None,
    })
    out["_raw_class"] = dt_cls
    return out


def conv_fire(f, mode, aux, fire_cls_defaults):
    if not isinstance(f, dict):
        return None
    iv = f.get("FireInterval")
    fam = None
    if mode is not None:
        mid = mode.get("mode_id")
        fam = {"WM_SemiAuto": "semi", "WM_FullAuto": "auto", "WM_Burst": "burst", "WM_BigBurst": "burst"}.get(mid, "special")
    out = clean({
        "trigger": fam,
        "burst_count": int(mode["value"]) if fam == "burst" else None,
        "burst_repeats_on_hold": (mode.get("mode_id") == "WM_Burst") if fam == "burst" else None,
        "interval_s": sec(iv),
        "rpm": round(60.0 / sec(iv), 1) if iv else None,
        "ammo_per_shot": f.get("AmmoPerFire"),
        "windup_s": sec(f.get("PreFireTime")) if f.get("PreFireTime") else None,
        "max_charge_s": sec(f.get("MaxHoldTime")) if f.get("MaxHoldTime") else None,
        "cock_after_shot": bool(f.get("bCockAfterFire") or fire_cls_defaults.get("bCockAfterFire")) or None,
        "fires_on_release": bool(fire_cls_defaults.get("bFireOnRelease")) or None,
        "code_state": f.get("TargetState"),
    })
    if fam == "burst" and iv:
        fac = f.get("BurstFireRateFactor", 0.65)
        n = int(mode["value"])
        out["burst_shot_interval_s"] = sec(iv * fac)
        out["burst_cooldown_s"] = sec(iv * (1 + n * (1 - fac)))
    out["effects"] = [conv_effect(e, aux) for e in as_list(f.get("FireEffectParams")) if isinstance(e, dict)]
    for e in out["effects"]:
        if e.get("payload") == "melee":
            # BallisticMeleeFire: no hit zones unless the class turns positional damage back on; the hold
            # bonus only exists for release-to-strike modes; backstab is switched on the fire class
            if fire_cls_defaults.get("bNoPositionalDamage", True):
                e["head_mult"], e["limb_mult"] = 1.0, 1.0
            if not fire_cls_defaults.get("bFireOnRelease"):
                e.pop("charge_bonus_mult", None)
            else:
                e["max_charge_s"] = sec(fire_cls_defaults.get("MaxBonusHoldTime", 1.5))
            if not fire_cls_defaults.get("bCanBackstab", True):
                e.pop("flank_mult", None)
                e.pop("back_mult", None)
            # fatigue: BallisticMeleeFire.ApplyFireEffectParams copies the params' Fatigue over the class
            # default, so the params value (already in fatigue_per_hit, 0 when unset) is the effective one
    e0 = out["effects"][0] if out["effects"] else {}
    if num(e0.get("damage")) and iv:
        shot = e0["damage"] * e0.get("pellets", 1)
        out["dps"] = round(shot / sec(iv), 1)  # sustained; bursts average out to the same rate
        if shot > 0:
            out["shots_to_kill"] = {
                "human_body": math.ceil(HP_HUMAN / shot), "merc_body": math.ceil(HP_MERC / shot),
                "merc_head": math.ceil(HP_MERC / (shot * e0.get("head_mult", 1.0))) if e0.get("head_mult") else None,
            }
    out["_raw"] = raw(f, ["FireInterval", "AmmoPerFire", "BurstFireRateFactor", "PreFireTime", "MaxHoldTime", "bCockAfterFire", "TargetState", "_object"])
    return out


def conv_melee_class(cls, aux):
    """Weapon-swing melee (the Melee key) comes from the weapon's MeleeFireClass defaults, not params."""
    d = (aux.get(cls) or {}).get("defaults") or {}
    if not d:
        return None
    tr = d.get("TraceRange") or {}
    out = clean({
        "damage": d.get("Damage"),
        "range_m": m(tr.get("Max")),
        "interval_s": sec(d.get("FireRate")),
        "max_charge_s": sec(d.get("MaxBonusHoldTime")),
        "charge_bonus_mult": 1 + d.get("ChargeDamageBonusFactor", 1.0),  # damage x(1 + factor * hold / max) in BW
        "flank_mult": d.get("FlankDamageMult"),
        "back_mult": d.get("BackDamageMult") if d.get("bCanBackstab", True) else None,
        "fatigue_per_hit": d.get("FatiguePerStrike"),
        "knockback_ns": impulse(d.get("KickForce")),
        "lunge_stop": d.get("HookStopFactor"),
        "lunge_pull_mps": mps(d.get("HookPullForce")),
        "fires_on_release": bool(d.get("bFireOnRelease")) or None,
    })
    dt = class_ref(d.get("DamageType")) or class_ref(d.get("DamageTypeArm"))
    if dt:
        out["damage_effects"] = damage_effects(dt, aux)
    out["_raw"] = {"class": cls, **raw(d, ["Damage", "TraceRange", "FireRate", "MaxBonusHoldTime", "ChargeDamageBonusFactor",
                                            "FlankDamageMult", "BackDamageMult", "bCanBackstab", "FatiguePerStrike", "KickForce",
                                            "HookStopFactor", "HookPullForce", "bFireOnRelease", "DamageType", "DamageTypeArm"])}
    return out


def conv_layout(L, w, aux, fire_cls):
    keys = ["LayoutName", "LayoutTags", "MagAmmo", "bMagPlusOne", "PlayerSpeedFactor", "PlayerJumpFactor", "SightMoveSpeedFactor",
            "SightingTime", "InventorySize", "ZoomType", "MaxZoom", "MinZoom", "ZoomStages", "bNeedCock", "bDualBlocked",
            "bDualMixing", "DisplaceDurationMult", "ReloadAnimRate", "CockAnimRate", "InitialWeaponMode", "WeaponPrice", "bNoaltfire"]
    wd = w["weapon"]
    zt = L.get("ZoomType", wd.get("ZoomType", 0))
    out = clean({
        "name": L.get("LayoutName"),
        "origin": L.get("_origin"),
        "tags_bw": L.get("LayoutTags"),
        "magazine": L.get("MagAmmo"),
        "mag_plus_one": bool(L.get("bMagPlusOne")) or None,
        "move_speed_mult": L.get("PlayerSpeedFactor"),
        "jump_mult": L.get("PlayerJumpFactor"),
        "ads_move_speed_mult": L.get("SightMoveSpeedFactor"),
        "ads_time_s": sec(L.get("SightingTime")),
        "bulk": L.get("InventorySize"),
        "zoom_type": ZOOM_TYPES[zt] if num(zt) and zt < len(ZOOM_TYPES) else None,
        "zoom_max": L.get("MaxZoom") if zt else None,
        "zoom_min": L.get("MinZoom") if zt and L.get("MinZoom") else None,
        "zoom_stages": L.get("ZoomStages") if zt and L.get("ZoomStages") else None,
        "cock_on_draw": bool(L.get("bNeedCock")) or None,
        "dual_blocked": bool(L.get("bDualBlocked")) or None,
        "dual_mixing": bool(L.get("bDualMixing")) or None,
        "displace_time_mult": L.get("DisplaceDurationMult"),
        "reload_speed_mult": L.get("ReloadAnimRate"),
        "cock_speed_mult": L.get("CockAnimRate"),
    })
    out["recoil"] = [conv_recoil(r) for r in as_list(L.get("RecoilParams")) if isinstance(r, dict)]
    out["aim"] = [conv_aim(a) for a in as_list(L.get("AimParams")) if isinstance(a, dict)]
    modes = []
    for md in L.get("modes", []):
        modes.append(clean({
            "name": md.get("name"),
            "origin": md.get("origin"),
            "recoil_index": md.get("recoil_index") or None,
            "aim_index": md.get("aim_index") or None,
            "primary": conv_fire(md.get("fire"), md, aux, fire_cls[0]),
            "secondary": conv_fire(md.get("alt_fire"), None, aux, fire_cls[1]),
            "_raw": {k: md.get(k) for k in ("name", "mode_id", "value", "pro_name", "bw_index", "bw_index_pro")},
        }))
    out["modes"] = modes
    for key, ci in (("extra_fire", 0), ("extra_alt_fire", 1)):
        if L.get(key):
            out[key] = [{"bw_index": x["bw_index"], "params": conv_fire(x["params"], None, aux, fire_cls[ci])} for x in L[key]]
    out["_raw"] = raw(L, keys + ["_pro_layout", "_pro_match", "_handling_from"])
    out["kit_estimates"] = kit_estimates(out, w)
    return out


def kit_estimates(layout, w):
    """Starting values for kit-only fields (rules 3 and 4, impulse model inputs). They use the
    bulk-based mass estimate; the weapon entry recomputes them with the mass it settles on."""
    mass = recoil_model.BULK_MASS_KG.get(layout.get("bulk"), 4.0)
    melee = bool(w["weapon"].get("bMeleeWeapon"))
    hold = "melee" if melee else ("two_hand" if "BallisticHandgun" in w.get("class_chain", []) else
                                  "hip_braced" if (layout.get("bulk") or 0) >= 11 and (layout.get("move_speed_mult") or 1) <= 0.85 else "shouldered")
    zoom = layout.get("zoom_max") if layout.get("zoom_type") not in (None, "irons") else None
    est = {"mass_kg": mass, "hold": hold, "hip_divisor": round(handling_model.hip_divisor(mass), 3),
           "ads_run_instability": handling_model.ads_run_instability(mass, hold, zoom, melee), "hip_drift_deg": []}
    for a in layout.get("aim", []):
        lo, hi = handling_model.tightened_drift(a.get("drift_min_deg"), a.get("drift_max_deg"), mass)
        est["hip_drift_deg"].append([lo, hi])
    return est


def conv_weapon(w, aux):
    wd = w["weapon"]
    fire_refs = as_list(wd.get("FireModeClass"))
    fire_cls = [((aux.get(class_ref(r)) or {}).get("defaults") or {}) for r in fire_refs] + [{}, {}]
    reserve = []
    for i, d in enumerate(fire_cls[:2]):
        ac = class_ref(d.get("AmmoClass"))
        ad = (aux.get(ac) or {}).get("defaults") or {}
        if ac and ac not in [r["_raw_class"] for r in reserve]:
            reserve.append(clean({"used_by": ["primary", "secondary"][i], "max": ad.get("MaxAmmo"), "initial": ad.get("InitialAmount"),
                                  "_raw_class": ac}))
    chain = w.get("class_chain", [])
    out = {
        "class": w["class"], "package": w["package"], "registered": w["registered"], "bw_name": w["fallback_name"],
        "base_ruleset": w["base_ruleset"], "flags": w["flags"],
        "weapon": clean({
            "draw_s": sec(wd.get("BringUpTime")),
            "holster_s": sec(wd.get("PutDownTime")),
            "draw_and_cock_s": sec(wd.get("CockingBringUpTime")),
            "reload_hint_s": sec(wd.get("AIReloadTime")),
            "gun_length_m": m(wd.get("GunLength")),
            "aim_disabled": bool(wd.get("bAimDisabled")) or None,
            "melee_weapon": bool(wd.get("bMeleeWeapon")) or None,
            "no_magazine": bool(wd.get("bNoMag")) or None,
            "never_cocks": bool(wd.get("bNonCocking")) or None,
            "cock_after_reload": bool(wd.get("bCockAfterReload")) or None,
            "cock_on_empty": bool(wd.get("bCockOnEmpty")) or None,
            "shell_by_shell": bool(wd.get("bShovelLoad")) or None,
            "shells_per_load": wd.get("ShovelIncrement") if wd.get("bShovelLoad") else None,
            "reload_interruptible": bool(wd.get("bCanSkipReload")) or None,
            "uses_sights": wd.get("bUseSights"),
            "sight_zoom": wd.get("SightZoomFactor"),
            "dual_wieldable": ("BallisticHandgun" in chain) or None,
            "bw_flags": sorted(k for k, v in wd.items() if k.startswith("bWT_") and v) or None,
            "inventory_group": wd.get("InventoryGroup"),
        }),
        "reserve_ammo": reserve,
        "melee": conv_melee_class(class_ref(wd.get("MeleeFireClass")), aux) if wd.get("MeleeFireClass") else None,
        "layouts": [conv_layout(L, w, aux, fire_cls) for L in w["layouts"]],
    }
    out["weapon"]["_raw"] = {k: wd.get(k) for k in ("BringUpTime", "PutDownTime", "CockingBringUpTime", "AIReloadTime", "GunLength",
                                                    "bNoMag", "bNonCocking", "bCockAfterReload", "bCockOnEmpty", "bShovelLoad",
                                                    "ShovelIncrement", "bCanSkipReload", "InventoryGroup", "MeleeFireClass", "FireModeClass")
                             if k in wd}
    return out


def main(canon_path, aux_path, out_path):
    canon = json.load(open(canon_path, encoding="utf-8"))
    aux = json.load(open(aux_path, encoding="utf-8"))
    out = {cls: conv_weapon(w, aux) for cls, w in sorted(canon.items())}
    with open(out_path, "w", encoding="utf-8", newline="\r\n") as fh:
        json.dump({"_units": {
            "distance": "m (52.5 uu = 1 m)", "angle": "deg (65536 rot = 360 deg)",
            "time": "real seconds (BW game seconds / 1.1 time dilation)", "speed": "m/s (uu/s * 1.1 / 52.5)",
            "impulse": "N*s on a 100 kg reference body (UT momentum * 1.1 / 52.5)", "damage": "HP (100 human, 200 merc)",
        }, "weapons": out}, fh, indent=1, ensure_ascii=False)
    print(f"{len(out)} weapons -> {out_path}")


if __name__ == "__main__":
    main(*sys.argv[1:4])
