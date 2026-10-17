class BallisticShieldWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Riot Shield"
		PlayerSpeedFactor=0.9500000
		InventorySize=2
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams-Civ'
	begin object name="ArenaParams-Civ" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Police Shield"
		PlayerSpeedFactor=0.9500000
		InventorySize=2
		LayoutMesh=SkeletalMesh'BWBP_OP_Anim.CivShield_FPm'
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams-Civ
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams-Junk'
	begin object name="ArenaParams-Junk" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Junk Shield"
		PlayerSpeedFactor=0.9500000
		InventorySize=2
		LayoutMesh=SkeletalMesh'BWBP_OP_Anim.JunkShield_FPm'
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[2]=ArenaParams-Junk
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=0
	PreFireAnim="PrepSmashAlt"
	FireAnim="SmashAlt"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	FireAnim="Bash1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.1500000
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=65
	DamageType=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeHead=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeArm=Class'BWBP_OP_Pro.DTBallisticShield'
	HookStopFactor=1.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.5000000
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=80
	DamageType=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeHead=Class'BWBP_OP_Pro.DTBallisticShield'
	DamageTypeArm=Class'BWBP_OP_Pro.DTBallisticShield'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Riot Shield"
	PlayerSpeedFactor=0.9500000
	InventorySize=2
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams-Civ'
begin object name="ArenaParams-Civ" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Police Shield"
	PlayerSpeedFactor=0.9500000
	InventorySize=2
	LayoutMesh=SkeletalMesh'BWBP_OP_Anim.CivShield_FPm'
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaParams-Junk'
begin object name="ArenaParams-Junk" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Junk Shield"
	PlayerSpeedFactor=0.9500000
	InventorySize=2
	LayoutMesh=SkeletalMesh'BWBP_OP_Anim.JunkShield_FPm'
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsComp.ArenaSecondaryFireParams'
end object
