class SARWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Flash Bulb"
		WeaponPrice=1500
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
		WeaponName="AC-12F 5.56mm Assault Carbine"
		MagAmmo=35
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_CombatLaser'
	begin object name="RealisticParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		WeaponPrice=1500
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
		WeaponName="AC-12L 5.56mm Assault Carbine"
		MagAmmo=35
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
	end object
	Layouts[1]=RealisticParams_CombatLaser
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		LayoutTags="target_laser, lock_stock"
		WeaponPrice=1500
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=11.0000000,Y=-0.0100000,Z=3.6000000)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=3.0000000
		WeaponName="AC-12 5.56mm Assault Carbine (3X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.1200000,AugmentOffset=(X=-220.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
		MagAmmo=35
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams_Scope'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
	end object
	Layouts[2]=RealisticParams_Scope
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressor"
		LayoutTags="target_laser"
		WeaponPrice=1500
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
		WeaponName="AC-12 5.56mm Assault Carbine (3X)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=35
		bMagPlusOne=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
	end object
	Layouts[3]=RealisticParams_Supp
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Green'
	begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=SAR_Green
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Desert'
	begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SAR_Desert
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Gray'
	begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SAR_Gray
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Black'
	begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SAR_Black
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Ocean'
	begin object name="SAR_Ocean" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.CSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SAR_Ocean
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0600000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=565
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
begin object name="RealisticBurstRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	XCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1000000
	XRandFactor=0.1250000
	YRandFactor=0.1250000
	MaxRecoil=3000.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1250000
	ViewBindFactor=0.0600000
	ADSViewBindFactor=0.0600000
	CrouchMultiplier=0.7000000
	bViewDecline=true
	bUseAltSightCurve=true
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
begin object name="RealisticPrimaryBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams_Scope'
begin object name="RealisticBurstRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	XCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurveAlt=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1000000
	XRandFactor=0.1250000
	YRandFactor=0.1250000
	MaxRecoil=3000.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1250000
	ViewBindFactor=0.0600000
	CrouchMultiplier=0.7000000
	bViewDecline=true
	bUseAltSightCurve=true
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1500000
	XRandFactor=0.1650000
	YRandFactor=0.1650000
	MaxRecoil=3000.0000000
	DeclineTime=0.7500000
	DeclineDelay=0.1750000
	ViewBindFactor=0.0600000
	ADSViewBindFactor=0.0600000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
begin object name="RealisticSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.0500000
	Damage=43
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=775.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
begin object name="RealisticPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.0500000
	Damage=43
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=825.0000000
	Chaos=0.0500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.0500000
	Damage=43
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=50
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50FireSil',Volume=1.2000000,Radius=192.0000000,Slot=0,Pitch=1.1000000,bAtten=true,bNoOverride=true)
	Recoil=775.0000000
	Chaos=0.0700000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=7.0000000
	AmmoPerFire=0
	TargetState="Flash"
	BurstFireRateFactor=1.0000000
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams_LaserSight'
begin object name="RealisticSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams_CombatLaser'
begin object name="RealisticSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500.0000000,Max=6000.0000000)
	WaterTraceRange=4200.0000000
	RangeAtten=0.1000000
	Damage=8
	HeadMult=2.5000000
	LimbMult=0.3750000
	DamageType=Class'BallisticProV55.DTSARLaser'
	DamageTypeHead=Class'BallisticProV55.DTSARLaserHead'
	DamageTypeArm=Class'BallisticProV55.DTSARLaser'
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
// Reference: FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
begin object name="RealisticSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryEffectParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Flash Bulb"
	WeaponPrice=1500
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
	WeaponName="AC-12F 5.56mm Assault Carbine"
	MagAmmo=35
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_CombatLaser'
begin object name="RealisticParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	WeaponPrice=1500
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
	WeaponName="AC-12L 5.56mm Assault Carbine"
	MagAmmo=35
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	LayoutTags="target_laser, lock_stock"
	WeaponPrice=1500
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=11.0000000,Y=-0.0100000,Z=3.6000000)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=3.0000000
	WeaponName="AC-12 5.56mm Assault Carbine (3X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.1200000,AugmentOffset=(X=-220.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
	MagAmmo=35
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams_Scope'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressor"
	LayoutTags="target_laser"
	WeaponPrice=1500
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=0.0000000,Y=-0.0100000,Z=-1.0000000)
	WeaponName="AC-12 5.56mm Assault Carbine (3X)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=35
	bMagPlusOne=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsRealistic.RealisticSecondaryFireParams_LaserSight'
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Green'
begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Desert'
begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Gray'
begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Black'
begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsRealistic.SAR_Ocean'
begin object name="SAR_Ocean" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.CSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
