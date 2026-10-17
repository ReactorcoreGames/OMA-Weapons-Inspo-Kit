class A42WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=900
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponName="A42 Skrith Blaster"
		AllowedCamos[0]=0
		MagAmmo=72
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsRealistic.RealisticParams_TriShot'
	begin object name="RealisticParams_TriShot" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="elite"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponName="A48-E Skrith Blaster"
		AllowedCamos[0]=1
		MagAmmo=72
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams_TriShot'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_TriShot
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsRealistic.A42_Blue'
	begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A42_Blue
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsRealistic.A42_Red'
	begin object name="A42_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.A42Layouts.A48Skin_SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=A42_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.A42WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=600
end object
// Reference: RecoilParams'BallisticProV55.A42WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=1536.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireAnim="SecFire"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=1200.0000000
	MaxSpeed=5000.0000000
	AccelSpeed=20000.0000000
	Damage=30.0000000
	DamageRadius=48.0000000
	MomentumTransfer=100.0000000
	HeadMult=2.5000000
	LimbMult=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=85.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.7500000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryEffectParams_TriShot'
begin object name="RealisticPrimaryEffectParams_TriShot" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42ProjectileBal'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=1200.0000000
	MaxSpeed=5000.0000000
	AccelSpeed=20000.0000000
	Damage=30.0000000
	DamageRadius=42.0000000
	MomentumTransfer=150.0000000
	HeadMult=2.5000000
	LimbMult=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitterBal'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7500000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=252.0000000
	Chaos=0.0300000
	Inaccuracy=(X=92,Y=92)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams_TriShot'
begin object name="RealisticPrimaryFireParams_TriShot" class=BCoreProV55.FireParams
	FireInterval=0.2400000
	TargetState="SpreadShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryEffectParams_TriShot'
end object
// Reference: FireEffectParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-SecFire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=84.0000000
	Chaos=0.0100000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=900
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponName="A42 Skrith Blaster"
	AllowedCamos[0]=0
	MagAmmo=72
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsRealistic.RealisticParams_TriShot'
begin object name="RealisticParams_TriShot" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="elite"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponName="A48-E Skrith Blaster"
	AllowedCamos[0]=1
	MagAmmo=72
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticPrimaryFireParams_TriShot'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsRealistic.A42_Blue'
begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsRealistic.A42_Red'
begin object name="A42_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.A42Layouts.A48Skin_SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
