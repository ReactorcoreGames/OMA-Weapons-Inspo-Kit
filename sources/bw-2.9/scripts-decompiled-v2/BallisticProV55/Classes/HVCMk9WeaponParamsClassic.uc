class HVCMk9WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.7500000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		ViewOffset=(X=9.0000000,Y=9.0000000,Z=-7.0000000)
		RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireStart',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=6000,Y=6000)
	SpreadMode=2
	BotRefireRate=0.9900000
end object
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="BranchingFire"
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=1600.0000000)
	WaterTraceRange=5000.0000000
	Damage=285
	HeadMult=1.3157890
	LimbMult=0.7543850
	DamageType=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCRedLightning'
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	PushbackForce=1600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2048)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.7500000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	ViewOffset=(X=9.0000000,Y=9.0000000,Z=-7.0000000)
	RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsClassic.ClassicSecondaryFireParams'
end object
