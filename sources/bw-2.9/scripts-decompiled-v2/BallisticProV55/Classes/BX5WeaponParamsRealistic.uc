class BX5WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		SightMoveSpeedFactor=0.5000000
		RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.BX5VehicleMine'
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	Damage=500.0000000
	DamageRadius=600.0000000
	MomentumTransfer=100000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	FireAnim="Deploy"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Spring mode"
end object
// Reference: FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	SightMoveSpeedFactor=0.5000000
	RecoilParams[0]=RecoilParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BX5WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
