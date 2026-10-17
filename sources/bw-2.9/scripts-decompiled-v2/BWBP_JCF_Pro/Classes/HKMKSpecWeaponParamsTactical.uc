class HKMKSpecWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightOffset=(X=0.0000000,Y=-4.3000000,Z=11.6000000)
		SightPivot=(Pitch=-70,Yaw=0,Roll=0)
		DisplaceDurationMult=0.3300000
		MagAmmo=8
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=28
	HeadMult=3.5000000
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.MK23.MkFire_1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2100000
	FireEndAnim="None"
	FireAnimRate=1.8000000
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	DecayRange=(Min=525.0000000,Max=1838.0000000)
	RangeAtten=0.2000000
	Damage=8
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTHKMKSpecPistolHeadAlt'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTHKMKSpecPistolAlt'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.5000000
end object
// Reference: AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.4000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-4.3000000,Z=11.6000000)
	SightPivot=(Pitch=-70,Yaw=0,Roll=0)
	DisplaceDurationMult=0.3300000
	MagAmmo=8
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.HKMKSpecWeaponParamsTactical.TacticalSecondaryFireParams'
end object
