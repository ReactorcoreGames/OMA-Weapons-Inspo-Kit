class R78WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Scope"
		LayoutTags="quickpull"
		InventorySize=5
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=2
		ScopeScale=0.6000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Silencer",Slot=78,Scale=0.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.R78WeaponParamsComp.ArenaParams_NoScope'
	begin object name="ArenaParams_NoScope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		LayoutTags="quickpull"
		InventorySize=5
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
		SightPivot=(Pitch=-64,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Silencer",Slot=78,Scale=0.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[1]=ArenaParams_NoScope
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Gray'
	begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=R78_Gray
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Wood'
	begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black n' Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=R78_Wood
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Desert'
	begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=R78_Desert
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Jungle'
	begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=R78_Jungle
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Urban'
	begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=R78_Urban
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Patriot'
	begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Patriot"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=R78_Patriot
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Tiger'
	begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
		Index=6
	end object
	Camos[6]=R78_Tiger
	// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Gold'
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
// Reference: AimParams'BallisticProV55.R78WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.2500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.R78WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1500000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0800000
	DeclineTime=0.7500000
	DeclineDelay=0.2200000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.1000000
	bCockAfterFire=true
	FireEndAnim="None"
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=100
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BallisticProV55.DTR78Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR78RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR78Rifle'
	PDamageFactor=0.8000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78NS-Fire',Volume=1.5000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.5000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Scope"
	LayoutTags="quickpull"
	InventorySize=5
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=-1.5000000,Y=-0.5000000,Z=5.3000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=2
	ScopeScale=0.6000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Silencer",Slot=78,Scale=0.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.R78WeaponParamsComp.ArenaParams_NoScope'
begin object name="ArenaParams_NoScope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	LayoutTags="quickpull"
	InventorySize=5
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=-1.0000000,Y=0.0000000,Z=1.9000000)
	SightPivot=(Pitch=-64,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=6,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Silencer",Slot=78,Scale=0.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.R78WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R78WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.R78WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Gray'
begin object name="R78_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Wood'
begin object name="R78_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black n' Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Desert'
begin object name="R78_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Jungle'
begin object name="R78_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Urban'
begin object name="R78_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainUrban",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Patriot'
begin object name="R78_Patriot" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Patriot"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainPatriot",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Tiger'
begin object name="R78_Tiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainRedTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.R78WeaponParamsComp.R78_Gold'
begin object name="R78_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.R78Camos.R78-ScopeDark",Index=2,pIndex=1,AIndex=1)
	Index=7
end object
