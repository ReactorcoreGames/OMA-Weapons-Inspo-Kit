class CYLOWeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="UAW"
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		WeaponBoneScales[0]=(BoneName="ElecSight",Slot=54,Scale=0.0000000)
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		AllowedCamos[5]=5
		AllowedCamos[6]=6
		MagAmmo=22
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalParams_FS'
	begin object name="TacticalParams_FS" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Firestorm"
		LayoutTags="inc,exp,heat,slug"
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
		AllowedCamos[0]=7
		AllowedCamos[1]=8
		AllowedCamos[2]=9
		AllowedCamos[3]=10
		AllowedCamos[4]=11
		AllowedCamos[5]=12
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams_FS'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams_FS'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams_Slug'
	end object
	Layouts[1]=TacticalParams_FS
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Standard'
	begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Best Value"
	end object
	Camos[0]=CYLO_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_CYLO'
	begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="CYLO"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=CYLO_CYLO
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Ork'
	begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Most Dakka"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=CYLO_Ork
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_RealFakeWood'
	begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Real Fake Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=CYLO_RealFakeWood
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_NewRed'
	begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ultracool"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=CYLO_NewRed
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_NewPink'
	begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Girlpower"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=CYLO_NewPink
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Brass'
	begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold?"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=CYLO_Brass
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Orange'
	begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		Index=7
	end object
	Camos[7]=CYLOFS_Orange
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Red'
	begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
		Index=8
	end object
	Camos[8]=CYLOFS_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Blue'
	begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
		Index=9
	end object
	Camos[9]=CYLOFS_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Yellow'
	begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
		Index=10
	end object
	Camos[10]=CYLOFS_Yellow
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_OrangeFancy'
	begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Limited"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
		Index=11
	end object
	Camos[11]=CYLOFS_OrangeFancy
	// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=45
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLORifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLORifle'
	PenetrationEnergy=32.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=300.0000000
	Chaos=0.0320000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1320000
	PreFireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryEffectParams_FS'
begin object name="TacticalPrimaryEffectParams_FS" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=45
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOFirestormRifleHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOFirestormRifle'
	PenetrateForce=180
	MuzzleFlashClass=Class'BWBP_SKC_Pro.CYLOFirestormHeatEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=320.0000000
	Chaos=0.0650000
	Heat=0.1000000
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams_FS'
begin object name="TacticalPrimaryFireParams_FS" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	PreFireAnim="None"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryEffectParams_FS'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.2500000
	Damage=11
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTCYLOShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTCYLOShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-FireSG',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=150.0000000
	Chaos=0.5000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryEffectParams_Slug'
begin object name="TacticalSecondaryEffectParams_Slug" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.CYLOFirestormHEProjectile'
	SpawnOffset=(X=0.0000000,Y=20.0000000,Z=-20.0000000)
	Speed=8000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=80.0000000
	DamageRadius=192.0000000
	MomentumTransfer=50000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.CYLO.CYLO-FlameFire',Volume=1.3000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=200.0000000
	Chaos=0.5000000
	SplashDamage=true
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams_Slug'
begin object name="TacticalSecondaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	TargetState="HESlug"
	FireAnim="FireSG"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryEffectParams_Slug'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.0300000),(InVal=0.3500000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1600000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams_FS'
begin object name="TacticalRecoilParams_FS" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.0300000),(InVal=0.3500000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1650000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="UAW"
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	WeaponBoneScales[0]=(BoneName="ElecSight",Slot=54,Scale=0.0000000)
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	AllowedCamos[5]=5
	AllowedCamos[6]=6
	MagAmmo=22
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalParams_FS'
begin object name="TacticalParams_FS" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Firestorm"
	LayoutTags="inc,exp,heat,slug"
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.CYLOFirestorm_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.CYLO.CYLOFireStormPickupHi'
	AllowedCamos[0]=7
	AllowedCamos[1]=8
	AllowedCamos[2]=9
	AllowedCamos[3]=10
	AllowedCamos[4]=11
	AllowedCamos[5]=12
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalRecoilParams_FS'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalPrimaryFireParams_FS'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalSecondaryFireParams_Slug'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Standard'
begin object name="CYLO_Standard" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Best Value"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_CYLO'
begin object name="CYLO_CYLO" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="CYLO"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainRust",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Ork'
begin object name="CYLO_Ork" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Most Dakka"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainBlast",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_RealFakeWood'
begin object name="CYLO_RealFakeWood" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Real Fake Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewWood",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_NewRed'
begin object name="CYLO_NewRed" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ultracool"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewRed",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_NewPink'
begin object name="CYLO_NewPink" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Girlpower"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLO_Brass'
begin object name="CYLO_Brass" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold?"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOUAWCamos.CYLO-MainNewBrass",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Orange'
begin object name="CYLOFS_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	Index=7
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Red'
begin object name="CYLOFS_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainRed",Index=1,pIndex=0,AIndex=0)
	Index=8
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Blue'
begin object name="CYLOFS_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainBlue",Index=1,pIndex=0,AIndex=0)
	Index=9
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Yellow'
begin object name="CYLOFS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainYellow",Index=1,pIndex=0,AIndex=0)
	Index=10
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_OrangeFancy'
begin object name="CYLOFS_OrangeFancy" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Limited"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainStripes",Index=1,pIndex=0,AIndex=0)
	Index=11
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CYLOWeaponParamsTactical.CYLOFS_Gold'
begin object name="CYLOFS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CYLOFSCamos.CYLOFS-MainGold",Index=1,pIndex=0,AIndex=0)
	Index=12
end object
