class G5WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.G5WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8250000
		PlayerJumpFactor=0.8500000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
		ZoomType=2
		WeaponName="G5 90mm Guided Missile Launcher"
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsRealistic.G5_UTC'
	begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="UTC Jungle"
	end object
	Camos[0]=G5_UTC
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsRealistic.G5_Pirate'
	begin object name="G5_Pirate" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Pirate Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=-1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAAScope",Index=2,pIndex=4,AIndex=5)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAARocket",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=G5_Pirate
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.G5WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.G5Rocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=800.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=8000.0000000
	Damage=250.0000000
	DamageRadius=350.0000000
	MomentumTransfer=75000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.1000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=1.2000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.G5WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.G5WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.G5WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=768.0000000
	DeclineTime=0.6500000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.G5WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=900,Max=2560)
	AimAdjustTime=0.4500000
	OffsetAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.3000000
	ChaosSpeedThreshold=475
end object
// Reference: WeaponParams'BallisticProV55.G5WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8250000
	PlayerJumpFactor=0.8500000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
	ZoomType=2
	WeaponName="G5 90mm Guided Missile Launcher"
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsRealistic.G5_UTC'
begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="UTC Jungle"
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsRealistic.G5_Pirate'
begin object name="G5_Pirate" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Pirate Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=-1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAAScope",Index=2,pIndex=4,AIndex=5)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAARocket",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
