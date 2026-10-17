class M99RifleWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.8000000
		InventorySize=7
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.6500000
		SightOffset=(X=5.0000000,Y=16.0000000,Z=36.0000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		ViewOffset=(X=12.0000000,Y=0.0000000,Z=-25.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalPrimaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Desert'
	begin object name="M99_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
	end object
	Camos[0]=M99_Desert
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Jungle'
	begin object name="M99_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainJungle",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscJungle",Index=3,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=M99_Jungle
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Winter'
	begin object name="M99_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainWinter",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=M99_Winter
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Gray'
	begin object name="M99_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGray",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=M99_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_UTC'
	begin object name="M99_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99AShine",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99BShine",Index=3,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=M99_UTC
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Hex'
	begin object name="M99_Hex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainHex",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=M99_Hex
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Molten'
	begin object name="M99_Molten" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Molten"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainMolten",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=6
	end object
	Camos[6]=M99_Molten
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Gold'
	begin object name="M99_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGold",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=7
	end object
	Camos[7]=M99_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=199
	HeadMult=1.7500000
	DamageType=Class'BWBP_JCF_Pro.DTM99Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM99RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM99Rifle'
	PenetrationEnergy=128.0000000
	PenetrateForce=450
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99FireNew',Volume=10.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=255.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MinRandFactor=0.4500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1500000
	DeclineTime=1.5000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.1000000
	HipMultiplier=2.0000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.8000000
	InventorySize=7
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.6500000
	SightOffset=(X=5.0000000,Y=16.0000000,Z=36.0000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	ViewOffset=(X=12.0000000,Y=0.0000000,Z=-25.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.TacticalPrimaryFireParams'
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Desert'
begin object name="M99_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Jungle'
begin object name="M99_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainJungle",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscJungle",Index=3,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Winter'
begin object name="M99_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainWinter",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Gray'
begin object name="M99_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGray",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_UTC'
begin object name="M99_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99AShine",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99BShine",Index=3,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Hex'
begin object name="M99_Hex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainHex",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Molten'
begin object name="M99_Molten" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Molten"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainMolten",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsTactical.M99_Gold'
begin object name="M99_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGold",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=7
end object
