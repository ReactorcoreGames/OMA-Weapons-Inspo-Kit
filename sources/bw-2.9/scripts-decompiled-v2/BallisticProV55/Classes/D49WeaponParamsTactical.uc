class D49WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	BWA.ModeInfos[1].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser"
		InventorySize=3
		WeaponPrice=1800
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1900000
		SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
		SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
		RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=6
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsTactical.TacticalParams_Scope'
	begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		InventorySize=3
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=6
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[1]=TacticalParams_Scope
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsTactical.D49_Silver'
	begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=D49_Silver
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsTactical.D49_Black'
	begin object name="D49_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=D49_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.D49WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.7500000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.D49WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.0300000),(InVal=1.0000000,OutVal=0.0700000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=0.4000000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireParams'
begin object name="TacticalAltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=2
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireEffectParams'
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireParams'
begin object name="TacticalFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	FireAnim="FireSingle"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireEffectParams'
begin object name="TacticalFireEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=55
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=16.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.4000000
	Inaccuracy=(X=96,Y=96)
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireEffectParams'
begin object name="TacticalAltFireEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=110
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=16.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2560.0000000
	Chaos=0.8000000
	Inaccuracy=(X=96,Y=96)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser"
	InventorySize=3
	WeaponPrice=1800
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1900000
	SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
	SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
	RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=6
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireParams'
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsTactical.TacticalParams_Scope'
begin object name="TacticalParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	InventorySize=3
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=6
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsTactical.TacticalAltFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsTactical.D49_Silver'
begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsTactical.D49_Black'
begin object name="D49_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
