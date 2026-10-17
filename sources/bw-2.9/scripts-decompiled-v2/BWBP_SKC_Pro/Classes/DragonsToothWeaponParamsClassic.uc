class DragonsToothWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Blue'
	begin object name="ClassicParams_Blue" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Blue"
		LayoutTags="blue"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
		AllowedCamos[0]=0
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Blue
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Red'
	begin object name="ClassicParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Red"
		LayoutTags="red"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
		AllowedCamos[0]=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Black'
	begin object name="ClassicParams_Black" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Nanoblack"
		LayoutTags="black"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
		AllowedCamos[0]=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Black
	// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Gold'
	begin object name="ClassicParams_Gold" class=BCoreProV55.WeaponParams
		Weight=1
		LayoutName="Royal Dragon"
		LayoutTags="gold"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
		AllowedCamos[0]=3
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[3]=ClassicParams_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Blue'
	begin object name="DTS_Blue" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Blue"
	end object
	Camos[0]=DTS_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Red'
	begin object name="DTS_Red" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowRed',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=DTS_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Black'
	begin object name="DTS_Black" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainBlackFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowBlack',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=DTS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Swing1"
	FireAnimRate=0.8500000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.6000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Melee3"
	FireAnimRate=0.8500000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	Damage=125
	HeadMult=2.0000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_DTSChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSLimb'
	HookStopFactor=1.2000000
	HookPullForce=80.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=4.1000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	Damage=115
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_DTSChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSLimb'
	HookStopFactor=2.7000000
	HookPullForce=150.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=5.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Blue'
begin object name="ClassicParams_Blue" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Blue"
	LayoutTags="blue"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
	AllowedCamos[0]=0
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Red'
begin object name="ClassicParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Red"
	LayoutTags="red"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
	AllowedCamos[0]=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Black'
begin object name="ClassicParams_Black" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Nanoblack"
	LayoutTags="black"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
	AllowedCamos[0]=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicParams_Gold'
begin object name="ClassicParams_Gold" class=BCoreProV55.WeaponParams
	Weight=1
	LayoutName="Royal Dragon"
	LayoutTags="gold"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	ViewOffset=(X=1.0000000,Y=5.0000000,Z=-20.0000000)
	AllowedCamos[0]=3
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Blue'
begin object name="DTS_Blue" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Red'
begin object name="DTS_Red" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-Red',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowRed',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Black'
begin object name="DTS_Black" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainBlackFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowBlack',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.DragonsToothWeaponParamsClassic.DTS_Gold'
begin object name="DTS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-MainGoldFinal',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.DragonToothSword.DTS-BladeGlowGold',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	Index=3
end object
