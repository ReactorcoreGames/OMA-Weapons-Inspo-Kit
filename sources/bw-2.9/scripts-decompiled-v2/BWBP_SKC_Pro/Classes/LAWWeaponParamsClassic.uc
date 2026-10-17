class LAWWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7000000
		InventorySize=14
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.7500000
		ZoomType=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Green'
	begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="OD Green"
	end object
	Camos[0]=LAW_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Tan'
	begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=LAW_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Black'
	begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=LAW_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_RedTiger'
	begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=LAW_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Gold'
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
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWRocketHvy'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=7000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=1500.0000000
	Damage=250.0000000
	DamageRadius=1200.0000000
	MomentumTransfer=300000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-FireLoud',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=6024.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=256,Y=256)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWGrenadeHvy'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=3096.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=256,Y=256)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=9024.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.0000000
	CrouchMultiplier=0.4000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=70,Max=2600)
	AimAdjustTime=0.7500000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.4000000
	ADSMultiplier=0.1000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.8000000
	ChaosSpeedThreshold=380
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7000000
	InventorySize=14
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.7500000
	ZoomType=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Green'
begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="OD Green"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Tan'
begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Black'
begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_RedTiger'
begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsClassic.LAW_Gold'
begin object name="LAW_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainGold",Index=2,pIndex=0,AIndex=0)
	Index=4
end object
