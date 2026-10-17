class SKASWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Rotary"
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
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
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaManualFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams_Gatling'
	begin object name="ArenaParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Gatling"
		LayoutTags="spinup"
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		WeaponModes[0]=(ModeName="Gatling",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams_Gatling'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Gatling'
	end object
	Layouts[1]=ArenaParams_Gatling
	// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams_Frag'
	begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="SRAC HE"
		InventorySize=8
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
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
		WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_Frag'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_FragManual'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_Frag
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Gray'
	begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SKAS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Urban'
	begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SKAS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Digital'
	begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SKAS_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Desert'
	begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SKAS_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Jungle'
	begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SKAS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Glitch'
	begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="XR4"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=SKAS_Glitch
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Glitch2'
	begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="11011"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=SKAS_Glitch2
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Gray'
	begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
		Index=7
	end object
	Camos[7]=SRAC_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Tactical'
	begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=SRAC_Tactical
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Steel'
	begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Steel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=SRAC_Steel
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Blood'
	begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=SRAC_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Tiger'
	begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=SRAC_Tiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_DarkTiger'
	begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Dark Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
		Index=12
	end object
	Camos[12]=SRAC_DarkTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Pink'
	begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
		Index=13
	end object
	Camos[13]=SRAC_Pink
	// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0500000
	DeclineTime=0.7500000
	DeclineDelay=0.4500000
	ViewBindFactor=0.4500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=30
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6000000
	Damage=13
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
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoEffectParams'
begin object name="ArenaAutoEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.2500000
	Damage=17
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
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams'
begin object name="ArenaAutoFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaManualEffectParams'
begin object name="ArenaManualEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=4096.0000000)
	DecayRange=(Min=1000.0000000,Max=2500.0000000)
	RangeAtten=0.2500000
	Damage=17
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
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaManualFireParams'
begin object name="ArenaManualFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7500000
	FireAnim="SemiFire"
	FireEndAnim="None"
	FireAnimRate=1.4500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaManualEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoEffectParams_Gatling'
begin object name="ArenaAutoEffectParams_Gatling" class=BCoreProV55.ShotgunEffectParams
	TraceCount=4
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.2500000
	Damage=30
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SKAS.SKAS-Rapid',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=50.0000000
	PushbackForce=180.0000000
	Chaos=0.3000000
	Inaccuracy=(X=310,Y=310)
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams_Gatling'
begin object name="ArenaAutoFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	TargetState="SpinUpFire"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoEffectParams_Gatling'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryEffectParams_Frag'
begin object name="ArenaPrimaryEffectParams_Frag" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SKASRocket'
	SpawnOffset=(X=120.0000000,Y=25.0000000,Z=-30.0000000)
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
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_Frag'
begin object name="ArenaPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	FireAnim="FireRot"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryEffectParams_Frag'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryEffectParams_FragManual'
begin object name="ArenaPrimaryEffectParams_FragManual" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_FragManual'
begin object name="ArenaPrimaryFireParams_FragManual" class=BCoreProV55.FireParams
	FireInterval=1.7500000
	TargetState="Projectile"
	FireAnim="SemiFire"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryEffectParams_FragManual'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=3
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Gatling'
begin object name="ArenaSecondaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=3
	TargetState="SpinUpFire"
	FireAnim="FireBig"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Rotary"
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
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
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaManualFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams_Gatling'
begin object name="ArenaParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Gatling"
	LayoutTags="spinup"
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	WeaponModes[0]=(ModeName="Gatling",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Manual",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAutoFireParams_Gatling'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Gatling'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaParams_Frag'
begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="SRAC HE"
	InventorySize=8
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
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
	WeaponModes[1]=(ModeName="Manual",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_Frag'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaPrimaryFireParams_FragManual'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SKASWeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Gray'
begin object name="SKAS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Urban'
begin object name="SKAS_Urban" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoU",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Digital'
begin object name="SKAS_Digital" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoT",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Desert'
begin object name="SKAS_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoD",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Jungle'
begin object name="SKAS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-CamoG",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Glitch'
begin object name="SKAS_Glitch" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="XR4"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-Charged",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SKAS_Glitch2'
begin object name="SKAS_Glitch2" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="11011"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SKAS-BlueGlow",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Gray'
begin object name="SRAC_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-MainShine",Index=1,pIndex=0,AIndex=0)
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Tactical'
begin object name="SRAC_Tactical" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TacticalShine",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Steel'
begin object name="SRAC_Steel" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Steel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-SteelShine",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Blood'
begin object name="SRAC_Blood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-BloodShine",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Tiger'
begin object name="SRAC_Tiger" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-RedTiger",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_DarkTiger'
begin object name="SRAC_DarkTiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Dark Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-TigerShine",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Pink'
begin object name="SRAC_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-PinkShine",Index=1,pIndex=0,AIndex=0)
	Index=13
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SKASWeaponParamsComp.SRAC_Gold'
begin object name="SRAC_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SKASCamos.SRAC-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=14
end object
