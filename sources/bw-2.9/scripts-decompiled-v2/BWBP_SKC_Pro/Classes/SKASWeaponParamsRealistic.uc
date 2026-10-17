class SKASWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Rotary"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponName="SKAS-21 10ga Automatic Shotgun"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=36
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryAutoParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireSemiParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams_Gatling'
	begin object name="RealisticParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Gatling"
		LayoutTags="spinup"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponName="SKAS-21 12ga Gatling Shotgun"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=40
		WeaponModes[0]=(ModeName="Gatling",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireSemiParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Gatling'
	end object
	Layouts[1]=RealisticParams_Gatling
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams_Frag'
	begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="SRAC HE"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		WeaponName="SKAS-21 10ga Automatic Shotgun"
		AllowedCamos[0]=7
		AllowedCamos[1]=8
		AllowedCamos[2]=9
		AllowedCamos[3]=10
		AllowedCamos[4]=11
		AllowedCamos[5]=12
		AllowedCamos[6]=13
		AllowedCamos[7]=14
		MagAmmo=36
		WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_FragManual'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Frag
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Gray'
	begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SKAS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Urban'
	begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SKAS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Digital'
	begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SKAS_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Desert'
	begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SKAS_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Jungle'
	begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SKAS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Glitch'
	begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="XR4"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=SKAS_Glitch
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Glitch2'
	begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="11011"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=SKAS_Glitch2
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Gray'
	begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
		Index=7
	end object
	Camos[7]=SRAC_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Tactical'
	begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=SRAC_Tactical
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Steel'
	begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Steel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=SRAC_Steel
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Blood'
	begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=SRAC_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Tiger'
	begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=SRAC_Tiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_DarkTiger'
	begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Dark Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
		Index=12
	end object
	Camos[12]=SRAC_DarkTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Pink'
	begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
		Index=13
	end object
	Camos[13]=SRAC_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.3500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.6000000)))
	PitchFactor=0.0000000
	YawFactor=0.0000000
	XRandFactor=1.0000000
	YRandFactor=1.0000000
	MaxRecoil=2048.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.0500000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=26
	LimbMult=0.3333330
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SKAS.SKAS-Rapid',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=300.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=900,Y=900)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireSemiParams'
begin object name="RealisticPrimaryFireSemiParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualFireParams'
begin object name="RealisticPrimaryManualFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7500000
	FireAnim="SemiFire"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
begin object name="RealisticPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=30
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.8500000
	Damage=26
	HeadMult=1.4000000
	LimbMult=0.3571420
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgunAlt'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Triple',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1600,Y=1600)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	TargetState="SpinUpFire"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryAutoParams'
begin object name="RealisticPrimaryAutoParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualEffectParams'
begin object name="RealisticPrimaryManualEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	RangeAtten=0.4000000
	Damage=26
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Power',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.2500000
	Inaccuracy=(X=350,Y=350)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
begin object name="RealisticPrimaryEffectParams_Frag" class=BCoreProV55.ProjectileEffectParams
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
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams_FragManual'
begin object name="RealisticPrimaryEffectParams_FragManual" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SKASRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=200.0000000
	MaxSpeed=100000.0000000
	AccelSpeed=50000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.SRAC-Fire',Volume=1.4500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_FragManual'
begin object name="RealisticPrimaryFireParams_FragManual" class=BCoreProV55.FireParams
	FireInterval=1.7500000
	TargetState="Projectile"
	FireAnim="SemiFire"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryEffectParams_FragManual'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=3
	BurstFireRateFactor=1.0000000
	PreFireAnim="ChargeUp"
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Gatling'
begin object name="RealisticSecondaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=3
	TargetState="SpinUpFire"
	BurstFireRateFactor=1.0000000
	PreFireAnim="ChargeUp"
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Rotary"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponName="SKAS-21 10ga Automatic Shotgun"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=36
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryAutoParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireSemiParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams_Gatling'
begin object name="RealisticParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Gatling"
	LayoutTags="spinup"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponName="SKAS-21 12ga Gatling Shotgun"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=40
	WeaponModes[0]=(ModeName="Gatling",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryManualFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireSemiParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Gatling'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticParams_Frag'
begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="SRAC HE"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	WeaponName="SKAS-21 10ga Automatic Shotgun"
	AllowedCamos[0]=7
	AllowedCamos[1]=8
	AllowedCamos[2]=9
	AllowedCamos[3]=10
	AllowedCamos[4]=11
	AllowedCamos[5]=12
	AllowedCamos[6]=13
	AllowedCamos[7]=14
	MagAmmo=36
	WeaponModes[0]=(ModeName="Automatic",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Automatic",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="1110011",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="XR4 System",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_FragManual'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Gray'
begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Urban'
begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Digital'
begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Desert'
begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Jungle'
begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Glitch'
begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="XR4"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SKAS_Glitch2'
begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="11011"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Gray'
begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Tactical'
begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Steel'
begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Steel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Blood'
begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Tiger'
begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_DarkTiger'
begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Dark Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Pink'
begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
	Index=13
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsRealistic.SRAC_Gold'
begin object name="SRAC_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=14
end object
