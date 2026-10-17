class HKMKSpecWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.0500000
		InventorySize=2
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=0.0000000,Y=-4.3000000,Z=11.6000000)
		SightPivot=(Pitch=-70,Yaw=0,Roll=0)
		DisplaceDurationMult=0.3300000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	RangeAtten=0.3000000
	Damage=30
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	Recoil=200.0000000
	Chaos=0.2800000
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2100000
	FireEndAnim="None"
	FireAnimRate=1.8000000
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=8
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHeadAlt'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6300000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimAdjustTime=0.3500000
	ADSMultiplier=2.0000000
	ViewBindFactor=0.4000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=1400
end object
// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.0500000
	InventorySize=2
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-4.3000000,Z=11.6000000)
	SightPivot=(Pitch=-70,Yaw=0,Roll=0)
	DisplaceDurationMult=0.3300000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParams.ArenaSecondaryFireParams'
end object
