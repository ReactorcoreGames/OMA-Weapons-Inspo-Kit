class HMCBeamCannonParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Industrial Laser"
		LayoutDescription="High Power with searing laser"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=8
		SightingTime=0.3000000
		SightOffset=(X=-10.0000000,Y=0.0000000,Z=30.5000000)
		SightPivot=(Pitch=748,Yaw=0,Roll=0)
		AllowedCamos[0]=0
		MagAmmo=500
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaParams_Cryon'
	begin object name="ArenaParams_Cryon" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Cryon Gravitron"
		LayoutDescription="Slowing Blast with tractor/repulsor beam"
		LayoutTags="grav"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=8
		SightingTime=0.3000000
		SightOffset=(X=-20.0000000,Y=0.0000000,Z=40.0000000)
		SightPivot=(Pitch=4096,Yaw=0,Roll=0)
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
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams_Gravitron'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Tractor'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Repulsor'
	end object
	Layouts[1]=ArenaParams_Cryon
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_Black'
	begin object name="HMC_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=HMC_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonWhite'
	begin object name="HMC_CryonWhite" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		Index=1
	end object
	Camos[1]=HMC_CryonWhite
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonBlack'
	begin object name="HMC_CryonBlack" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonRed",Index=1,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=HMC_CryonBlack
	// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonStripes'
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
// Reference: RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	ViewBindFactor=0.0000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=50000.0000000,Max=50000.0000000)
	Damage=245
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
	Chaos=0.0050000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=50
	FireAnim="ChargeFireBig"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryEffectParams_Gravitron'
begin object name="ArenaPrimaryEffectParams_Gravitron" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=50000.0000000,Max=50000.0000000)
	Damage=145
	DamageType=Class'BWBP_SKC_Pro.DTHMCBlast'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBlastHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBlast'
	PenetrateForce=400
	bPenetrate=true
	HookStopFactor=2.5000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Fire',Volume=1.7000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0050000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams_Gravitron'
begin object name="ArenaPrimaryFireParams_Gravitron" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=40
	FireAnim="ChargeFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryEffectParams_Gravitron'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=10
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Heat=0.0300000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams_Tractor'
begin object name="ArenaSecondaryEffectParams_Tractor" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=6
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	HookStopFactor=0.3000000
	HookPullForce=240.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Heat=0.0200000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Tractor'
begin object name="ArenaSecondaryFireParams_Tractor" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	TargetState="RepulsorBeamMode"
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams_Tractor'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams_Repulsor'
begin object name="ArenaSecondaryEffectParams_Repulsor" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	RangeAtten=0.7500000
	Damage=6
	DamageType=Class'BWBP_SKC_Pro.DTHMCBeam'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBeamHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBeam'
	PenetrateForce=200
	bPenetrate=true
	HookStopFactor=0.3000000
	HookPullForce=-240.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Heat=0.0200000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Repulsor'
begin object name="ArenaSecondaryFireParams_Repulsor" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	TargetState="RepulsorBeamMode"
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryEffectParams_Repulsor'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Industrial Laser"
	LayoutDescription="High Power with searing laser"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=8
	SightingTime=0.3000000
	SightOffset=(X=-10.0000000,Y=0.0000000,Z=30.5000000)
	SightPivot=(Pitch=748,Yaw=0,Roll=0)
	AllowedCamos[0]=0
	MagAmmo=500
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaParams_Cryon'
begin object name="ArenaParams_Cryon" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Cryon Gravitron"
	LayoutDescription="Slowing Blast with tractor/repulsor beam"
	LayoutTags="grav"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=8
	SightingTime=0.3000000
	SightOffset=(X=-20.0000000,Y=0.0000000,Z=40.0000000)
	SightPivot=(Pitch=4096,Yaw=0,Roll=0)
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
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaPrimaryFireParams_Gravitron'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Tractor'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.HMCBeamCannonParamsArena.ArenaSecondaryFireParams_Repulsor'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_Black'
begin object name="HMC_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonWhite'
begin object name="HMC_CryonWhite" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonBlack'
begin object name="HMC_CryonBlack" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonRed",Index=1,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HMCBeamCannonParamsArena.HMC_CryonStripes'
begin object name="HMC_CryonStripes" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MLN Labs"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HMCCamos.HMC-CryonStripes",Index=1,pIndex=-1,AIndex=-1)
	Index=3
end object
