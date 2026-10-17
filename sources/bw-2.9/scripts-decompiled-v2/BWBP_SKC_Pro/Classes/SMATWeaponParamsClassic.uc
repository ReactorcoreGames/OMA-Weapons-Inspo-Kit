class SMATWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicParams_AT'
	begin object name="ClassicParams_AT" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="HEDP Warhead"
		PlayerSpeedFactor=0.8000000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		ZoomType=2
		MagAmmo=1
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_AT
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicParams_ICE'
	begin object name="ClassicParams_ICE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CRYO Warhead"
		PlayerSpeedFactor=0.8000000
		InventorySize=12
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		ZoomType=2
		MagAmmo=1
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams_Ice'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_ICE
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Green'
	begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=SMAT_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Urban'
	begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=SMAT_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Ocean'
	begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=SMAT_Ocean
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Orange'
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=1524.0000000
	DeclineTime=1.0000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=180,Max=2600)
	AimAdjustTime=0.7000000
	OffsetAdjustTime=0.6000000
	CrouchMultiplier=0.4000000
	ADSMultiplier=0.1000000
	SprintOffset=(Pitch=-6000,Yaw=-1000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=2.8000000
	ChaosSpeedThreshold=380
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=200.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=100000.0000000
	Damage=600.0000000
	DamageRadius=160.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryEffectParams_Ice'
begin object name="ClassicPrimaryEffectParams_Ice" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocketIce'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=200.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=100000.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams_Ice'
begin object name="ClassicPrimaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryEffectParams_Ice'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATGrenade'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=100.0000000
	MaxSpeed=100.0000000
	AccelSpeed=100.0000000
	Damage=1512.0000000
	DamageRadius=768.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
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
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicParams_AT'
begin object name="ClassicParams_AT" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="HEDP Warhead"
	PlayerSpeedFactor=0.8000000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	ZoomType=2
	MagAmmo=1
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicParams_ICE'
begin object name="ClassicParams_ICE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CRYO Warhead"
	PlayerSpeedFactor=0.8000000
	InventorySize=12
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	ZoomType=2
	MagAmmo=1
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicPrimaryFireParams_Ice'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Green'
begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Urban'
begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Ocean'
begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsClassic.SMAT_Orange'
begin object name="SMAT_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainOrange",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscOrange",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
