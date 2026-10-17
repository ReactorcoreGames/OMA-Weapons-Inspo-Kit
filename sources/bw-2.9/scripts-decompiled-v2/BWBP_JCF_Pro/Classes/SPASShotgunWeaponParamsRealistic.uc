class SPASShotgunWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Slug"
		LayoutTags="slug"
		CockAnimRate=1.4000000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=2.0000000,Y=-0.0500000,Z=10.2000000)
		WeaponName="SP-12 12ga Slug Shotgun"
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
		bNoaltfire=true
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticParams_Shot'
	begin object name="RealisticParams_Shot" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Shot"
		CockAnimRate=1.4000000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=2.0000000,Y=-0.0500000,Z=10.2000000)
		WeaponName="SP-12 12ga Shotgun"
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams_Shot'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
		bNoaltfire=true
	end object
	Layouts[1]=RealisticParams_Shot
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Gray'
	begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SP_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Cobalt'
	begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Cobalt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SP_Cobalt
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Bricks'
	begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bricks"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SP_Bricks
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Hazard'
	begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Hazard"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SP_Hazard
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Gold'
	begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SP_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1500.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.2000000
	ViewBindFactor=0.7000000
	ADSViewBindFactor=0.7000000
	CrouchMultiplier=0.8750000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=640,Max=1280)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8750000
	ADSMultiplier=0.8750000
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=600
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=7000.0000000,Max=7000.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1200.0000000,Max=7000.0000000)
	Damage=140
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-HFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1500.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryEffectParams_Shot'
begin object name="RealisticPrimaryEffectParams_Shot" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=4200.0000000,Max=4200.0000000)
	WaterTraceRange=4800.0000000
	DecayRange=(Min=1200.0000000,Max=4200.0000000)
	Damage=16
	HeadMult=2.2500000
	LimbMult=0.6660000
	DamageType=Class'BallisticProV55.DTM763Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM763ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM763Shotgun'
	PenetrationEnergy=7.0000000
	PenetrateForce=24
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=920.0000000
	Chaos=0.1200000
	Inaccuracy=(X=450,Y=450)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams_Shot'
begin object name="RealisticPrimaryFireParams_Shot" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryEffectParams_Shot'
end object
// Reference: FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Slug"
	LayoutTags="slug"
	CockAnimRate=1.4000000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=2.0000000,Y=-0.0500000,Z=10.2000000)
	WeaponName="SP-12 12ga Slug Shotgun"
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticParams_Shot'
begin object name="RealisticParams_Shot" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Shot"
	CockAnimRate=1.4000000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=2.0000000,Y=-0.0500000,Z=10.2000000)
	WeaponName="SP-12 12ga Shotgun"
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticPrimaryFireParams_Shot'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.RealisticSecondaryFireParams'
	bNoaltfire=true
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Gray'
begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Cobalt'
begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Cobalt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Bricks'
begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bricks"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Hazard'
begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Hazard"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsRealistic.SP_Gold'
begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
