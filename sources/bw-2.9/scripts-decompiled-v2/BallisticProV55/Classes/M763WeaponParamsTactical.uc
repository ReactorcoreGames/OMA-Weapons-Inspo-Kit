class M763WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Buckshot"
		SightMoveSpeedFactor=0.6000000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.M763WeaponParamsTactical.TacticalParams_Slug'
	begin object name="TacticalParams_Slug" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Slug"
		LayoutTags="slug"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams_Slug'
		AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Slug
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Gray'
	begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M763_Gray
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_OD'
	begin object name="M763_OD" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=M763_OD
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Wood'
	begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=M763_Wood
	// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Trusty'
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
// Reference: AimParams'BallisticProV55.M763WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.M763WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0750000
	DeclineTime=0.7500000
	DeclineDelay=0.5500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="GasSpray"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.1500000
	Damage=17
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.3000000
	Inaccuracy=(X=200,Y=200)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	bCockAfterFire=true
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryEffectParams_Slug'
begin object name="TacticalPrimaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=500.0000000,Max=2150.0000000)
	RangeAtten=0.2000000
	Damage=150
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Fire2',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3192.0000000
	PushbackForce=250.0000000
	Chaos=0.4000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams_Slug'
begin object name="TacticalPrimaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	bCockAfterFire=true
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryEffectParams_Slug'
end object
// Reference: InstantEffectParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
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
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Buckshot"
	SightMoveSpeedFactor=0.6000000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M763WeaponParamsTactical.TacticalParams_Slug'
begin object name="TacticalParams_Slug" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Slug"
	LayoutTags="slug"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=-0.0500000,Z=2.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="M763",Scale=0.0450000,AugmentOffset=(X=0.0000000,Y=0.6000000,Z=-0.2500000),AugmentRot=(Pitch=32800,Yaw=-16400,Roll=0))
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.M763WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M763WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalPrimaryFireParams_Slug'
	AltFireParams[0]=FireParams'BallisticProV55.M763WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Gray'
begin object name="M763_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_OD'
begin object name="M763_OD" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KShotgunShiney",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M763-KSmallShiney",Index=2,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Wood'
begin object name="M763_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_LargeShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781_SmallShine",Index=2,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M763WeaponParamsTactical.M763_Trusty'
begin object name="M763_Trusty" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781-OldTrusty",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M763Camos.M781Small",Index=2,pIndex=1,AIndex=0)
	Index=3
end object
