class Mk781WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressable"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
		SightPivot=(Pitch=-64,Yaw=10,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams_Holo'
	begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holo + LAM"
		LayoutTags="lam,no_suppressor"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=4.2000000,Y=0.0100000,Z=6.9700000)
		WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=3,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=0,AIndex=0)
		ViewOffset=(X=15.0000000,Y=11.0000000,Z=-7.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltFireParams'
	end object
	Layouts[1]=ClassicParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams_Dart'
	begin object name="ClassicParams_Dart" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope Sabot"
		LayoutTags="no_alt,slug"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
		FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
		FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
		FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_SabotSil'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Dart
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Gray'
	begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
		Weight=40
		CamoName="Gray"
	end object
	Camos[0]=M781_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Digital'
	begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=M781_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Desert'
	begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=M781_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Jungle'
	begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle Hex"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=M781_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Winter'
	begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=M781_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Wood'
	begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=M781_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_RedTiger'
	begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
		Index=6
	end object
	Camos[6]=M781_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Gold'
	begin object name="M781_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoGold",Index=1,pIndex=2,AIndex=1)
		Index=7
	end object
	Camos[7]=M781_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	TargetState="ElektroShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
begin object name="ClassicPrimaryFireParams_Sabot" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams_Sabot'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.6000000
	YRandFactor=0.7000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltFireParams'
begin object name="ClassicSecondaryBoltFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	TargetState="ElektroSlug"
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilFireParams'
begin object name="ClassicPrimarySilFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=3000.0000000,Max=5000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=15
	LimbMult=0.3333330
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=400,Y=350)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilEffectParams'
begin object name="ClassicPrimarySilEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=3000.0000000,Max=5000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=15
	LimbMult=0.3333330
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.Mk781-FireSil',Volume=2.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=1.0000000
	Inaccuracy=(X=200,Y=150)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams_Sabot'
begin object name="ClassicPrimaryEffectParams_Sabot" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=8000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=100
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-FireDart',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams_SabotSil'
begin object name="ClassicPrimaryEffectParams_SabotSil" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=8000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=100
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.Mk781-FireSil',Volume=2.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=1.0000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_SabotSil'
begin object name="ClassicPrimaryFireParams_SabotSil" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryEffectParams_SabotSil'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=30
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	Damage=10
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.HyperBeamCannon.343Primary-Hit',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1300,Y=1200)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltEffectParams'
begin object name="ClassicSecondaryBoltEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MK781PulseProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=3600.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=1200.0000000
	Damage=100.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressable"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
	SightPivot=(Pitch=-64,Yaw=10,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams_Holo'
begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holo + LAM"
	LayoutTags="lam,no_suppressor"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=4.2000000,Y=0.0100000,Z=6.9700000)
	WeaponMaterialSwaps[0]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=3,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.LK05.LK05-EOTechGlow2',MaterialName="",Index=4,pIndex=0,AIndex=0)
	ViewOffset=(X=15.0000000,Y=11.0000000,Z=-7.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimarySilFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryBoltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicParams_Dart'
begin object name="ClassicParams_Dart" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope Sabot"
	LayoutTags="no_alt,slug"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
	FireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
	FireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_Sabot'
	FireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicPrimaryFireParams_SabotSil'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.Mk781WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Gray'
begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
	Weight=40
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Digital'
begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Desert'
begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Jungle'
begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle Hex"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Winter'
begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Wood'
begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_RedTiger'
begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.Mk781WeaponParamsClassic.M781_Gold'
begin object name="M781_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoGold",Index=1,pIndex=2,AIndex=1)
	Index=7
end object
