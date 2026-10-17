class LAWWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7000000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.7500000
		ZoomType=2
		WeaponName="FGM-70 'Shockwave' 152mm Anti-Tank Weapon"
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Green'
	begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="OD Green"
	end object
	Camos[0]=LAW_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Tan'
	begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=LAW_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Black'
	begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=LAW_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_RedTiger'
	begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=LAW_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Gold'
	begin object name="LAW_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainGold",Index=2,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=LAW_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWRocketHvy'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=1400.0000000
	MaxSpeed=30000.0000000
	AccelSpeed=60000.0000000
	Damage=400.0000000
	DamageRadius=1800.0000000
	MomentumTransfer=300000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-FireLoud',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1500.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=256,Y=256)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWGrenadeHvy'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4500.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1500.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=256,Y=256)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=1500.0000000
	DeclineTime=1.0000000
	CrouchMultiplier=0.4000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1300,Max=2960)
	AimAdjustTime=0.7500000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.8000000
	ChaosSpeedThreshold=380
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7000000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.7500000
	ZoomType=2
	WeaponName="FGM-70 'Shockwave' 152mm Anti-Tank Weapon"
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Green'
begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="OD Green"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Tan'
begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Black'
begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_RedTiger'
begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsRealistic.LAW_Gold'
begin object name="LAW_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainGold",Index=2,pIndex=0,AIndex=0)
	Index=4
end object
