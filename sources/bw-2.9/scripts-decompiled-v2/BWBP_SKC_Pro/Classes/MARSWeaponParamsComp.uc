class MARSWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Smoke'
	begin object name="ArenaParams_Smoke" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Smoker"
		LayoutTags="NV,tracker"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
		ZoomType=1
		ScopeScale=0.6000000
		MaxZoom=3.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Smoke'
	end object
	Layouts[0]=ArenaParams_Smoke
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Sensor'
	begin object name="ArenaParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Tracker"
		LayoutTags="tracker"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
		ZoomType=1
		ScopeScale=0.6000000
		MaxZoom=3.0000000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Sensor'
	end object
	Layouts[1]=ArenaParams_Sensor
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Holo'
	begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="CQC Icestorm"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams_CQC'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams_CQC'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams_CQC'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Ice'
	end object
	Layouts[2]=ArenaParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Black'
	begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=MARS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Tan'
	begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Tan"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=MARS_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Green'
	begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=MARS_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Urban'
	begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=MARS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Arctic'
	begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=MARS_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Proto'
	begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=MARS_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_LE'
	begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Limited Edition"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=MARS_LE
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2500000,OutVal=0.0800000),(InVal=0.3500000,OutVal=0.0700000),(InVal=0.4800000,OutVal=0.0900000),(InVal=0.6000000,OutVal=-0.0200000),(InVal=0.7500000,OutVal=0.0300000),(InVal=0.9000000,OutVal=0.0600000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=150.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryEffectParams_CQC'
begin object name="ArenaPrimaryEffectParams_CQC" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=150.0000000
	Chaos=0.0200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams_CQC'
begin object name="ArenaPrimaryFireParams_CQC" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryEffectParams_CQC'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Smoke'
begin object name="ArenaSecondaryEffectParams_Smoke" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Chaff'
	SpawnOffset=(X=35.0000000,Y=5.0000000,Z=-15.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=65.0000000
	DamageRadius=512.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Smoke'
begin object name="ArenaSecondaryFireParams_Smoke" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Smoke'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Sensor'
begin object name="ArenaSecondaryEffectParams_Sensor" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Sensor'
	SpawnOffset=(X=35.0000000,Y=5.0000000,Z=-15.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=15.0000000
	DamageRadius=16.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Sensor'
begin object name="ArenaSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Sensor'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Ice'
begin object name="ArenaSecondaryEffectParams_Ice" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Ice'
	SpawnOffset=(X=35.0000000,Y=5.0000000,Z=-15.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=50.0000000
	DamageRadius=768.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Ice'
begin object name="ArenaSecondaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryEffectParams_Ice'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams_CQC'
begin object name="ArenaRecoilParams_CQC" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2500000,OutVal=0.0800000),(InVal=0.3500000,OutVal=0.0700000),(InVal=0.4800000,OutVal=0.0900000),(InVal=0.6000000,OutVal=-0.0200000),(InVal=0.7500000,OutVal=0.0300000),(InVal=0.9000000,OutVal=0.0600000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams_CQC'
begin object name="ArenaAimParams_CQC" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Smoke'
begin object name="ArenaParams_Smoke" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Smoker"
	LayoutTags="NV,tracker"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	ZoomType=1
	ScopeScale=0.6000000
	MaxZoom=3.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.MARS.F2000-LensShineAltGreen',MaterialName="",Index=3,pIndex=2,AIndex=3)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Smoke'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Sensor'
begin object name="ArenaParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Tracker"
	LayoutTags="tracker"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=0.8000000)
	ZoomType=1
	ScopeScale=0.6000000
	MaxZoom=3.0000000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.F2000_FPm'
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Sensor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaParams_Holo'
begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="CQC Icestorm"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaRecoilParams_CQC'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaAimParams_CQC'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaPrimaryFireParams_CQC'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsComp.ArenaSecondaryFireParams_Ice'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Black'
begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Tan'
begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Green'
begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Urban'
begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Arctic'
begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_Proto'
begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsComp.MARS_LE'
begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Limited Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
