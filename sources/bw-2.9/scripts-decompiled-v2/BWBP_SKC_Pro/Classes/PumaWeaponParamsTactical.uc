class PumaWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5000000
		WeaponBoneScales[0]=(BoneName="IronsRear",Slot=2,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="IronsFront",Slot=3,Scale=0.0000000)
		MagAmmo=6
		WeaponModes[0]=(ModeName="Airburst: Impact Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Airburst: Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Airburst: Variable Range Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryImpactFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryProxyFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryRangeFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryShieldFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Gray'
	begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUMA_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Black'
	begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUMA_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_HexGreen'
	begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUMA_HexGreen
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_HexBlue'
	begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUMA_HexBlue
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Wood'
	begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Classic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUMA_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Pants'
	begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=PUMA_Pants
	// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Gold'
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
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryImpactEffectParams'
begin object name="TacticalPrimaryImpactEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=120.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileImpact'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4200.0000000
	Damage=120.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryImpactFireParams'
begin object name="TacticalPrimaryImpactFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryImpactEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryProxyEffectParams'
begin object name="TacticalPrimaryProxyEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=105.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	Damage=105.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryProxyFireParams'
begin object name="TacticalPrimaryProxyFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1250000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryProxyEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryRangeEffectParams'
begin object name="TacticalPrimaryRangeEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=120.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileRanged'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4200.0000000
	Damage=105.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryRangeFireParams'
begin object name="TacticalPrimaryRangeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryRangeEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryShieldEffectParams'
begin object name="TacticalPrimaryShieldEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PumaProjectileClose'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4200.0000000
	Damage=160.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.PUMA.PUMA-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryShieldFireParams'
begin object name="TacticalPrimaryShieldFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1250000
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryShieldEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FlashScaleFactor=0.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.0700000),(InVal=0.6000000,OutVal=-0.0600000),(InVal=0.7000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.4500000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	OffsetAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.7000000
	FallingChaos=0.2000000
	SprintChaos=0.2000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5000000
	WeaponBoneScales[0]=(BoneName="IronsRear",Slot=2,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="IronsFront",Slot=3,Scale=0.0000000)
	MagAmmo=6
	WeaponModes[0]=(ModeName="Airburst: Impact Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Airburst: Proximity Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Airburst: Variable Range Detonation",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryImpactFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryProxyFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryRangeFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalPrimaryShieldFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PumaWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Gray'
begin object name="PUMA_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Black'
begin object name="PUMA_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-MainDark",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA2-BackDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_HexGreen'
begin object name="PUMA_HexGreen" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexGreen",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexGreen",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_HexBlue'
begin object name="PUMA_HexBlue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainHexBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackHexBlue",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Wood'
begin object name="PUMA_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Classic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainWood",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackWood",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Pants'
begin object name="PUMA_Pants" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainKitty",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackKitty",Index=2,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PumaWeaponParamsTactical.PUMA_Gold'
begin object name="PUMA_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PUMACamos.PUMA-BackGold",Index=2,pIndex=2,AIndex=1)
	Index=6
end object
