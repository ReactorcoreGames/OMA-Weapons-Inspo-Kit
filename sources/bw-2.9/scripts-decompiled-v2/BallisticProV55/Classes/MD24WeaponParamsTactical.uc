class MD24WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="9mm RDS"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_Supp'
	begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="9mm Suppressed"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Supp
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_TacKnife'
	begin object name="TacticalParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="9mm Tac Knife"
		LayoutTags="tacknife"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=2.5000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams_TacKnife'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams_TacKnife'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
	end object
	Layouts[2]=TacticalParams_TacKnife
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_10mm'
	begin object name="TacticalParams_10mm" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10mm Super"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
		DisplaceDurationMult=0.3300000
		MagAmmo=12
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_10mm'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[3]=TacticalParams_10mm
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Green'
	begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=MD24_Green
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Black'
	begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MD24_Black
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Desert'
	begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MD24_Desert
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Blue'
	begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=MD24_Blue
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Red'
	begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=MD24_Red
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Gold'
	begin object name="MD24_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Clip-Shine",Index=2,pIndex=-1,AIndex=-1)
		Index=5
	end object
	Camos[5]=MD24_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0600000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Fire',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
begin object name="TacticalPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MD24.MD24_FireSil',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=230.0000000
	Chaos=0.3500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_Supp'
begin object name="TacticalPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams_10mm'
begin object name="TacticalPrimaryEffectParams_10mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=40
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_FireHeavy',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=762.0000000
	Chaos=0.2000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_10mm'
begin object name="TacticalPrimaryFireParams_10mm" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryEffectParams_10mm'
end object
// Reference: FireEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: MeleeEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryEffectParams_TacKnife'
begin object name="TacticalSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=80
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTMD24Melee'
	DamageTypeHead=Class'BallisticProV55.DTMD24Melee'
	DamageTypeArm=Class'BallisticProV55.DTMD24Melee'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
begin object name="TacticalSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryEffectParams_TacKnife'
end object
// Reference: RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams_TacKnife'
begin object name="TacticalRecoilParams_TacKnife" class=BCoreProV55.RecoilParams
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0600000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams_TacKnife'
begin object name="TacticalAimParams_TacKnife" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=512)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="9mm RDS"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_Supp'
begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="9mm Suppressed"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_TacKnife'
begin object name="TacticalParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="9mm Tac Knife"
	LayoutTags="tacknife"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=2.5000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams_TacKnife'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams_TacKnife'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsTactical.TacticalParams_10mm'
begin object name="TacticalParams_10mm" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10mm Super"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
	DisplaceDurationMult=0.3300000
	MagAmmo=12
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalPrimaryFireParams_10mm'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Green'
begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Black'
begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Desert'
begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Blue'
begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Red'
begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsTactical.MD24_Gold'
begin object name="MD24_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Clip-Shine",Index=2,pIndex=-1,AIndex=-1)
	Index=5
end object
