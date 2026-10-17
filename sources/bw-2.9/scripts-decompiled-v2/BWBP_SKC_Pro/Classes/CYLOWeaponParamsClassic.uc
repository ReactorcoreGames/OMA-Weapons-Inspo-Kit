class CYLOWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="UAW IV"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=28
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams_Cheap'
	begin object name="ClassicParams_Cheap" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="UAW II"
		LayoutTags="cheap"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOIV_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOIV_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOPickupHi'
		PickupDrawScale=1.7500000
		AllowedCamos[0]=13
		AllowedCamos[1]=14
		MagAmmo=28
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Cheap
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams_FS'
	begin object name="ClassicParams_FS" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Firestorm V"
		LayoutTags="inc,heat,charge"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
		AllowedCamos[0]=7
		AllowedCamos[1]=8
		AllowedCamos[2]=9
		AllowedCamos[3]=10
		AllowedCamos[4]=11
		AllowedCamos[5]=12
		MagAmmo=35
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams_FS'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams_FS'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams_FS'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams_Flame'
	end object
	Layouts[2]=ClassicParams_FS
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Standard'
	begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Best Value"
	end object
	Camos[0]=CYLO_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_CYLO'
	begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="CYLO"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=CYLO_CYLO
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Ork'
	begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Most Dakka"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=CYLO_Ork
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_RealFakeWood'
	begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Real Fake Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=CYLO_RealFakeWood
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_NewRed'
	begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ultracool"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=CYLO_NewRed
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_NewPink'
	begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Girlpower"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=CYLO_NewPink
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Brass'
	begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold?"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=CYLO_Brass
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Orange'
	begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		Index=7
	end object
	Camos[7]=CYLOFS_Orange
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Red'
	begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=CYLOFS_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Blue'
	begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=CYLOFS_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Yellow'
	begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=CYLOFS_Yellow
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_OrangeFancy'
	begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Limited"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=CYLOFS_OrangeFancy
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Gold'
	begin object name="CYLOFS_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainGold",Index=1,pIndex=0,AIndex=0)
		Index=12
	end object
	Camos[12]=CYLOFS_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOld_Tan'
	begin object name="CYLOld_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Real Brown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-MainShineMK1',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=13
	end object
	Camos[13]=CYLOld_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOld_Black'
	begin object name="CYLOld_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black (TM)"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-MainShineMK2',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=14
	end object
	Camos[14]=CYLOld_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1600)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.9000000
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
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=-0.0500000),(InVal=0.1500000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=1024.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0855000
	BurstFireRateFactor=1.0000000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.6500000
	Damage=35
	HeadMult=2.5000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLORifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLORifle'
	PenetrationEnergy=32.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=130.0000000
	Chaos=0.0100000
	Inaccuracy=(X=96,Y=96)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryEffectParams_FS'
begin object name="ClassicPrimaryEffectParams_FS" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=2400.0000000
	RangeAtten=0.5500000
	Damage=22
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOFirestormRifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	PenetrationEnergy=20.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.CYLOFirestormHeatEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=110.0000000
	Chaos=0.0200000
	Heat=0.7500000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams_FS'
begin object name="ClassicPrimaryFireParams_FS" class=BCoreProV55.FireParams
	FireInterval=0.0855000
	BurstFireRateFactor=1.0000000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryEffectParams_FS'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=1250.0000000,Max=1700.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=15
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1400,Y=1100)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryEffectParams_Flame'
begin object name="ClassicSecondaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=4
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunFlameLight'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=1572.0000000,Max=1572.0000000)
	RangeAtten=0.2000000
	Damage=15
	DamageType=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CYLOFirestormShotgun'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.CYLO.CYLO-FlameFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.3000000
	Inaccuracy=(X=1250,Y=1250)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams_Flame'
begin object name="ClassicSecondaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	TargetState="FireShot"
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryEffectParams_Flame'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams_FS'
begin object name="ClassicRecoilParams_FS" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=-0.0500000),(InVal=0.1500000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3840.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams_FS'
begin object name="ClassicAimParams_FS" class=BCoreProV55.AimParams
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
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="UAW IV"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=28
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams_Cheap'
begin object name="ClassicParams_Cheap" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="UAW II"
	LayoutTags="cheap"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOIV_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOIV_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOPickupHi'
	PickupDrawScale=1.7500000
	AllowedCamos[0]=13
	AllowedCamos[1]=14
	MagAmmo=28
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicParams_FS'
begin object name="ClassicParams_FS" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Firestorm V"
	LayoutTags="inc,heat,charge"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ViewOffset=(X=9.0000000,Y=7.0000000,Z=-4.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
	AllowedCamos[0]=7
	AllowedCamos[1]=8
	AllowedCamos[2]=9
	AllowedCamos[3]=10
	AllowedCamos[4]=11
	AllowedCamos[5]=12
	MagAmmo=35
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicRecoilParams_FS'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicAimParams_FS'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicPrimaryFireParams_FS'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsClassic.ClassicSecondaryFireParams_Flame'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Standard'
begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Best Value"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_CYLO'
begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="CYLO"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Ork'
begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Most Dakka"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_RealFakeWood'
begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Real Fake Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_NewRed'
begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ultracool"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_NewPink'
begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Girlpower"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLO_Brass'
begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold?"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Orange'
begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Red'
begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Blue'
begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Yellow'
begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_OrangeFancy'
begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Limited"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOFS_Gold'
begin object name="CYLOFS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOld_Tan'
begin object name="CYLOld_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Real Brown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-MainShineMK1',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=13
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsClassic.CYLOld_Black'
begin object name="CYLOld_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black (TM)"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-MainShineMK2',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=14
end object
