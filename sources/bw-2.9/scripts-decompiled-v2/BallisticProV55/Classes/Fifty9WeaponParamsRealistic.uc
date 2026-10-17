class Fifty9WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Bladed"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1650000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponName="Fifty-9 9mm SMG"
		MagAmmo=36
		bDualBlocked=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams_Burst'
	begin object name="RealisticParams_Burst" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Burst"
		LayoutTags="laser,lock,open"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1650000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
		WeaponName="Fifty-9 9mm SMG"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=36
		bDualBlocked=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Burst'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Burst
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="lock"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1700000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
		WeaponName="Fifty-9 9mm SMG"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		MagAmmo=36
		bDualBlocked=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Supp
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Blue'
	begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=Fifty_Blue
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Red'
	begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Fifty_Red
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Orange'
	begin object name="Fifty_Orange" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.TigerUziSkin",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Fifty_Orange
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3500000,OutVal=0.2250000),(InVal=0.6000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.2000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2560.0000000
	ClimbTime=0.0300000
	DeclineTime=0.6000000
	DeclineDelay=0.1250000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=650
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=7.0000000
	PenetrateForce=20
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.9500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=24,Y=24)
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Burst'
begin object name="RealisticPrimaryFireParams_Burst" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	WaterTraceRange=800.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=7.0000000
	PenetrateForce=20
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-FireSil',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=550.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=24,Y=24)
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=80.0000000,Max=80.0000000)
	WaterTraceRange=5000.0000000
	Damage=57
	HeadMult=2.1929820
	LimbMult=0.4561400
	DamageType=Class'BallisticProV55.DTFifty9Blade'
	DamageTypeHead=Class'BallisticProV55.DTFifty9BladeHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9Blade'
	HookStopFactor=1.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.7500000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Bladed"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1650000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponName="Fifty-9 9mm SMG"
	MagAmmo=36
	bDualBlocked=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams_Burst'
begin object name="RealisticParams_Burst" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Burst"
	LayoutTags="laser,lock,open"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1650000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
	WeaponName="Fifty-9 9mm SMG"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=36
	bDualBlocked=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Burst'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="lock"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1700000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
	WeaponName="Fifty-9 9mm SMG"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	MagAmmo=36
	bDualBlocked=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Blue'
begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Red'
begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsRealistic.Fifty_Orange'
begin object name="Fifty_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.TigerUziSkin",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
