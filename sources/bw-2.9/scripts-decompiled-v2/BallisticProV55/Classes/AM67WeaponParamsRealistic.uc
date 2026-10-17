class AM67WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=7
		LayoutName="Flash Bulb"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		WeaponName="AM67 .50 Assault Pistol"
		MagAmmo=9
		bMagPlusOne=true
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="RDS + Lasersight"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
		WeaponName="AM67 .50 Assault Pistol (RDS)"
		MagAmmo=9
		bMagPlusOne=true
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
		bNoaltfire=true
	end object
	Layouts[1]=RealisticParams_RDS
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams_CombatLaser'
	begin object name="RealisticParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		WeaponName="AM67 .50 Assault Pistol (RDS)"
		MagAmmo=9
		bMagPlusOne=true
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
	end object
	Layouts[2]=RealisticParams_CombatLaser
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Green'
	begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=AM67_Green
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Gray'
	begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Pounder"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=AM67_Gray
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Silver'
	begin object name="AM67_Silver" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Special Edition"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AH999-Main",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=AM67_Silver
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.7500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=7.0000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.6000000
	YawFactor=0.1000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=3072.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1750000
	ViewBindFactor=0.4000000
	ADSViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1152)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=650
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1000.0000000,Max=5000.0000000)
	Damage=70
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTAM67Pistol'
	DamageTypeHead=Class'BallisticProV55.DTAM67PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Pistol'
	PenetrationEnergy=12.0000000
	PenetrateForce=40
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Fire',Volume=1.4000000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.0900000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_Flash'
begin object name="RealisticSecondaryEffectParams_Flash" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
begin object name="RealisticSecondaryFireParams_Flash" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="Flash"
	FireAnim="Idle"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_Flash'
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_CombatLaser'
begin object name="RealisticSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500.0000000,Max=6000.0000000)
	WaterTraceRange=4200.0000000
	RangeAtten=0.1000000
	Damage=8
	HeadMult=2.5000000
	LimbMult=0.3750000
	DamageType=Class'BallisticProV55.DTAM67Laser'
	DamageTypeHead=Class'BallisticProV55.DTAM67LaserHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Laser'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.GRS9LaserFlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-LaserFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
begin object name="RealisticSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_CombatLaser'
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
begin object name="RealisticSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
begin object name="RealisticSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=7
	LayoutName="Flash Bulb"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	WeaponName="AM67 .50 Assault Pistol"
	MagAmmo=9
	bMagPlusOne=true
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_Flash'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="RDS + Lasersight"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
	WeaponName="AM67 .50 Assault Pistol (RDS)"
	MagAmmo=9
	bMagPlusOne=true
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
	bNoaltfire=true
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticParams_CombatLaser'
begin object name="RealisticParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	WeaponName="AM67 .50 Assault Pistol (RDS)"
	MagAmmo=9
	bMagPlusOne=true
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Green'
begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Gray'
begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Pounder"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsRealistic.AM67_Silver'
begin object name="AM67_Silver" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Special Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AH999-Main",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
