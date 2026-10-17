class DragonsToothWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Blue'
	begin object name="UniversalParams_Blue" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Blue"
		LayoutTags="blue"
		InventorySize=2
		AllowedCamos[0]=0
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams_Blue
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Red'
	begin object name="UniversalParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Red"
		LayoutTags="red"
		InventorySize=2
		AllowedCamos[0]=1
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=UniversalParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Black'
	begin object name="UniversalParams_Black" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Nanoblack"
		LayoutTags="black"
		InventorySize=2
		AllowedCamos[0]=2
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[2]=UniversalParams_Black
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Gold'
	begin object name="UniversalParams_Gold" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Royal Dragon"
		LayoutTags="gold"
		InventorySize=2
		AllowedCamos[0]=3
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[3]=UniversalParams_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Blue'
	begin object name="DTS_Blue" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Blue"
	end object
	Camos[0]=DTS_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Red'
	begin object name="DTS_Red" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowRed',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=DTS_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Black'
	begin object name="DTS_Black" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainBlackFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowBlack',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=DTS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Gold'
	begin object name="DTS_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainGoldFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowGold',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		Index=3
	end object
	Camos[3]=DTS_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	AmmoPerFire=0
	FireAnim="Melee3"
	FireAnimRate=0.8500000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.1000000
	TraceRange=(Min=175.0000000,Max=175.0000000)
	Damage=90
	DamageType=Class'BWBP_SKC_Pro.DT_DTSStabChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSStabHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSStabChest'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=1.0000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.8000000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.2000000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=70
	DamageType=Class'BWBP_SKC_Pro.DT_DTSChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSLimb'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=1.0000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.7000000
	WarnTargetPct=0.8000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Blue'
begin object name="UniversalParams_Blue" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Blue"
	LayoutTags="blue"
	InventorySize=2
	AllowedCamos[0]=0
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Red'
begin object name="UniversalParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Red"
	LayoutTags="red"
	InventorySize=2
	AllowedCamos[0]=1
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Black'
begin object name="UniversalParams_Black" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Nanoblack"
	LayoutTags="black"
	InventorySize=2
	AllowedCamos[0]=2
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalParams_Gold'
begin object name="UniversalParams_Gold" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Royal Dragon"
	LayoutTags="gold"
	InventorySize=2
	AllowedCamos[0]=3
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Blue'
begin object name="DTS_Blue" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Red'
begin object name="DTS_Red" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowRed',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Black'
begin object name="DTS_Black" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainBlackFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowBlack',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsComp.DTS_Gold'
begin object name="DTS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainGoldFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowGold',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
