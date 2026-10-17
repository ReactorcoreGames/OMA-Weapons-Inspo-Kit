class SPASShotgunWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Slug"
		LayoutTags="slug"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=5.0000000,Y=-0.0500000,Z=10.2000000)
		MagAmmo=5
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicParams_Shot'
	begin object name="ClassicParams_Shot" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Shot"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=5.0000000,Y=-0.0500000,Z=10.2000000)
		MagAmmo=5
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams_Shot'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[1]=ClassicParams_Shot
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Gray'
	begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SP_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Cobalt'
	begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Cobalt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SP_Cobalt
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Bricks'
	begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bricks"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SP_Bricks
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Hazard'
	begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Hazard"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SP_Hazard
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Gold'
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
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=3196.0000000
	DeclineTime=1.4000000
	ViewBindFactor=0.9000000
	ADSViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=768)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.1500000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=5500.0000000,Max=7000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1500000
	Damage=100
	HeadMult=1.3500000
	LimbMult=0.3000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-HFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=728.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryEffectParams_Shot'
begin object name="ClassicPrimaryEffectParams_Shot" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=1500.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=20
	HeadMult=1.3500000
	LimbMult=0.3000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=700,Y=700)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams_Shot'
begin object name="ClassicPrimaryFireParams_Shot" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryEffectParams_Shot'
end object
// Reference: FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Slug"
	LayoutTags="slug"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=5.0000000,Y=-0.0500000,Z=10.2000000)
	MagAmmo=5
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicParams_Shot'
begin object name="ClassicParams_Shot" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Shot"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=5.0000000,Y=-0.0500000,Z=10.2000000)
	MagAmmo=5
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicPrimaryFireParams_Shot'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Gray'
begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Cobalt'
begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Cobalt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Bricks'
begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bricks"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Hazard'
begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Hazard"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsClassic.SP_Gold'
begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
