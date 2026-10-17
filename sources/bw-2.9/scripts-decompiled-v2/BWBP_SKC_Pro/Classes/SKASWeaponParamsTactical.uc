class SKASWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Rotary"
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=24
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams_Gatling'
	begin object name="TacticalParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Gatling"
		LayoutTags="spinup"
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams_Gatling'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Gatling'
	end object
	Layouts[1]=TacticalParams_Gatling
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams_Frag'
	begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="SRAC HE"
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.0000000)
		AllowedCamos[0]=7
		AllowedCamos[1]=8
		AllowedCamos[2]=9
		AllowedCamos[3]=10
		AllowedCamos[4]=11
		AllowedCamos[5]=12
		AllowedCamos[6]=13
		AllowedCamos[7]=14
		MagAmmo=24
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_Frag
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Gray'
	begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SKAS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Urban'
	begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SKAS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Digital'
	begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SKAS_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Desert'
	begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SKAS_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Jungle'
	begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SKAS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Glitch'
	begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="XR4"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=SKAS_Glitch
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Glitch2'
	begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="11011"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=SKAS_Glitch2
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Gray'
	begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
		Index=7
	end object
	Camos[7]=SRAC_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Tactical'
	begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=SRAC_Tactical
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Steel'
	begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Steel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=SRAC_Steel
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Blood'
	begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=SRAC_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Tiger'
	begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=SRAC_Tiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_DarkTiger'
	begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Dark Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
		Index=12
	end object
	Camos[12]=SRAC_DarkTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Pink'
	begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
		Index=13
	end object
	Camos[13]=SRAC_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Gold'
	begin object name="SRAC_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=14
	end object
	Camos[14]=SRAC_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0500000
	DeclineTime=0.7500000
	DeclineDelay=0.4500000
	EscapeMultiplier=1.3000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualFireParams'
begin object name="TacticalManualFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7500000
	FireAnim="SemiFire"
	FireEndAnim="None"
	FireAnimRate=1.4500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=30
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.2000000
	Damage=45
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Triple',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1500.0000000
	PushbackForce=850.0000000
	Chaos=1.0000000
	Inaccuracy=(X=378,Y=378)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoEffectParams'
begin object name="TacticalAutoEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.2500000
	Damage=17
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Single',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=550.0000000
	PushbackForce=180.0000000
	Chaos=0.3000000
	Inaccuracy=(X=310,Y=310)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams'
begin object name="TacticalAutoFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualEffectParams'
begin object name="TacticalManualEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=4096.0000000)
	DecayRange=(Min=2100.0000000,Max=6200.0000000)
	RangeAtten=0.2500000
	Damage=20
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Power',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	PushbackForce=180.0000000
	Chaos=0.2000000
	Inaccuracy=(X=35,Y=35)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoEffectParams_Gatling'
begin object name="TacticalAutoEffectParams_Gatling" class=BCoreProV55.ShotgunEffectParams
	TraceCount=5
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.2500000
	Damage=30
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SKAS.SKAS-Rapid',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=350.0000000
	PushbackForce=180.0000000
	Chaos=0.3000000
	Inaccuracy=(X=310,Y=310)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams_Gatling'
begin object name="TacticalAutoFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	TargetState="SpinUpFire"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoEffectParams_Gatling'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
begin object name="TacticalPrimaryEffectParams_Frag" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SKASRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=150.0000000
	MaxSpeed=50000.0000000
	AccelSpeed=25000.0000000
	Damage=105.0000000
	DamageRadius=130.0000000
	MomentumTransfer=30000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.SRAC-Fire2',Volume=1.4500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
begin object name="TacticalPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=3
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Gatling'
begin object name="TacticalSecondaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=3
	TargetState="SpinUpFire"
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Rotary"
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=24
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams_Gatling'
begin object name="TacticalParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Gatling"
	LayoutTags="spinup"
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=5.0000000,Z=-4.5000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAutoFireParams_Gatling'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalManualFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Gatling'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalParams_Frag'
begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="SRAC HE"
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-2.0000000)
	AllowedCamos[0]=7
	AllowedCamos[1]=8
	AllowedCamos[2]=9
	AllowedCamos[3]=10
	AllowedCamos[4]=11
	AllowedCamos[5]=12
	AllowedCamos[6]=13
	AllowedCamos[7]=14
	MagAmmo=24
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Gray'
begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Urban'
begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Digital'
begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Desert'
begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Jungle'
begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Glitch'
begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="XR4"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SKAS_Glitch2'
begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="11011"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Gray'
begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Tactical'
begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Steel'
begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Steel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Blood'
begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Tiger'
begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_DarkTiger'
begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Dark Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Pink'
begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
	Index=13
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsTactical.SRAC_Gold'
begin object name="SRAC_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=14
end object
