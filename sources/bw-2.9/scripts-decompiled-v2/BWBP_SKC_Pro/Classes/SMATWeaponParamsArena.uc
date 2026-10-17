class SMATWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="HEDP Warhead"
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5500000
		ZoomType=2
		DisplaceDurationMult=1.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaParams_Ice'
	begin object name="ArenaParams_Ice" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CRYO Warhead"
		PlayerSpeedFactor=0.9500000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5500000
		ZoomType=2
		DisplaceDurationMult=1.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams_Ice'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Ice
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Green'
	begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=SMAT_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Urban'
	begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=SMAT_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Ocean'
	begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=SMAT_Ocean
	// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Orange'
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
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	DeclineTime=1.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1024,Max=3048)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-6000,Yaw=-1000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=1000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=55000.0000000
	AccelSpeed=55000.0000000
	Damage=400.0000000
	DamageRadius=160.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-FireOld',Volume=7.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryEffectParams_Ice'
begin object name="ArenaPrimaryEffectParams_Ice" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATRocketIce'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=55000.0000000
	AccelSpeed=55000.0000000
	Damage=120.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SMAA.SMAT-FireIce',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams_Ice'
begin object name="ArenaPrimaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryEffectParams_Ice'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SMATGrenade'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=100.0000000
	MaxSpeed=100.0000000
	AccelSpeed=100.0000000
	Damage=1512.0000000
	DamageRadius=768.0000000
	MomentumTransfer=90000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.BX5.BX5-Jump',Volume=9.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="HEDP Warhead"
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5500000
	ZoomType=2
	DisplaceDurationMult=1.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaParams_Ice'
begin object name="ArenaParams_Ice" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CRYO Warhead"
	PlayerSpeedFactor=0.9500000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5500000
	ZoomType=2
	DisplaceDurationMult=1.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaPrimaryFireParams_Ice'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SMATWeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Green'
begin object name="SMAT_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Urban'
begin object name="SMAT_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainUrban",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscUrban",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Ocean'
begin object name="SMAT_Ocean" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainWater",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscWater",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SMATWeaponParamsArena.SMAT_Orange'
begin object name="SMAT_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MainOrange",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SMATCamos.SMAT-MiscOrange",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
