class R78WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Variable Scope"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
		ZoomType=4
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		WeaponName="R87A1 .416 Sniper Rifle"
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsRealistic.RealisticParams_NoScope'
	begin object name="RealisticParams_NoScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		LayoutTags="quickpull"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
		SightPivot=(Pitch=-64,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		WeaponName="R87A1 .416 Sniper Rifle"
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_NoScope
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Gray'
	begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=R78_Gray
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Wood'
	begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black n' Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=R78_Wood
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Desert'
	begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=R78_Desert
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Jungle'
	begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=R78_Jungle
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Urban'
	begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=R78_Urban
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Patriot'
	begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Patriot"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=R78_Patriot
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Tiger'
	begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=6
	end object
	Camos[6]=R78_Tiger
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Gold'
	begin object name="R78_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainGold",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=7
	end object
	Camos[7]=R78_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.R78WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1792)
	AimAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=575
end object
// Reference: RecoilParams'BallisticProV55.R78WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1792.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.7500000
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	RangeAtten=0.1000000
	Damage=146
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTR78Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR78RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR78Rifle'
	PenetrationEnergy=30.0000000
	PenetrateForce=350
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=0.8000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.2500000
	WarnTargetPct=0.0500000
end object
// Reference: FireEffectParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Variable Scope"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
	ZoomType=4
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	WeaponName="R87A1 .416 Sniper Rifle"
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsRealistic.RealisticParams_NoScope'
begin object name="RealisticParams_NoScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	LayoutTags="quickpull"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	WeaponName="R87A1 .416 Sniper Rifle"
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Gray'
begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Wood'
begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n' Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Desert'
begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Jungle'
begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Urban'
begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Patriot'
begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Patriot"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Tiger'
begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsRealistic.R78_Gold'
begin object name="R78_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=7
end object
