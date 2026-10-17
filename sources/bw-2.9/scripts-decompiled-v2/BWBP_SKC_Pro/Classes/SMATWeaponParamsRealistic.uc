class SMATWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="HEDP Warhead"
		PlayerSpeedFactor=0.8050000
		PlayerJumpFactor=0.8500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		ZoomType=2
		WeaponName="S.M.A.T. 105mm Recoilless Rifle"
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticParams_Ice'
	begin object name="RealisticParams_Ice" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CRYO Warhead"
		PlayerSpeedFactor=0.8050000
		PlayerJumpFactor=0.8500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		ZoomType=2
		WeaponName="S.M.A.T. 105mm Recoilless Rifle (CRYO)"
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams_Ice'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Ice
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Green'
	begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=SMAT_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Urban'
	begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=SMAT_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Ocean'
	begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=SMAT_Ocean
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Orange'
	begin object name="SMAT_Orange" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainOrange",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscOrange",Index=2,pIndex=-1,AIndex=-1)
		Index=3
	end object
	Camos[3]=SMAT_Orange
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticRecoilParams'
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
// Reference: AimParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=900,Max=2560)
	AimAdjustTime=0.5500000
	OffsetAdjustTime=0.4500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-1000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.3000000
	ChaosSpeedThreshold=475
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=20000.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=1.0000000
	Damage=600.0000000
	DamageRadius=160.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-FireNewLoud2',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1524.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=5,Y=5)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryEffectParams_Ice'
begin object name="RealisticPrimaryEffectParams_Ice" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocketIce'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=20000.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=1.0000000
	Damage=100.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-FireIce',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=5,Y=5)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams_Ice'
begin object name="RealisticPrimaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryEffectParams_Ice'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATGrenade'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=100.0000000
	MaxSpeed=100.0000000
	AccelSpeed=100.0000000
	Damage=600.0000000
	DamageRadius=768.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Jump',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=5,Y=5)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="HEDP Warhead"
	PlayerSpeedFactor=0.8050000
	PlayerJumpFactor=0.8500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	ZoomType=2
	WeaponName="S.M.A.T. 105mm Recoilless Rifle"
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticParams_Ice'
begin object name="RealisticParams_Ice" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CRYO Warhead"
	PlayerSpeedFactor=0.8050000
	PlayerJumpFactor=0.8500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	ZoomType=2
	WeaponName="S.M.A.T. 105mm Recoilless Rifle (CRYO)"
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticPrimaryFireParams_Ice'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Green'
begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Urban'
begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Ocean'
begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsRealistic.SMAT_Orange'
begin object name="SMAT_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainOrange",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscOrange",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
