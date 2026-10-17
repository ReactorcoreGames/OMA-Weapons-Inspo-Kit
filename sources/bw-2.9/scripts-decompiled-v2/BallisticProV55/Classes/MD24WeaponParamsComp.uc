class MD24WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="9mm RDS"
		InventorySize=2
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0500000,AugmentOffset=(X=5.0000000,Y=0.0000000,Z=4.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="9mm Suppressed"
		InventorySize=2
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Supp
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_TacKnife'
	begin object name="ArenaParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="9mm Tac Knife"
		InventorySize=2
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
		WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams_TacKnife'
	end object
	Layouts[2]=ArenaParams_TacKnife
	// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_10mm'
	begin object name="ArenaParams_10mm" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10mm Super"
		InventorySize=2
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
		DisplaceDurationMult=0.3300000
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_10mm'
		AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[3]=ArenaParams_10mm
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Green'
	begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=MD24_Green
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Black'
	begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MD24_Black
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Desert'
	begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MD24_Desert
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Blue'
	begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=MD24_Blue
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Red'
	begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=MD24_Red
	// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Gold'
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
// Reference: RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0300000
	YRandFactor=0.0300000
	ClimbTime=0.0600000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6500000
end object
// Reference: AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimAdjustTime=0.4500000
	ADSMultiplier=2.0000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=23
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
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
begin object name="ArenaPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=23
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
	Chaos=0.2000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_Supp'
begin object name="ArenaPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams_10mm'
begin object name="ArenaPrimaryEffectParams_10mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=35
	DamageType=Class'BallisticProV55.DTMD24Pistol'
	DamageTypeHead=Class'BallisticProV55.DTMD24PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTMD24Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.8500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MD24.MD24_FireHeavy',Volume=4.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.2000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_10mm'
begin object name="ArenaPrimaryFireParams_10mm" class=BCoreProV55.FireParams
	FireInterval=0.2300000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryEffectParams_10mm'
end object
// Reference: FireEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: MeleeEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryEffectParams_TacKnife'
begin object name="ArenaSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
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
// Reference: FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams_TacKnife'
begin object name="ArenaSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryEffectParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="9mm RDS"
	InventorySize=2
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0500000,AugmentOffset=(X=5.0000000,Y=0.0000000,Z=4.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="9mm Suppressed"
	InventorySize=2
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0400000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_TacKnife'
begin object name="ArenaParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="9mm Tac Knife"
	InventorySize=2
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=-0.0100000,Z=1.8200000)
	WeaponBoneScales[0]=(BoneName="IronSights",Slot=50,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.MD24Melee_FPm'
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BallisticProV55.MD24WeaponParamsComp.ArenaParams_10mm'
begin object name="ArenaParams_10mm" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10mm Super"
	InventorySize=2
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-7.0000000,Y=0.0000000,Z=1.7000000)
	DisplaceDurationMult=0.3300000
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BallisticProV55.MD24WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MD24WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaPrimaryFireParams_10mm'
	AltFireParams[0]=FireParams'BallisticProV55.MD24WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Green'
begin object name="MD24_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Black'
begin object name="MD24_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlackShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Desert'
begin object name="MD24_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24DesertShine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Blue'
begin object name="MD24_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24BlueShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Red'
begin object name="MD24_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24RedShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.MD24WeaponParamsComp.MD24_Gold'
begin object name="MD24_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MD24Camos.MD24Gold-Clip-Shine",Index=2,pIndex=-1,AIndex=-1)
	Index=5
end object
