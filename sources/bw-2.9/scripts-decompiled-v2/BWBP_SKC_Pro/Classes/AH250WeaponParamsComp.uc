class AH250WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_Laser'
	begin object name="ArenaParams_Laser" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName=".44 Laser"
		LayoutTags="laser"
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_208'
	end object
	Layouts[0]=ArenaParams_Laser
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_RDS'
	begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".44 RDS"
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_208'
	end object
	Layouts[1]=ArenaParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".44 Marksman"
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[2]=ArenaParams_Scope
	// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_50'
	begin object name="ArenaParams_50" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName=".50"
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
		WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=7
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_50'
	end object
	Layouts[3]=ArenaParams_50
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Silver'
	begin object name="Eagle_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front',MaterialName="",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	end object
	Camos[0]=Eagle_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Black'
	begin object name="Eagle_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-BlackShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=1
	end object
	Camos[1]=Eagle_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_TwoTone'
	begin object name="Eagle_TwoTone" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Two-Tone"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-TwoToneShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=2
	end object
	Camos[2]=Eagle_TwoTone
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Chromed'
	begin object name="Eagle_Chromed" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Chromed"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-SilverShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontSilver",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=3
	end object
	Camos[3]=Eagle_Chromed
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Gold'
	begin object name="Eagle_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MainGold-Shine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MagGold-Shine",Index=2,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-ScopeGold",Index=3,pIndex=2,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontGold-Shine",Index=4,pIndex=1,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		Index=4
	end object
	Camos[4]=Eagle_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
begin object name="ArenaRecoilParams_208" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0300000),(InVal=0.3500000,OutVal=-0.0500000),(InVal=0.5000000,OutVal=0.0000000),(InVal=0.7000000,OutVal=0.0300000),(InVal=1.0000000,OutVal=0.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=0.7500000
	ViewBindFactor=0.5000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
begin object name="ArenaAimParams_208" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_208'
begin object name="ArenaPrimaryFireParams_208" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams_208'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=50
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=48.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire3',Volume=4.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	PushbackForce=150.0000000
	Chaos=0.2000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams_208'
begin object name="ArenaPrimaryEffectParams_208" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=7500.0000000,Max=7500.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.6700000
	Damage=50
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=48.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Eagle.Eagle-Fire4',Volume=4.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	PushbackForce=150.0000000
	Chaos=0.3500000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams_50'
begin object name="ArenaPrimaryEffectParams_50" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=7500.0000000,Max=7500.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.6700000
	Damage=60
	DamageType=Class'BWBP_SKC_Pro.DTAH250Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAH250PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTAH250Pistol'
	PenetrationEnergy=48.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Eagle.Eagle50-Fire',Volume=5.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1836.0000000
	PushbackForce=150.0000000
	Chaos=0.3500000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_50'
begin object name="ArenaPrimaryFireParams_50" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	FireEndAnim="None"
	AimedFireAnim="'"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryEffectParams_50'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.3500000,OutVal=-0.0500000),(InVal=0.5000000,OutVal=0.0200000),(InVal=0.7000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=0.7500000
	ViewBindFactor=0.5000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=256)
	ChaosDeclineTime=0.6000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".44 Marksman"
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=18.5000000,Y=0.0000000,Z=2.7500000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=1.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_RDS'
begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".44 RDS"
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=2.7800000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_208'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_Laser'
begin object name="ArenaParams_Laser" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName=".44 Laser"
	LayoutTags="laser"
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_208'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaParams_50'
begin object name="ArenaParams_50" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName=".50"
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-11.0000000,Y=0.0000000,Z=1.3900000)
	WeaponBoneScales[0]=(BoneName="RedDotSight",Slot=54,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LAM",Slot=55,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Compensator",Slot=56,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="Scope",Slot=57,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=7
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaRecoilParams_208'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaAimParams_208'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH250WeaponParamsComp.ArenaPrimaryFireParams_50'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Silver'
begin object name="Eagle_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-MainShine',MaterialName="",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Front',MaterialName="",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=5,pIndex=-1,AIndex=5)
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Black'
begin object name="Eagle_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-BlackShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_TwoTone'
begin object name="Eagle_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-TwoToneShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MiscBlack",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-Scope",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontBlack",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Chromed'
begin object name="Eagle_Chromed" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Chromed"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-SilverShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-Misc',MaterialName="",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeRed',MaterialName="",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontSilver",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH250WeaponParamsComp.Eagle_Gold'
begin object name="Eagle_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MainGold-Shine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-MagGold-Shine",Index=2,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-ScopeGold",Index=3,pIndex=2,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.EagleCamos.Eagle-FrontGold-Shine",Index=4,pIndex=1,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDotGreen',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	Index=4
end object
