class SPASShotgunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Slug"
		LayoutTags="slug"
		InventorySize=5
		ReloadAnimRate=1.5000000
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
		ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalParams_Shot'
	begin object name="TacticalParams_Shot" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Shot"
		InventorySize=5
		ReloadAnimRate=1.5000000
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
		ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams_Shot'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[1]=TacticalParams_Shot
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Gray'
	begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SP_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Cobalt'
	begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Cobalt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SP_Cobalt
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Bricks'
	begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bricks"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SP_Bricks
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Hazard'
	begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Hazard"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SP_Hazard
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Gold'
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
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.1300000),(InVal=0.5500000,OutVal=0.2300000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0750000
	DeclineTime=0.7500000
	DeclineDelay=0.5500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=5500.0000000,Max=7000.0000000)
	WaterTraceRange=1000.0000000
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	Damage=140
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-HFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1500.0000000
	Chaos=0.4000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryEffectParams_Shot'
begin object name="TacticalPrimaryEffectParams_Shot" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.1500000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.3000000
	Inaccuracy=(X=300,Y=300)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams_Shot'
begin object name="TacticalPrimaryFireParams_Shot" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryEffectParams_Shot'
end object
// Reference: FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Slug"
	LayoutTags="slug"
	InventorySize=5
	ReloadAnimRate=1.5000000
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
	ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalParams_Shot'
begin object name="TacticalParams_Shot" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Shot"
	InventorySize=5
	ReloadAnimRate=1.5000000
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
	ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalPrimaryFireParams_Shot'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Gray'
begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Cobalt'
begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Cobalt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Bricks'
begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bricks"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Hazard'
begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Hazard"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsTactical.SP_Gold'
begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
