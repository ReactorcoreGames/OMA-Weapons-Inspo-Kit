class SRXWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sight"
		InventorySize=7
		WeaponPrice=1400
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=2.6000000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-Rifle',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-Stock',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=1.0000000)
		WeaponName="SRK-650 7.62mm Marksman Rifle"
		MagAmmo=20
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsInc'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsAcid'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsInc'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsAcid'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Red Dot Sight"
		LayoutTags="optic"
		InventorySize=7
		WeaponPrice=1400
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0600000,Z=2.7000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
		WeaponName="SRK-650 7.62mm Marksman Rifle"
		MagAmmo=20
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsInc'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsAcid'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsInc'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsAcid'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_ACOG'
	begin object name="RealisticParams_ACOG" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		LayoutTags="optic"
		InventorySize=7
		WeaponPrice=1400
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=0.0000000,Y=-0.4000000,Z=3.9000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
		WeaponName="SRK-650 7.62mm Marksman Rifle"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-60.0000000,Y=-1.3000000,Z=-0.1250000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		MagAmmo=20
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_ACOG
	// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_IRNV'
	begin object name="RealisticParams_IRNV" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="IRNV Scope"
		LayoutTags="optic, IR"
		InventorySize=7
		WeaponPrice=1400
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=-0.4000000,Z=4.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
		MaxZoom=2.0000000
		WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
		WeaponName="SRK-650 7.62mm Marksman Rifle"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-60.0000000,Y=-1.5500000,Z=-0.1250000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		MagAmmo=20
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[3]=RealisticParams_IRNV
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Gray'
	begin object name="SRX_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SRX_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Wood'
	begin object name="SRX_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleV2",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockV2",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SRX_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Desert'
	begin object name="SRX_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleTan",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-StockBlack',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingTan",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SRX_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Urban'
	begin object name="SRX_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleUrban",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockUrban",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SRX_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Jungle'
	begin object name="SRX_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockJungle",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SRX_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_RedWinter'
	begin object name="SRX_RedWinter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RiflePatriot",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockRedCamo",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=SRX_RedWinter
	// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_RedTiger'
	begin object name="SRX_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleTiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockRedBlack",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=SRX_RedTiger
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=640,Max=1436)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0750000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=575
end object
// Reference: FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsInc'
begin object name="RealisticPrimaryFireParamsInc" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParamsInc'
end object
// Reference: FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsAcid'
begin object name="RealisticPrimaryFireParamsAcid" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParamsAcid'
end object
// Reference: FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=4000.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=4000.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsInc'
begin object name="RealisticRecoilParamsInc" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.1600000),(InVal=0.7000000,OutVal=0.3000000),(InVal=0.8500000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=-0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.4500000),(InVal=0.4000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7500000),(InVal=0.8500000,OutVal=0.8500000),(InVal=1.0000000,OutVal=0.8800000)))
	XRandFactor=0.1650000
	YRandFactor=0.2000000
	MaxRecoil=4000.0000000
	DeclineTime=1.2000000
	DeclineDelay=1.0000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsAcid'
begin object name="RealisticRecoilParamsAcid" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.1600000),(InVal=0.7000000,OutVal=0.3000000),(InVal=0.8500000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=-0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.4500000),(InVal=0.4000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7500000),(InVal=0.8500000,OutVal=0.8500000),(InVal=1.0000000,OutVal=0.8800000)))
	XRandFactor=0.1650000
	YRandFactor=0.1000000
	MaxRecoil=4000.0000000
	DeclineTime=0.3000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1800.0000000,Max=9000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=60
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTSRXRifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSRXRifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSRXRifle'
	PenetrationEnergy=24.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-Fire4',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=850.0000000
	Chaos=0.1000000
	Inaccuracy=(X=1,Y=1)
	BotRefireRate=0.1500000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParamsInc'
begin object name="RealisticPrimaryEffectParamsInc" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1800.0000000,Max=9000.0000000)
	WaterTraceRange=5000.0000000
	Damage=65
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTSRXRifle_Incendiary'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSRXRifleHead_Incendiary'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSRXRifle_Incendiary'
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-LoudFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.5000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.2000000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryEffectParamsAcid'
begin object name="RealisticPrimaryEffectParamsAcid" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1800.0000000,Max=9000.0000000)
	WaterTraceRange=5000.0000000
	Damage=55
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTSRXRifle_Corrosive'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSRXRifleHead_Corrosive'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSRXRifle_Corrosive'
	PenetrationEnergy=48.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.A500FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SRSM2.SRSM2-SpecialFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.0800000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.1225000
	WarnTargetPct=0.2000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Attach AMP"
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sight"
	InventorySize=7
	WeaponPrice=1400
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=2.6000000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-Rifle',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-Stock',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=1.0000000)
	WeaponName="SRK-650 7.62mm Marksman Rifle"
	MagAmmo=20
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsInc'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsAcid'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsInc'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsAcid'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Red Dot Sight"
	LayoutTags="optic"
	InventorySize=7
	WeaponPrice=1400
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0600000,Z=2.7000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
	WeaponName="SRK-650 7.62mm Marksman Rifle"
	MagAmmo=20
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsInc'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParamsAcid'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsInc'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParamsAcid'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_ACOG'
begin object name="RealisticParams_ACOG" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	LayoutTags="optic"
	InventorySize=7
	WeaponPrice=1400
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=0.0000000,Y=-0.4000000,Z=3.9000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
	WeaponName="SRK-650 7.62mm Marksman Rifle"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-60.0000000,Y=-1.3000000,Z=-0.1250000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	MagAmmo=20
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticParams_IRNV'
begin object name="RealisticParams_IRNV" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="IRNV Scope"
	LayoutTags="optic, IR"
	InventorySize=7
	WeaponPrice=1400
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=-0.4000000,Z=4.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-IRScope'
	MaxZoom=2.0000000
	WeaponBoneScales[0]=(BoneName="Sight",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="SightBase",Slot=54,Scale=0.0000000)
	WeaponName="SRK-650 7.62mm Marksman Rifle"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_IRScope',BoneName="tip",Scale=0.0650000,AugmentOffset=(X=-60.0000000,Y=-1.5500000,Z=-0.1250000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	MagAmmo=20
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Gray'
begin object name="SRX_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Wood'
begin object name="SRX_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleV2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockV2",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Desert'
begin object name="SRX_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleTan",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.SRX.SRX-StockBlack',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingTan",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Urban'
begin object name="SRX_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleUrban",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockUrban",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_Jungle'
begin object name="SRX_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockJungle",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_RedWinter'
begin object name="SRX_RedWinter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RiflePatriot",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockRedCamo",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SRXWeaponParamsRealistic.SRX_RedTiger'
begin object name="SRX_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-RifleTiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-StockRedBlack",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-IronsV2",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-HoloV2",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-CableV2",Index=5,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[6]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-PlatingV2",Index=6,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[7]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-BarrelV2",Index=7,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[8]=(Material=none,MaterialName="BWBP_Camos_Tex.SRXCamos.SRX-MiscV2",Index=8,pIndex=0,AIndex=0)
	Index=6
end object
