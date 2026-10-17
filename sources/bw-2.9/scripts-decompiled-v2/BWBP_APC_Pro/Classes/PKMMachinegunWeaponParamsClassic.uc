class PKMMachinegunWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=9
		SightingTime=0.5500000
		SightOffset=(X=-5.0000000,Y=-1.1050000,Z=15.0000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		MagAmmo=75
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.3500000
	Damage=27
	DamageType=Class'BWBP_APC_Pro.DTPKM'
	DamageTypeHead=Class'BWBP_APC_Pro.DTPKMHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTPKM'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMFlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.rpk940.RPK-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=192.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.PKMRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=6000.0000000
	Damage=125.0000000
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
// Reference: FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="KnifeFirePrep"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.3000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5000000
	YawFactor=0.5000000
	XRandFactor=0.3400000
	YRandFactor=0.3400000
	MaxRecoil=2048.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=2048)
	SprintOffset=(Pitch=-4000,Yaw=-8000,Roll=0)
	ChaosDeclineTime=1.6000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=9
	SightingTime=0.5500000
	SightOffset=(X=-5.0000000,Y=-1.1050000,Z=15.0000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	MagAmmo=75
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.PKMMachinegunWeaponParamsClassic.ClassicSecondaryFireParams'
end object
