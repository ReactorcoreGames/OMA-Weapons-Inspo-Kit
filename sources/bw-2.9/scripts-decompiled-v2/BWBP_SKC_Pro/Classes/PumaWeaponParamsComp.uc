class PumaWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4500000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=2,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=3,Scale=0.0000000)
		MagAmmo=6
		WeaponModes[0]=(ModeName="Airburst: Impact Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Airburst: Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Airburst: Variable Range Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryImpactFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryProxyFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryRangeFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryShieldFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Gray'
	begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUMA_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Black'
	begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUMA_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_HexGreen'
	begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUMA_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_HexBlue'
	begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUMA_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Wood'
	begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Classic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUMA_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Pants'
	begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=PUMA_Pants
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Gold'
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
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryImpactEffectParams'
begin object name="ArenaPrimaryImpactEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileImpact'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6500.0000000
	Damage=100.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryImpactFireParams'
begin object name="ArenaPrimaryImpactFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryImpactEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryProxyEffectParams'
begin object name="ArenaPrimaryProxyEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4000.0000000
	Damage=85.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryProxyFireParams'
begin object name="ArenaPrimaryProxyFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1250000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryProxyEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryRangeEffectParams'
begin object name="ArenaPrimaryRangeEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileRanged'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=85.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryRangeFireParams'
begin object name="ArenaPrimaryRangeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryRangeEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryShieldEffectParams'
begin object name="ArenaPrimaryShieldEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileClose'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryShieldFireParams'
begin object name="ArenaPrimaryShieldFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1250000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryShieldEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FlashScaleFactor=0.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.0700000),(InVal=0.6000000,OutVal=-0.0600000),(InVal=0.7000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.4500000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	OffsetAdjustTime=0.6000000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-7000,Yaw=-3000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	JumpChaos=0.7000000
	FallingChaos=0.2000000
	SprintChaos=0.2000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4500000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=2,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=3,Scale=0.0000000)
	MagAmmo=6
	WeaponModes[0]=(ModeName="Airburst: Impact Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Airburst: Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Airburst: Variable Range Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryImpactFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryProxyFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryRangeFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaPrimaryShieldFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Gray'
begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Black'
begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_HexGreen'
begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_HexBlue'
begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Wood'
begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Classic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Pants'
begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsComp.PUMA_Gold'
begin object name="PUMA_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackGold",Index=2,pIndex=2,AIndex=1)
	Index=6
end object
