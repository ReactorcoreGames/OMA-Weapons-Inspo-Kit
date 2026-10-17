class GRS9WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Combat Laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		WeaponPrice=1400
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
		WeaponName="GRS9-L2 9mm Handgun"
		MagAmmo=19
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Flash'
	begin object name="RealisticParams_Flash" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Flash Bulb"
		LayoutTags="no_combat_laser,flash"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
		WeaponName="GRS9-L2 9mm Handgun"
		MagAmmo=19
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
	end object
	Layouts[1]=RealisticParams_Flash
	// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Auto'
	begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Automatic"
		LayoutTags="no_combat_laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1100000
		SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
		WeaponBoneScales[0]=(BoneName="Laser",Slot=4,Scale=0.0000000)
		WeaponName="GRS9-L3 9mm Handgun"
		MagAmmo=19
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[2]=RealisticParams_Auto
	// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="RDS + Laser"
		LayoutTags="no_combat_laser,target_laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=-20.0000000,Y=-1.8500000,Z=28.6500000)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
		RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
		WeaponBoneScales[0]=(BoneName="Laser",Slot=4,Scale=0.1000000)
		WeaponName="GRS9-L2 9mm Handgun"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.1800000,AugmentOffset=(X=-15.0000000,Y=-0.6000000,Z=8.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="Muzzle",Scale=0.2500000,AugmentOffset=(X=-20.0000000,Y=-3.0000000,Z=-20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=19
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
	end object
	Layouts[3]=RealisticParams_RDS
	// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Tazer'
	begin object name="RealisticParams_Tazer" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Tazer"
		LayoutTags="no_combat_laser,target_laser,tacknife"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1200000
		SightOffset=(X=0.0000000,Y=-0.3000000,Z=3.5000000)
		WeaponBoneScales[0]=(BoneName="LAM",Slot=4,Scale=0.0000000)
		WeaponName="GRS9-L2 9mm Handgun"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.GRS9Melee_FPm'
		MagAmmo=19
		bMagPlusOne=true
		bDualBlocked=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
	end object
	Layouts[4]=RealisticParams_Tazer
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Black'
	begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=Glock_Black
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Brown'
	begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Brown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Glock_Brown
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Green'
	begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Glock_Green
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Silver'
	begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Glock_Silver
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_UTC'
	begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Glock_UTC
	// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Gold'
	begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=Glock_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
begin object name="RealisticPrimaryBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
end object
// Reference: AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=800
end object
// Reference: RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
begin object name="RealisticBurstRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.1000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=2048.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6000000
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=2048.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1200000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=5000.0000000)
	WaterTraceRange=800.0000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTGRS9Pistol'
	DamageTypeHead=Class'BallisticProV55.DTGRS9PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Pistol'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
begin object name="RealisticPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=5000.0000000)
	WaterTraceRange=800.0000000
	Damage=33
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTGRS9Pistol'
	DamageTypeHead=Class'BallisticProV55.DTGRS9PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Pistol'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=8
	DamageType=Class'BallisticProV55.DTGRS9Laser'
	DamageTypeHead=Class'BallisticProV55.DTGRS9LaserHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Laser'
	PenetrateForce=200
	bPenetrate=true
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=0
	TargetState="CombatLaser"
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_Flash'
begin object name="RealisticSecondaryEffectParams_Flash" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
begin object name="RealisticSecondaryFireParams_Flash" class=BCoreProV55.FireParams
	FireInterval=4.0000000
	AmmoPerFire=0
	TargetState="Flash"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_Flash'
end object
// Reference: FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
begin object name="RealisticSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
begin object name="RealisticSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
end object
// Reference: InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_TacKnife'
begin object name="RealisticSecondaryEffectParams_TacKnife" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=50
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTGRS9Tazer'
	DamageTypeHead=Class'BallisticProV55.DTGRS9Tazer'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Tazer'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
begin object name="RealisticSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_TacKnife'
end object
// Reference: FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Combat Laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	WeaponPrice=1400
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
	WeaponName="GRS9-L2 9mm Handgun"
	MagAmmo=19
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Flash'
begin object name="RealisticParams_Flash" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Flash Bulb"
	LayoutTags="no_combat_laser,flash"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
	WeaponName="GRS9-L2 9mm Handgun"
	MagAmmo=19
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
end object
// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Auto'
begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Automatic"
	LayoutTags="no_combat_laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1100000
	SightOffset=(X=-20.0000000,Y=-1.8500000,Z=26.7000000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
	WeaponBoneScales[0]=(BoneName="Laser",Slot=4,Scale=0.0000000)
	WeaponName="GRS9-L3 9mm Handgun"
	MagAmmo=19
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="RDS + Laser"
	LayoutTags="no_combat_laser,target_laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=-20.0000000,Y=-1.8500000,Z=28.6500000)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-3000,Roll=0)
	RootAdjust=(Pitch=3000,Yaw=-300,Roll=0)
	WeaponBoneScales[0]=(BoneName="Laser",Slot=4,Scale=0.1000000)
	WeaponName="GRS9-L2 9mm Handgun"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.1800000,AugmentOffset=(X=-15.0000000,Y=-0.6000000,Z=8.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="Muzzle",Scale=0.2500000,AugmentOffset=(X=-20.0000000,Y=-3.0000000,Z=-20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=19
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticParams_Tazer'
begin object name="RealisticParams_Tazer" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Tazer"
	LayoutTags="no_combat_laser,target_laser,tacknife"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1200000
	SightOffset=(X=0.0000000,Y=-0.3000000,Z=3.5000000)
	WeaponBoneScales[0]=(BoneName="LAM",Slot=4,Scale=0.0000000)
	WeaponName="GRS9-L2 9mm Handgun"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.GRS9Melee_FPm'
	MagAmmo=19
	bMagPlusOne=true
	bDualBlocked=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.GRS9WeaponParamsRealistic.RealisticSecondaryFireParams_TacKnife'
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Black'
begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Brown'
begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Brown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Green'
begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Silver'
begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_UTC'
begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.GRS9WeaponParamsRealistic.Glock_Gold'
begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
