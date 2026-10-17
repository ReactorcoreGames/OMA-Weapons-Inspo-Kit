class PumaWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-1.5000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryImpactFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryProxyFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryRangeFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryShieldFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Gray'
	begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUMA_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Black'
	begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUMA_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_HexGreen'
	begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUMA_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_HexBlue'
	begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUMA_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Wood'
	begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Classic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUMA_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Pants'
	begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=PUMA_Pants
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Gold'
	begin object name="PUMA_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainGold",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackGold",Index=2,pIndex=2,AIndex=1)
		Index=6
	end object
	Camos[6]=PUMA_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryImpactEffectParams'
begin object name="ClassicPrimaryImpactEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileImpact'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6500.0000000
	Damage=60.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryImpactFireParams'
begin object name="ClassicPrimaryImpactFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryImpactEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryProxyEffectParams'
begin object name="ClassicPrimaryProxyEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=55.0000000
	DamageRadius=270.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryProxyFireParams'
begin object name="ClassicPrimaryProxyFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryProxyEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryRangeEffectParams'
begin object name="ClassicPrimaryRangeEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileRanged'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=55.0000000
	DamageRadius=270.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryRangeFireParams'
begin object name="ClassicPrimaryRangeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryRangeEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryShieldEffectParams'
begin object name="ClassicPrimaryShieldEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileClose'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=110.0000000
	DamageRadius=360.0000000
	MomentumTransfer=60000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryShieldFireParams'
begin object name="ClassicPrimaryShieldFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryShieldEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	DeclineTime=1.5000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1960)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-1.5000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryImpactFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryProxyFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryRangeFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsClassic.ClassicPrimaryShieldFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Gray'
begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Black'
begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_HexGreen'
begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_HexBlue'
begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Wood'
begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Classic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Pants'
begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsClassic.PUMA_Gold'
begin object name="PUMA_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackGold",Index=2,pIndex=2,AIndex=1)
	Index=6
end object
