class AK91WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=10.5000000,Y=0.0000000,Z=1.7000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=0.0000000)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalParams_ACOG'
	begin object name="TacticalParams_ACOG" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.7000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=1.0000000)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_ACOG
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Red'
	begin object name="VK_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=VK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Green'
	begin object name="VK_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGreen",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=VK_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Black'
	begin object name="VK_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopBlack",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=VK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Desert'
	begin object name="VK_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopDesert",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=VK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Quantum'
	begin object name="VK_Quantum" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Quantum"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MainQuantumShine",Index=2,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=VK_Quantum
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=0
	FireAnim="FireAlt"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	RangeAtten=0.7500000
	Damage=40
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.rpk940.RPK-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Heat=0.4000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=3
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_GRSXXLaser'
	TraceRange=(Min=600.0000000,Max=600.0000000)
	RangeAtten=0.2000000
	Damage=5
	DamageType=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK91ZappedAlt'
	PenetrateForce=50
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.5000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams_Scope'
begin object name="TacticalRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=10.5000000,Y=0.0000000,Z=1.7000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=0.0000000)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalParams_ACOG'
begin object name="TacticalParams_ACOG" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.7000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=61,Scale=1.0000000)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK91WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Red'
begin object name="VK_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Green'
begin object name="VK_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGreen",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Black'
begin object name="VK_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopBlack",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Desert'
begin object name="VK_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopDesert",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Quantum'
begin object name="VK_Quantum" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Quantum"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MainQuantumShine",Index=2,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK91WeaponParamsTactical.VK_Gold'
begin object name="VK_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-MiscRed",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AK91Camos.AK91-TopGold",Index=2,pIndex=1,AIndex=1)
	Index=5
end object
