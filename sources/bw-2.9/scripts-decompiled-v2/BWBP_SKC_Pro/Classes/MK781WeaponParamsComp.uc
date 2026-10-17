class MK781WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams_Holo'
	begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holo + LAM"
		LayoutTags="lam,no_suppressor"
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.5000000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.3000000
		SightOffset=(X=4.2000000,Y=0.0200000,Z=6.9700000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltFireParams'
	end object
	Layouts[0]=ArenaParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressed"
		LayoutTags="start_suppressed"
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.5000000
		SightingTime=0.3000000
		SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
		SightPivot=(Pitch=-64,Yaw=10,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltFireParams'
	end object
	Layouts[1]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams_ScopeDart'
	begin object name="ArenaParams_ScopeDart" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope + Sabot"
		LayoutTags="lam,no_suppressor,no_alt,slug"
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.5000000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
		FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
		FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
		FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_ScopeDart
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Gray'
	begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
		Weight=40
		CamoName="Gray"
	end object
	Camos[0]=M781_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Digital'
	begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=M781_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Desert'
	begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=M781_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Jungle'
	begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle Hex"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=M781_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Winter'
	begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=M781_Winter
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Wood'
	begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="Ol' Trusty"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
		Index=5
	end object
	Camos[5]=M781_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_RedTiger'
	begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
		Index=6
	end object
	Camos[6]=M781_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3250000
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	TargetState="ElektroShot"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
begin object name="ArenaPrimaryFireParams_Dart" class=BCoreProV55.FireParams
	FireInterval=0.3250000
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryEffectParams_Dart'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.0400000),(InVal=0.4000000,OutVal=0.0200000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.7500000,OutVal=-0.0500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	ViewBindFactor=0.4500000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltFireParams'
begin object name="ArenaSecondaryBoltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	TargetState="ElektroSlug"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilFireParams'
begin object name="ArenaPrimarySilFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3250000
	FireEndAnim="None"
	FireAnimRate=1.1500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.4500000
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilEffectParams'
begin object name="ArenaPrimarySilEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Flechette'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=3000.0000000,Max=5000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.4500000
	Damage=10
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=16.0000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Mk781.Mk781-FireSupp',Volume=2.0500000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=512.0000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryEffectParams_Dart'
begin object name="ArenaPrimaryEffectParams_Dart" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	WaterTraceRange=3400.0000000
	DecayRange=(Min=3400.0000000,Max=9000.0000000)
	RangeAtten=0.4500000
	Damage=85
	HeadMult=2.2500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTM781Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTM781ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTM781Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=200
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Mk781.MK781-FireDart',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1400.0000000
	Chaos=0.1200000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_Mk781Electro'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.HyperBeamCannon.343Primary-Hit',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Inaccuracy=(X=150,Y=150)
	BotRefireRate=0.9000000
	WarnTargetPct=0.0100000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltEffectParams'
begin object name="ArenaSecondaryBoltEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MK781PulseProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=2500.0000000
	MaxSpeed=5000.0000000
	Damage=125.0000000
	DamageRadius=256.0000000
	MomentumTransfer=70000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressed"
	LayoutTags="start_suppressed"
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.5000000
	SightingTime=0.3000000
	SightOffset=(X=-5.0000000,Y=0.0100000,Z=2.6500000)
	SightPivot=(Pitch=-64,Yaw=10,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams_Holo'
begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holo + LAM"
	LayoutTags="lam,no_suppressor"
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.5000000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.3000000
	SightOffset=(X=4.2000000,Y=0.0200000,Z=6.9700000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimarySilFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryBoltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaParams_ScopeDart'
begin object name="ArenaParams_ScopeDart" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope + Sabot"
	LayoutTags="lam,no_suppressor,no_alt,slug"
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.5000000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=4.0000000,Y=0.0000000,Z=8.6000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShellHolder",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="HShells",Slot=9,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-12.0000000,Y=0.0000000,Z=-1.1000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_3XScope',BoneName="tip",Scale=0.1500000,AugmentOffset=(X=-28.0000000,Y=0.0000000,Z=-0.3000000),AugmentRot=(Pitch=0,Yaw=32678,Roll=16384))
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
	FireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
	FireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
	FireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaPrimaryFireParams_Dart'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.MK781WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Gray'
begin object name="M781_Gray" class=BCoreProV55.WeaponCamo
	Weight=40
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Digital'
begin object name="M781_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDigital",Index=1,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Desert'
begin object name="M781_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoDesert",Index=1,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Jungle'
begin object name="M781_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle Hex"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoJungle",Index=1,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Winter'
begin object name="M781_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWinter",Index=1,pIndex=2,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Wood'
begin object name="M781_Wood" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="Ol' Trusty"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoWood",Index=1,pIndex=2,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_RedTiger'
begin object name="M781_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoTiger",Index=1,pIndex=2,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MK781WeaponParamsComp.M781_Gold'
begin object name="M781_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M1014Camos.M1014-MainCamoGold",Index=1,pIndex=2,AIndex=1)
	Index=7
end object
