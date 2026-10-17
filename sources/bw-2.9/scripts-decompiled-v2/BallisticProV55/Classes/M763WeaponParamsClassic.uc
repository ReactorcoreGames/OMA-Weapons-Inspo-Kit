class M763WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Buckshot"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Spray'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsClassic.ClassicParams_Slug'
	begin object name="ClassicParams_Slug" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Slug"
		LayoutTags="slug"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams_Slug'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Slug'
	end object
	Layouts[1]=ClassicParams_Slug
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Gray'
	begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M763_Gray
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_OD'
	begin object name="M763_OD" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=M763_OD
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Wood'
	begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=M763_Wood
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Trusty'
	begin object name="M763_Trusty" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=M763_Trusty
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.M763WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: RecoilParams'BallisticProV55.M763WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=0.9000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=20
	LimbMult=0.2400000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter_C'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=700,Y=450)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnim="FireClassic"
	FireEndAnim="None"
	AimedFireAnim="FireClassic"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryEffectParams_Slug'
begin object name="ClassicPrimaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.2000000
	Damage=110
	HeadMult=1.7000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter_C'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire2',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams_Slug'
begin object name="ClassicPrimaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnim="FireClassic"
	FireEndAnim="None"
	AimedFireAnim="FireClassic"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryEffectParams_Slug'
end object
// Reference: ProjectileEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryEffectParams_Slug'
begin object name="ClassicSecondaryEffectParams_Slug" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.M763GasSlug'
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
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=450.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Slug'
begin object name="ClassicSecondaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="GasSlug"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryEffectParams_Slug'
end object
// Reference: InstantEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryEffectParams_Spray'
begin object name="ClassicSecondaryEffectParams_Spray" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=768.0000000,Max=768.0000000)
	RangeAtten=0.2500000
	Damage=35
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrateForce=100
	bPenetrate=true
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Spray'
begin object name="ClassicSecondaryFireParams_Spray" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="GasSpray"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryEffectParams_Spray'
end object
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Buckshot"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Spray'
end object
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsClassic.ClassicParams_Slug'
begin object name="ClassicParams_Slug" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Slug"
	LayoutTags="slug"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicPrimaryFireParams_Slug'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsClassic.ClassicSecondaryFireParams_Slug'
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Gray'
begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_OD'
begin object name="M763_OD" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Wood'
begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsClassic.M763_Trusty'
begin object name="M763_Trusty" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,pIndex=1,AIndex=0)
	Index=3
end object
