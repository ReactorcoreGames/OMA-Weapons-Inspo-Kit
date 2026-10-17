class HMCBeamCannonParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Industrial Laser"
		LayoutDescription="High Power with searing laser"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=11
		SightingTime=0.3000000
		SightOffset=(X=10.0000000,Y=-15.0000000,Z=20.0000000)
		AllowedCamos[0]=0
		MagAmmo=500
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicParams_Cryon'
	begin object name="ClassicParams_Cryon" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Cryon Gravitron"
		LayoutDescription="Slowing Blast with tractor/repulsor beam"
		LayoutTags="grav"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=11
		SightingTime=0.3000000
		SightOffset=(X=0.0000000,Y=-20.0000000,Z=20.0000000)
		ViewOffset=(X=10.0000000,Y=15.0000000,Z=-15.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.HMCCryon_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.HMCCryon_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.HMC.HMCCryonPickup'
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		AllowedCamos[2]=3
		MagAmmo=500
		WeaponModes[0]=(ModeName="Beam: Tractor",bUnavailable=false,ModeID="WM_FullAuto",Value=0.2500000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Beam: Repulsor",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Healing Beam",bUnavailable=true,ModeID="",Value=0.3333330,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams_Gravitron'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Tractor'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Repulsor'
	end object
	Layouts[1]=ClassicParams_Cryon
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_Black'
	begin object name="HMC_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=HMC_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonWhite'
	begin object name="HMC_CryonWhite" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		Index=1
	end object
	Camos[1]=HMC_CryonWhite
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonBlack'
	begin object name="HMC_CryonBlack" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonRed",Index=1,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=HMC_CryonBlack
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonStripes'
	begin object name="HMC_CryonStripes" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="MLN Labs"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonStripes",Index=1,pIndex=-1,AIndex=-1)
		Index=3
	end object
	Camos[3]=HMC_CryonStripes
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.6000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.7000000
	YRandFactor=0.9000000
	MaxRecoil=1600.0000000
	DeclineTime=3.0000000
	ViewBindFactor=0.9500000
	CrouchMultiplier=0.3000000
end object
// Reference: AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1248)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.5000000
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.8500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.6500000
	JumpChaos=0.6000000
	FallingChaos=0.6000000
	SprintChaos=0.6000000
	AimDamageThreshold=150
	ChaosDeclineTime=2.5000000
	ChaosSpeedThreshold=800
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=50000.0000000,Max=50000.0000000)
	Damage=240
	HeadMult=1.2000000
	LimbMult=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DTHMCBlast'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBlastHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBlast'
	PenetrationEnergy=200.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	HookStopFactor=2.5000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.BeamCannon.HMC-Blast',Volume=2.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	PushbackForce=320.0000000
	Chaos=0.0050000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=25
	FireAnim="ChargeFireBig"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryEffectParams_Gravitron'
begin object name="ClassicPrimaryEffectParams_Gravitron" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=50000.0000000,Max=50000.0000000)
	Damage=150
	HeadMult=1.2000000
	LimbMult=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DTHMCBlast'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBlastHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBlast'
	PenetrateForce=400
	bPenetrate=true
	HookStopFactor=2.5000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Fire',Volume=1.7000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=400.0000000
	PushbackForce=180.0000000
	Chaos=0.0050000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams_Gravitron'
begin object name="ClassicPrimaryFireParams_Gravitron" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=25
	FireAnim="ChargeFireBig"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryEffectParams_Gravitron'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	RangeAtten=0.7500000
	Damage=15
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Heat=0.0100000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams_Tractor'
begin object name="ClassicSecondaryEffectParams_Tractor" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=8
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	HookStopFactor=0.3000000
	HookPullForce=240.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.8000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Heat=0.0200000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Tractor'
begin object name="ClassicSecondaryFireParams_Tractor" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	TargetState="RepulsorBeamMode"
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams_Tractor'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams_Repulsor'
begin object name="ClassicSecondaryEffectParams_Repulsor" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=8
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	HookStopFactor=0.3000000
	HookPullForce=-240.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.8000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Heat=0.0200000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Repulsor'
begin object name="ClassicSecondaryFireParams_Repulsor" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	TargetState="RepulsorBeamMode"
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryEffectParams_Repulsor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Industrial Laser"
	LayoutDescription="High Power with searing laser"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=11
	SightingTime=0.3000000
	SightOffset=(X=10.0000000,Y=-15.0000000,Z=20.0000000)
	AllowedCamos[0]=0
	MagAmmo=500
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicParams_Cryon'
begin object name="ClassicParams_Cryon" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Cryon Gravitron"
	LayoutDescription="Slowing Blast with tractor/repulsor beam"
	LayoutTags="grav"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=11
	SightingTime=0.3000000
	SightOffset=(X=0.0000000,Y=-20.0000000,Z=20.0000000)
	ViewOffset=(X=10.0000000,Y=15.0000000,Z=-15.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.HMCCryon_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.HMCCryon_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.HMC.HMCCryonPickup'
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	AllowedCamos[2]=3
	MagAmmo=500
	WeaponModes[0]=(ModeName="Beam: Tractor",bUnavailable=false,ModeID="WM_FullAuto",Value=0.2500000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Beam: Repulsor",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Healing Beam",bUnavailable=true,ModeID="",Value=0.3333330,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicPrimaryFireParams_Gravitron'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Tractor'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.ClassicSecondaryFireParams_Repulsor'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_Black'
begin object name="HMC_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonWhite'
begin object name="HMC_CryonWhite" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonBlack'
begin object name="HMC_CryonBlack" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonRed",Index=1,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsClassic.HMC_CryonStripes'
begin object name="HMC_CryonStripes" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MLN Labs"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonStripes",Index=1,pIndex=-1,AIndex=-1)
	Index=3
end object
