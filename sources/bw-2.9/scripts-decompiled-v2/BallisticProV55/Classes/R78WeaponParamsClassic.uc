class R78WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Variable Scope"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=4
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams_Suppressor'
	begin object name="ClassicParams_Suppressor" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="silencer"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=1
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Suppressor
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams_NoScope'
	begin object name="ClassicParams_NoScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		LayoutTags="quickpull"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
		SightPivot=(Pitch=-64,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		MagAmmo=7
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_NoScope
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Gray'
	begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=R78_Gray
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Wood'
	begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black n' Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=R78_Wood
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Desert'
	begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=R78_Desert
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Jungle'
	begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=R78_Jungle
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Urban'
	begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=R78_Urban
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Patriot'
	begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Patriot"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=R78_Patriot
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Tiger'
	begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=6
	end object
	Camos[6]=R78_Tiger
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Gold'
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
// Reference: FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.3000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=3072)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: InstantEffectParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=115
	HeadMult=1.6000000
	LimbMult=0.4000000
	DamageType=Class'BallisticProV55.DTR78Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR78RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR78Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireEffectParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Variable Scope"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=4
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams_Suppressor'
begin object name="ClassicParams_Suppressor" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="silencer"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=1
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsClassic.ClassicParams_NoScope'
begin object name="ClassicParams_NoScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	LayoutTags="quickpull"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	MagAmmo=7
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R78WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Gray'
begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Wood'
begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n' Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Desert'
begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Jungle'
begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Urban'
begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Patriot'
begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Patriot"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Tiger'
begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsClassic.R78_Gold'
begin object name="R78_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=7
end object
