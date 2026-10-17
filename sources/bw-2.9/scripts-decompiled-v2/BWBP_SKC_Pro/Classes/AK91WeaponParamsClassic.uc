class AK91WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicParams_Irons'
	begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=7
		SightOffset=(X=10.5000000,Y=0.0000000,Z=1.7000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=0.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Irons
	// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicParams_ACOG'
	begin object name="ClassicParams_ACOG" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="ACOG"
		InventorySize=7
		SightingTime=0.4000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.7000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=1.0000000)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_ACOG
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Red'
	begin object name="VK_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=VK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Green'
	begin object name="VK_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGreen",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=VK_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Black'
	begin object name="VK_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopBlack",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=VK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Desert'
	begin object name="VK_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopDesert",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=VK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Quantum'
	begin object name="VK_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MainQuantumShine",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=VK_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Gold'
	begin object name="VK_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGold",Index=2,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=VK_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=1524.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.9500000
	Damage=30
	HeadMult=2.8500000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.rpk940.RPK-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Chaos=-1.0000000
	Heat=0.4500000
	WarnTargetPct=0.2000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=3
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_GRSXXLaser'
	TraceRange=(Min=600.0000000,Max=600.0000000)
	RangeAtten=0.2000000
	Damage=5
	DamageType=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.5000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicParams_Irons'
begin object name="ClassicParams_Irons" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=7
	SightOffset=(X=10.5000000,Y=0.0000000,Z=1.7000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=0.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicParams_ACOG'
begin object name="ClassicParams_ACOG" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="ACOG"
	InventorySize=7
	SightingTime=0.4000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.7000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=1.0000000)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Red'
begin object name="VK_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Green'
begin object name="VK_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGreen",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Black'
begin object name="VK_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopBlack",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Desert'
begin object name="VK_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopDesert",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Quantum'
begin object name="VK_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MainQuantumShine",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsClassic.VK_Gold'
begin object name="VK_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGold",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
