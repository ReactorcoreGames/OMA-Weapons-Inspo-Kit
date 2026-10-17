class BallisticShieldWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Riot Shield"
		PlayerSpeedFactor=0.9000000
		InventorySize=4
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams-Civ'
	begin object name="ClassicParams-Civ" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Police Shield"
		PlayerSpeedFactor=0.9000000
		InventorySize=4
		LayoutMesh=SkeletalMesh'BWBP_OP_Anim.CivShield_FPm'
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams-Civ
	// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams-Junk'
	begin object name="ClassicParams-Junk" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Junk Shield"
		PlayerSpeedFactor=0.9000000
		InventorySize=4
		LayoutMesh=SkeletalMesh'BWBP_OP_Anim.JunkShield_FPm'
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams-Junk
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=0
	PreFireAnim="PrepSmashAlt"
	FireAnim="SmashAlt"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	FireAnim="Bash1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
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
// Reference: MeleeEffectParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
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
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Riot Shield"
	PlayerSpeedFactor=0.9000000
	InventorySize=4
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams-Civ'
begin object name="ClassicParams-Civ" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Police Shield"
	PlayerSpeedFactor=0.9000000
	InventorySize=4
	LayoutMesh=SkeletalMesh'BWBP_OP_Anim.CivShield_FPm'
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicParams-Junk'
begin object name="ClassicParams-Junk" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Junk Shield"
	PlayerSpeedFactor=0.9000000
	InventorySize=4
	LayoutMesh=SkeletalMesh'BWBP_OP_Anim.JunkShield_FPm'
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.BallisticShieldWeaponParamsClassic.ClassicSecondaryFireParams'
end object
