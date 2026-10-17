class G51WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	BWA.ModeInfos[0].TracerMix = 0;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Chaff'
	begin object name="TacticalParams_Chaff" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Adv Holo + Chaff"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
		WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Chaff'
	end object
	Layouts[0]=TacticalParams_Chaff
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Sensor'
	begin object name="TacticalParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=3
		LayoutName="Adv Holo + Sensor"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Sensor'
	end object
	Layouts[1]=TacticalParams_Sensor
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_HE'
	begin object name="TacticalParams_HE" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights + HE"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
	end object
	Layouts[2]=TacticalParams_HE
	// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Suppressed'
	begin object name="TacticalParams_Suppressed" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="no_grenade"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
		WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimarySuppressedFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[3]=TacticalParams_Suppressed
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Black'
	begin object name="G51_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=G51_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Green'
	begin object name="G51_Green" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=G51_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_GreenHex'
	begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Hex"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=G51_GreenHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_BlueHex'
	begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=G51_BlueHex
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Desert'
	begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=G51_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_UTC'
	begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=G51_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Inferno'
	begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Inferno"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=G51_Inferno
	// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Gold'
	begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
		Index=7
	end object
	Camos[7]=G51_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.4000000,OutVal=-0.0200000),(InVal=0.8000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=0.8250000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.MJ51.SCAR-Fire',Volume=2.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=180.0000000
	Chaos=0.0400000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimarySuppressedEffectParams'
begin object name="TacticalPrimarySuppressedEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=4250.0000000)
	RangeAtten=0.7600000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_G51Assault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_G51AssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_G51AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51-Silenced',Volume=1.5000000,Radius=232.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=160.0000000
	Chaos=0.3069420
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimarySuppressedFireParams'
begin object name="TacticalPrimarySuppressedFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=0.8250000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimarySuppressedEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Chaff'
begin object name="TacticalSecondaryEffectParams_Chaff" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Chaff'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	MaxSpeed=3500.0000000
	Damage=65.0000000
	DamageRadius=192.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Chaff'
begin object name="TacticalSecondaryFireParams_Chaff" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Chaff'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Sensor'
begin object name="TacticalSecondaryEffectParams_Sensor" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	MaxSpeed=3500.0000000
	Damage=15.0000000
	DamageRadius=10.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Sensor'
begin object name="TacticalSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Sensor'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_HE'
begin object name="TacticalSecondaryEffectParams_HE" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	bOverrideArming=true
	ArmingDelay=0.3000000
	DetonateDelay=2.0000000
	UnarmedDetonateOn=2
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BWBP_SKC_Pro.G51Grenade_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3500.0000000
	MaxSpeed=3500.0000000
	Damage=100.0000000
	DamageRadius=768.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.G51AltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
begin object name="TacticalSecondaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="FireGrenade"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_HE'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Chaff'
begin object name="TacticalParams_Chaff" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Adv Holo + Chaff"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=-0.5000000,Y=-0.0100000,Z=3.1000000)
	WeaponBoneScales[0]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="HoloSightUpper",Slot=55,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Chaff'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Sensor'
begin object name="TacticalParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=3
	LayoutName="Adv Holo + Sensor"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=-0.1200000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=-1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=1.0000000)
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_HE'
begin object name="TacticalParams_HE" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights + HE"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_HE'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalParams_Suppressed'
begin object name="TacticalParams_Suppressed" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="no_grenade"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=-0.5000000,Y=0.0000000,Z=0.9000000)
	WeaponBoneScales[0]=(BoneName="IronsLower",Slot=53,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="CarryHandle",Slot=54,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="HoloSightUpper",Slot=55,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="HoloSightLower",Slot=56,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalPrimarySuppressedFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.G51WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Black'
begin object name="G51_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Green'
begin object name="G51_Green" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_GreenHex'
begin object name="G51_GreenHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Hex"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexG",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_BlueHex'
begin object name="G51_BlueHex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainHexB",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Desert'
begin object name="G51_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainDesert",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_UTC'
begin object name="G51_UTC" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.UTCG51Tex",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Inferno'
begin object name="G51_Inferno" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Inferno"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.G51WeaponParamsTactical.G51_Gold'
begin object name="G51_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.G51Camos.G51-MainGold",Index=1,pIndex=1,AIndex=0)
	Index=7
end object
