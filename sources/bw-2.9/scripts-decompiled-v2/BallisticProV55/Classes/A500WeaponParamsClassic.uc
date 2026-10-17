class A500WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A500WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Caustic Green"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Diamond",Slot=1,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="SuperCharger",Slot=2,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Stands",Slot=3,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Glass",Slot=4,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=15.0000000,Z=-8.0000000)
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500Projectile'
	Speed=6000.0000000
	MaxSpeed=6000.0000000
	Damage=16.0000000
	DamageRadius=64.0000000
	MomentumTransfer=100.0000000
	HeadMult=1.8750000
	LimbMult=0.4375000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_Fire1',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=950,Y=600)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A500WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A500AltProjectile'
	Speed=1000.0000000
	MaxSpeed=6000.0000000
	Damage=80.0000000
	DamageRadius=96.0000000
	MomentumTransfer=1000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Reptile.Rep_AltFire',Volume=1.8000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=-1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A500WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.A500WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.2700000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.1700000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.A500WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=650
end object
// Reference: WeaponParams'BallisticProV55.A500WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Caustic Green"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Diamond",Slot=1,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="SuperCharger",Slot=2,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Stands",Slot=3,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Glass",Slot=4,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=15.0000000,Z=-8.0000000)
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BallisticProV55.A500WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A500WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A500WeaponParamsClassic.ClassicSecondaryFireParams'
end object
