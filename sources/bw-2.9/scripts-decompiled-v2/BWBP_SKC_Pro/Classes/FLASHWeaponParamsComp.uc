class FLASHWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		ZoomType=1
		ScopeScale=0.7000000
		MaxZoom=2.0000000
		DisplaceDurationMult=1.2500000
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Green'
	begin object name="FLASH_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=FLASH_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Black'
	begin object name="FLASH_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoBlack",Index=3,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=FLASH_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Winter'
	begin object name="FLASH_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoWhite",Index=3,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=FLASH_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Pink'
	begin object name="FLASH_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoFAB",Index=3,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=FLASH_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Glitch'
	begin object name="FLASH_Glitch" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="11011"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-Charged",Index=3,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=FLASH_Glitch
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.FLASHProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=4500.0000000
	Damage=80.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-FireInc',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.FLASHProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=4500.0000000
	Damage=80.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=3.5000000
	FireAnim="Fireall"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1536)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	AimDamageThreshold=300
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	ZoomType=1
	ScopeScale=0.7000000
	MaxZoom=2.0000000
	DisplaceDurationMult=1.2500000
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FLASHWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Green'
begin object name="FLASH_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Black'
begin object name="FLASH_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoBlack",Index=3,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Winter'
begin object name="FLASH_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoWhite",Index=3,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Pink'
begin object name="FLASH_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-CamoFAB",Index=3,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FLASHWeaponParamsComp.FLASH_Glitch'
begin object name="FLASH_Glitch" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="11011"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FLASHCamos.FLASH-Charged",Index=3,pIndex=0,AIndex=0)
	Index=4
end object
