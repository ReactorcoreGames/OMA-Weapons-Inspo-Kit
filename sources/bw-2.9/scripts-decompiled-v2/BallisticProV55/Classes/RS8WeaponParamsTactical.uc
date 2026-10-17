class RS8WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10mm Suppressable"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
		SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		DisplaceDurationMult=0.3300000
		MagAmmo=9
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams_TacKnife'
	begin object name="TacticalParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10mm Tac Knife"
		LayoutTags="tacknife"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
		ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		DisplaceDurationMult=0.3300000
		MagAmmo=9
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
	end object
	Layouts[1]=TacticalParams_TacKnife
	// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams_Heavy'
	begin object name="TacticalParams_Heavy" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="HV Ammo + RDS"
		LayoutTags="comp"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
		AllowedCamos[0]=5
		AllowedCamos[1]=6
		AllowedCamos[2]=7
		DisplaceDurationMult=0.3300000
		MagAmmo=7
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams_Heavy'
		AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_Heavy
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Silver'
	begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=RS8_Silver
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Gray'
	begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RS8_Gray
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Black'
	begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=RS8_Black
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Rainbow'
	begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Rainbow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=RS8_Rainbow
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Gold'
	begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=RS8_Gold
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Silver'
	begin object name="RS45_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.RS8.RS8-MainHeavy',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=RS45_Silver
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Black'
	begin object name="RS45_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyBlack",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=RS45_Black
	// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Gold'
	begin object name="RS45_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyGoldShine",Index=1,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
		Index=7
	end object
	Camos[7]=RS45_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0500000
	DeclineTime=0.7500000
	DeclineDelay=0.2400000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=30
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Pistol.RSP-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=360.0000000
	Chaos=0.2500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7500000
end object
// Reference: InstantEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryEffectParams_Heavy'
begin object name="TacticalPrimaryEffectParams_Heavy" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=40
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTRS8Pistol'
	DamageTypeHead=Class'BallisticProV55.DTRS8PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTRS8Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Pistol.RS8-HFire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=666.0000000
	Chaos=0.3500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams_Heavy'
begin object name="TacticalPrimaryFireParams_Heavy" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryEffectParams_Heavy'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Laser"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: MeleeEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams_TacKnife'
begin object name="TacticalSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=80
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTRS8Stab'
	DamageTypeHead=Class'BallisticProV55.DTRS8Stab'
	DamageTypeArm=Class'BallisticProV55.DTRS8Stab'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
begin object name="TacticalSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryEffectParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10mm Suppressable"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=-43.0000000,Y=-1.4000000,Z=13.4000000)
	SightPivot=(Pitch=-200,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	DisplaceDurationMult=0.3300000
	MagAmmo=9
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams_TacKnife'
begin object name="TacticalParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10mm Tac Knife"
	LayoutTags="tacknife"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=-30.0000000,Y=0.2600000,Z=3.5000000)
	ViewOffset=(X=20.0000000,Y=7.0000000,Z=-8.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Melee_FPm'
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	DisplaceDurationMult=0.3300000
	MagAmmo=9
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.RS8WeaponParamsTactical.TacticalParams_Heavy'
begin object name="TacticalParams_Heavy" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="HV Ammo + RDS"
	LayoutTags="comp"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=0.0000000,Y=-2.0000000,Z=21.8000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1050)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-290,Roll=0)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-10.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.RS8Heavy_FPm'
	AllowedCamos[0]=5
	AllowedCamos[1]=6
	AllowedCamos[2]=7
	DisplaceDurationMult=0.3300000
	MagAmmo=7
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.RS8WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RS8WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalPrimaryFireParams_Heavy'
	AltFireParams[0]=FireParams'BallisticProV55.RS8WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Silver'
begin object name="RS8_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Gray'
begin object name="RS8_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.M1911-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Black'
begin object name="RS8_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-K-Shiney",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Rainbow'
begin object name="RS8_Rainbow" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Rainbow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainRainbowShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS8_Gold'
begin object name="RS8_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Silver'
begin object name="RS45_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.RS8.RS8-MainHeavy',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Black'
begin object name="RS45_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyBlack",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BallisticProV55.RS8WeaponParamsTactical.RS45_Gold'
begin object name="RS45_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS8Camos.RS8-MainHeavyGoldShine",Index=1,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-RDS-GLow',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.RS8.RS8-Shiney',MaterialName="",Index=3,pIndex=0,AIndex=0)
	Index=7
end object
