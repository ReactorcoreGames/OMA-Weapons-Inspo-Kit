class PKMMachinegunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9200000
		InventorySize=7
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5500000
		SightOffset=(X=-2.0000000,Y=-1.1300000,Z=14.1000000)
		SightPivot=(Pitch=-64,Yaw=0,Roll=0)
		WeaponName="PKB-86 7.62mm GP Machinegun"
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=16000.0000000,Max=16000.0000000)
	DecayRange=(Min=3150.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=60
	DamageType=Class'BWBP_APC_Pro.DTPKM'
	DamageTypeHead=Class'BWBP_APC_Pro.DTPKMHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTPKM'
	PenetrationEnergy=36.0000000
	PenetrateForce=155
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMFlashEmitter'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.rpk940.RPK-Fire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=310.0000000
	Chaos=0.0800000
	Inaccuracy=(X=24,Y=24)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0920000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.PKMRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=6000.0000000
	Damage=155.0000000
	DamageRadius=360.0000000
	MomentumTransfer=2000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMRocketFlashEmitter'
	FireSound=(Sound=Sound'BWBP_APC_Sounds.rpk940.Fire',Volume=4.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=64,Y=64)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="KnifeFirePrep"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.3000000
	YawFactor=0.3000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=2960.0000000
	ClimbTime=0.0400000
	DeclineTime=1.1000000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9200000
	InventorySize=7
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5500000
	SightOffset=(X=-2.0000000,Y=-1.1300000,Z=14.1000000)
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	WeaponName="PKB-86 7.62mm GP Machinegun"
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
