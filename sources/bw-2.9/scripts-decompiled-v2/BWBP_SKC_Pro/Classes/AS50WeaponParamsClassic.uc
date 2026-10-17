class AS50WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.7000000
		ZoomType=2
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=7500000.0000000,Max=7500000.0000000)
	WaterTraceRange=6000000.0000000
	Damage=75
	HeadMult=2.5000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PenetrationEnergy=64.0000000
	PenetrateForce=220
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8500000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2300.0000000
	PushbackForce=255.0000000
	Chaos=1.5000000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	BurstFireRateFactor=1.0000000
	FireAnim="CFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.5500000
	MaxRecoil=6000.0000000
	DeclineTime=2.5000000
	DeclineDelay=0.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=3840)
	AimAdjustTime=0.9000000
	OffsetAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.8500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.5500000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.8000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.7000000
	ZoomType=2
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsClassic.ClassicPrimaryFireParams'
end object
