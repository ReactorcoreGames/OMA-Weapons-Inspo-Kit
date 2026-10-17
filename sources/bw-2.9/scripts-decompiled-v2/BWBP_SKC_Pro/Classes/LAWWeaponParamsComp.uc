class LAWWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5000000
		SightOffset=(X=12.0000000,Y=-1.0000000,Z=1.9000000)
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Green'
	begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="OD Green"
	end object
	Camos[0]=LAW_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Tan'
	begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=LAW_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Black'
	begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=LAW_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_RedTiger'
	begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=LAW_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Gold'
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
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=3500.0000000
	MaxSpeed=7500.0000000
	AccelSpeed=10000.0000000
	Damage=300.0000000
	DamageRadius=2048.0000000
	MomentumTransfer=300000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-FireLoud',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9500000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LAWGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	Damage=100.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=4.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	ClimbTime=0.0500000
	DeclineTime=1.0000000
	DeclineDelay=0.1000000
end object
// Reference: AimParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1536)
	AimAdjustTime=0.7500000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	AimDamageThreshold=300
	ChaosDeclineTime=2.8000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5000000
	SightOffset=(X=12.0000000,Y=-1.0000000,Z=1.9000000)
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LAWWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Green'
begin object name="LAW_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="OD Green"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Tan'
begin object name="LAW_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainTan",Index=2,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Black'
begin object name="LAW_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainBlack",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_RedTiger'
begin object name="LAW_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainRedTiger",Index=2,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LAWWeaponParamsComp.LAW_Gold'
begin object name="LAW_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LAWCamos.LAW-MainGold",Index=2,pIndex=0,AIndex=0)
	Index=4
end object
