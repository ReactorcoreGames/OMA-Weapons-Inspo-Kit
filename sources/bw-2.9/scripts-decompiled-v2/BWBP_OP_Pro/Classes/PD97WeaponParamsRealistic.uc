class PD97WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		PlayerSpeedFactor=1.0500000
		PlayerJumpFactor=1.0500000
		InventorySize=4
		WeaponPrice=600
		SightMoveSpeedFactor=1.0000000
		SightingTime=0.2000000
		WeaponName="PD97 .410 Shotgun Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams_Rocket'
	begin object name="RealisticParams_Rocket" class=BCoreProV55.WeaponParams
		Weight=15
		LayoutName="Missile"
		PlayerSpeedFactor=1.0500000
		PlayerJumpFactor=1.0500000
		InventorySize=4
		WeaponPrice=600
		SightMoveSpeedFactor=1.0000000
		SightingTime=0.2000000
		WeaponName="PD97 Missile Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Rocket'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams_Tracker'
	end object
	Layouts[1]=RealisticParams_Rocket
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams_Dart'
	begin object name="RealisticParams_Dart" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Plague Dart"
		PlayerSpeedFactor=1.0500000
		PlayerJumpFactor=1.0500000
		InventorySize=4
		WeaponPrice=600
		SightMoveSpeedFactor=1.0000000
		SightingTime=0.2000000
		WeaponName="PD97 Dart Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Dart
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Gray'
	begin object name="PUG_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUG_Gray
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Red'
	begin object name="PUG_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Military Red"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainRed",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUG_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Blue'
	begin object name="PUG_Blue" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Police Blue"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUG_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Black'
	begin object name="PUG_Black" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Riot Police"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlack",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUG_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Gold'
	begin object name="PUG_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainGold",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUG_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=7.0000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.5000000
	YawFactor=0.2000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=3000.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.4000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1152)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=650
	ChaosTurnThreshold=196608
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=6
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DTPD97Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DTPD97ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTPD97Shotgun'
	PenetrationEnergy=4.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams_Dart'
begin object name="RealisticPrimaryEffectParams_Dart" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97Dart'
	SpawnOffset=(X=15.0000000,Y=15.0000000,Z=-20.0000000)
	Speed=15000.0000000
	Damage=30.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.1500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
begin object name="RealisticPrimaryFireParams_Dart" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="Projectile"
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams_Dart'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams_Rocket'
begin object name="RealisticPrimaryEffectParams_Rocket" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97Rocket'
	SpawnOffset=(X=15.0000000,Y=15.0000000,Z=-20.0000000)
	Speed=4500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=2000.0000000
	Damage=80.0000000
	DamageRadius=192.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.PD97.PD97-RocketFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.1500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Rocket'
begin object name="RealisticPrimaryFireParams_Rocket" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="Projectile"
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryEffectParams_Rocket'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2240.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=8000.0000000
	Damage=80.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryEffectParams_Tracker'
begin object name="RealisticSecondaryEffectParams_Tracker" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97TrackerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=8000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=8000.0000000
	Damage=25.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams_Tracker'
begin object name="RealisticSecondaryFireParams_Tracker" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Tracker"
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryEffectParams_Tracker'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	PlayerSpeedFactor=1.0500000
	PlayerJumpFactor=1.0500000
	InventorySize=4
	WeaponPrice=600
	SightMoveSpeedFactor=1.0000000
	SightingTime=0.2000000
	WeaponName="PD97 .410 Shotgun Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams_Rocket'
begin object name="RealisticParams_Rocket" class=BCoreProV55.WeaponParams
	Weight=15
	LayoutName="Missile"
	PlayerSpeedFactor=1.0500000
	PlayerJumpFactor=1.0500000
	InventorySize=4
	WeaponPrice=600
	SightMoveSpeedFactor=1.0000000
	SightingTime=0.2000000
	WeaponName="PD97 Missile Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Rocket'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams_Tracker'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticParams_Dart'
begin object name="RealisticParams_Dart" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Plague Dart"
	PlayerSpeedFactor=1.0500000
	PlayerJumpFactor=1.0500000
	InventorySize=4
	WeaponPrice=600
	SightMoveSpeedFactor=1.0000000
	SightingTime=0.2000000
	WeaponName="PD97 Dart Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticPrimaryFireParams_Dart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Gray'
begin object name="PUG_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Red'
begin object name="PUG_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Military Red"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainRed",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Blue'
begin object name="PUG_Blue" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Police Blue"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Black'
begin object name="PUG_Black" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Riot Police"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlack",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsRealistic.PUG_Gold'
begin object name="PUG_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
