class MD24WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10mm Super"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
		ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
		MagAmmo=14
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="9mm RDS"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
		ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0500000,AugmentOffset=(X=5.0000000,Y=0.0000000,Z=4.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		MagAmmo=16
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_9mm'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_RDS
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_Supp'
	begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="9mm Suppressed"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
		ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		MagAmmo=16
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Supp
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_TacKnife'
	begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="9mm Tac Knife"
		LayoutTags="tacknife"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=2.5000000)
		ViewOffset=(X=7.0000000,Y=4.0000000,Z=-3.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
		MagAmmo=16
		bNeedCock=true
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams_TacKnife'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_9mm'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
	end object
	Layouts[3]=ClassicParams_TacKnife
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Green'
	begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=MD24_Green
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Black'
	begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MD24_Black
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Desert'
	begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MD24_Desert
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Blue'
	begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=MD24_Blue
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Red'
	begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=MD24_Red
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Gold'
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
// Reference: RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=48,Max=1024)
	AimAdjustTime=0.4500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1400
	ChaosTurnThreshold=196608
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_9mm'
begin object name="ClassicPrimaryFireParams_9mm" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams_9mm'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=3600.0000000
	RangeAtten=0.8500000
	Damage=42
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_FireHeavy',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams_9mm'
begin object name="ClassicPrimaryEffectParams_9mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=3600.0000000
	RangeAtten=0.8000000
	Damage=25
	HeadMult=2.4000000
	LimbMult=0.3000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_Fire',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1400.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
begin object name="ClassicPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	WaterTraceRange=3600.0000000
	RangeAtten=0.7000000
	Damage=25
	HeadMult=2.4000000
	LimbMult=0.3000000
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MD24.MD24_FireSil',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=1300.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
begin object name="ClassicPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
end object
// Reference: FireEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: MeleeEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
begin object name="ClassicSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
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
// Reference: FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
begin object name="ClassicSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
end object
// Reference: AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams_TacKnife'
begin object name="ClassicAimParams_TacKnife" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.4500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1400
	ChaosTurnThreshold=196608
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10mm Super"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
	ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
	MagAmmo=14
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="9mm RDS"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
	ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0500000,AugmentOffset=(X=5.0000000,Y=0.0000000,Z=4.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	MagAmmo=16
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_9mm'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_Supp'
begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="9mm Suppressed"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
	ViewOffset=(X=2.0000000,Y=5.0000000,Z=-2.5000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	MagAmmo=16
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsClassic.ClassicParams_TacKnife'
begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="9mm Tac Knife"
	LayoutTags="tacknife"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=2.5000000)
	ViewOffset=(X=7.0000000,Y=4.0000000,Z=-3.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
	MagAmmo=16
	bNeedCock=true
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsClassic.ClassicAimParams_TacKnife'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicPrimaryFireParams_9mm'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Green'
begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Black'
begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Desert'
begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Blue'
begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Red'
begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsClassic.MD24_Gold'
begin object name="MD24_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Clip-Shine",Index=2,pIndex=-1,AIndex=-1)
	Index=5
end object
