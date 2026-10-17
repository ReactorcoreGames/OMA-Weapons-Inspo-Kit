class MRDRWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=900,Yaw=0,Roll=-800)
		ViewOffset=(X=-2.0000000,Y=9.0000000,Z=-5.0000000)
		MagAmmo=36
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2000.0000000
	RangeAtten=0.6000000
	Damage=18
	HeadMult=3.1666660
	LimbMult=0.3888880
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=16.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.4285710
	LimbMult=0.7142850
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88SpikeHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.2000000),(InVal=0.2000000,OutVal=0.5000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=1024.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=513)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0500000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=1200
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=900,Yaw=0,Roll=-800)
	ViewOffset=(X=-2.0000000,Y=9.0000000,Z=-5.0000000)
	MagAmmo=36
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsClassic.ClassicSecondaryFireParams'
end object
