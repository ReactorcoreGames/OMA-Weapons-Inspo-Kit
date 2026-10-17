class PumaWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		WeaponName="PUMA-77 Target Engagement System"
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryImpactFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryProxyFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryRangeFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryShieldFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Gray'
	begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUMA_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Black'
	begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUMA_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_HexGreen'
	begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUMA_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_HexBlue'
	begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUMA_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Wood'
	begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Classic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUMA_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Pants'
	begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=PUMA_Pants
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Gold'
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
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryImpactEffectParams'
begin object name="RealisticPrimaryImpactEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileImpact'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=12500.0000000
	Damage=70.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryImpactFireParams'
begin object name="RealisticPrimaryImpactFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryImpactEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryProxyEffectParams'
begin object name="RealisticPrimaryProxyEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=12500.0000000
	Damage=55.0000000
	DamageRadius=270.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryProxyFireParams'
begin object name="RealisticPrimaryProxyFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryProxyEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryRangeEffectParams'
begin object name="RealisticPrimaryRangeEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileRanged'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=55.0000000
	DamageRadius=270.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryRangeFireParams'
begin object name="RealisticPrimaryRangeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryRangeEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryShieldEffectParams'
begin object name="RealisticPrimaryShieldEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileClose'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=55.0000000
	DamageRadius=270.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryShieldFireParams'
begin object name="RealisticPrimaryShieldFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryShieldEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.4000000
	YawFactor=0.4000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	DeclineTime=1.5000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
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
// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	WeaponName="PUMA-77 Target Engagement System"
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryImpactFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryProxyFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryRangeFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsRealistic.RealisticPrimaryShieldFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Gray'
begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Black'
begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_HexGreen'
begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_HexBlue'
begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Wood'
begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Classic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Pants'
begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsRealistic.PUMA_Gold'
begin object name="PUMA_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackGold",Index=2,pIndex=2,AIndex=1)
	Index=6
end object
