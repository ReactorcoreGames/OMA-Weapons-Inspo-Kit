class CYLOWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="UAW"
		LayoutTags="cheap"
		InventorySize=5
		WeaponPrice=800
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		WeaponName="CYLO-III 7.62mm Assault Weapon"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=37
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticParams_FS'
	begin object name="RealisticParams_FS" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Firestorm"
		LayoutTags="inc,heat"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponName="CYLO-V 5.56mm Incendiary Rifle"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
		AllowedCamos[0]=7
		AllowedCamos[1]=8
		AllowedCamos[2]=9
		AllowedCamos[3]=10
		AllowedCamos[4]=11
		AllowedCamos[5]=12
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams_FS'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams_FS'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams_FS'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams_Flame'
	end object
	Layouts[1]=RealisticParams_FS
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Standard'
	begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Best Value"
	end object
	Camos[0]=CYLO_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_CYLO'
	begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="CYLO"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=CYLO_CYLO
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Ork'
	begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Most Dakka"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=CYLO_Ork
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_RealFakeWood'
	begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Real Fake Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=CYLO_RealFakeWood
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_NewRed'
	begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ultracool"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=CYLO_NewRed
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_NewPink'
	begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Girlpower"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=CYLO_NewPink
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Brass'
	begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold?"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=CYLO_Brass
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Orange'
	begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		Index=7
	end object
	Camos[7]=CYLOFS_Orange
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Red'
	begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=CYLOFS_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Blue'
	begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=CYLOFS_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Yellow'
	begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=CYLOFS_Yellow
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_OrangeFancy'
	begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Limited"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=CYLOFS_OrangeFancy
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Gold'
	begin object name="CYLOFS_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainGold",Index=1,pIndex=0,AIndex=0)
		Index=12
	end object
	Camos[12]=CYLOFS_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1400.0000000,Max=7000.0000000)
	WaterTraceRange=4000.0000000
	Damage=50
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLORifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLORifle'
	PenetrationEnergy=22.0000000
	PenetrateForce=70
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=700.0000000
	Chaos=0.1000000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryEffectParams_FS'
begin object name="RealisticPrimaryEffectParams_FS" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=4800.0000000
	RangeAtten=0.0500000
	Damage=43
	HeadMult=2.1395340
	LimbMult=0.6511620
	DamageType=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOFirestormRifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.CYLOFirestormHeatEmitter'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=350.0000000
	Chaos=0.0200000
	Heat=0.1000000
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams_FS'
begin object name="RealisticPrimaryFireParams_FS" class=BCoreProV55.FireParams
	FireInterval=0.0855000
	BurstFireRateFactor=1.0000000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryEffectParams_FS'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	RangeAtten=0.7500000
	Damage=10
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	PenetrationEnergy=4.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1400,Y=1100)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryEffectParams_Flame'
begin object name="RealisticSecondaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunFlameLight'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	RangeAtten=0.1500000
	Damage=10
	DamageType=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgun'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.CYLO.CYLO-FlameFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.3000000
	Inaccuracy=(X=200,Y=200)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams_Flame'
begin object name="RealisticSecondaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	TargetState="FireShot"
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryEffectParams_Flame'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.2500000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MinRandFactor=0.3000000
	MaxRecoil=2800.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams_FS'
begin object name="RealisticRecoilParams_FS" class=BCoreProV55.RecoilParams
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MinRandFactor=0.3000000
	MaxRecoil=3840.0000000
	DeclineTime=1.2000000
	DeclineDelay=0.0000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams_FS'
begin object name="RealisticAimParams_FS" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1200
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="UAW"
	LayoutTags="cheap"
	InventorySize=5
	WeaponPrice=800
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	WeaponName="CYLO-III 7.62mm Assault Weapon"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=37
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticParams_FS'
begin object name="RealisticParams_FS" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Firestorm"
	LayoutTags="inc,heat"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponName="CYLO-V 5.56mm Incendiary Rifle"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
	AllowedCamos[0]=7
	AllowedCamos[1]=8
	AllowedCamos[2]=9
	AllowedCamos[3]=10
	AllowedCamos[4]=11
	AllowedCamos[5]=12
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticRecoilParams_FS'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticAimParams_FS'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticPrimaryFireParams_FS'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.RealisticSecondaryFireParams_Flame'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Standard'
begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Best Value"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_CYLO'
begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="CYLO"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Ork'
begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Most Dakka"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_RealFakeWood'
begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Real Fake Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_NewRed'
begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ultracool"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_NewPink'
begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Girlpower"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLO_Brass'
begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold?"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Orange'
begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Red'
begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Blue'
begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Yellow'
begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_OrangeFancy'
begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Limited"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsRealistic.CYLOFS_Gold'
begin object name="CYLOFS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
