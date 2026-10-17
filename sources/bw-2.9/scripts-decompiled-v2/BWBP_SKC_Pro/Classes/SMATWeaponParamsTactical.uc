class SMATWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="HEDP Warhead"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5000000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=8.0000000
		ZoomStages=2
		WeaponName="S.M.A.T. 105mm Recoilless Rifle"
		DisplaceDurationMult=1.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalParams_Ice'
	begin object name="TacticalParams_Ice" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CRYO Warhead"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5000000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=8.0000000
		ZoomStages=2
		WeaponName="S.M.A.T. 105mm Recoilless Rifle (CRYO)"
		DisplaceDurationMult=1.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams_Ice'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Ice
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Green'
	begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=SMAT_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Urban'
	begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=SMAT_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Ocean'
	begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=SMAT_Ocean
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Orange'
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-1000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryEffectParams_Ice'
begin object name="TacticalPrimaryEffectParams_Ice" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams_Ice'
begin object name="TacticalPrimaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryEffectParams_Ice'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="HEDP Warhead"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5000000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=2
	WeaponName="S.M.A.T. 105mm Recoilless Rifle"
	DisplaceDurationMult=1.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalParams_Ice'
begin object name="TacticalParams_Ice" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CRYO Warhead"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5000000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=2
	WeaponName="S.M.A.T. 105mm Recoilless Rifle (CRYO)"
	DisplaceDurationMult=1.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalPrimaryFireParams_Ice'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Green'
begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Urban'
begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Ocean'
begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsTactical.SMAT_Orange'
begin object name="SMAT_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainOrange",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscOrange",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
