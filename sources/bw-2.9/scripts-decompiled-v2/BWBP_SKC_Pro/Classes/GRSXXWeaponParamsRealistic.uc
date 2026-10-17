class GRSXXWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Hyper Amp"
		LayoutTags="no_starting_amp,no_combat_laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		WeaponName="GRS-XX 9mm Golden Pistol"
		MagAmmo=33
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Amp: Hypermode",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryAmpFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticParams_Laser'
	begin object name="RealisticParams_Laser" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Superlaser"
		LayoutTags="no_amp"
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		WeaponName="GRS-XX 9mm Golden Pistol"
		MagAmmo=33
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticBurstRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Laser
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Gold'
	begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
		Weight=60
		CamoName="Gold"
	end object
	Camos[0]=Glock_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Black'
	begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Glock_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Brown'
	begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Brown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Glock_Brown
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Green'
	begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Glock_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Silver'
	begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Glock_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_UTC'
	begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=Glock_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Butter'
	begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Butter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=Glock_Butter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
begin object name="RealisticSecondaryFireParams_Amp" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="AmpAttach"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryEffectParams_Amp'
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
begin object name="RealisticPrimaryBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticRecoilParams'
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
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticBurstRecoilParams'
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
// Reference: AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=800
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=5000.0000000)
	WaterTraceRange=800.0000000
	Damage=33
	HeadMult=2.1818180
	LimbMult=0.6060600
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstEffectParams'
begin object name="RealisticPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=5000.0000000)
	WaterTraceRange=800.0000000
	Damage=33
	HeadMult=2.1818180
	LimbMult=0.6060600
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=6.0000000
	PenetrateForce=16
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.T9CN.T9CN-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.0700000
	Inaccuracy=(X=13,Y=13)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryAmpEffectParams'
begin object name="RealisticPrimaryAmpEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=5000.0000000)
	WaterTraceRange=800.0000000
	Damage=55
	HeadMult=2.1818180
	LimbMult=0.6060600
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=12.0000000
	PenetrateForce=32
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.0700000
	Inaccuracy=(X=10,Y=10)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryAmpFireParams'
begin object name="RealisticPrimaryAmpFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryAmpEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3500.0000000
	RangeAtten=0.3500000
	Damage=35
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXLaserHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryEffectParams_Amp'
begin object name="RealisticSecondaryEffectParams_Amp" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Hyper Amp"
	LayoutTags="no_starting_amp,no_combat_laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	WeaponName="GRS-XX 9mm Golden Pistol"
	MagAmmo=33
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Amp: Hypermode",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryAmpFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams_Amp'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticParams_Laser'
begin object name="RealisticParams_Laser" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Superlaser"
	LayoutTags="no_amp"
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	WeaponName="GRS-XX 9mm Golden Pistol"
	MagAmmo=33
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticBurstRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Gold'
begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
	Weight=60
	CamoName="Gold"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Black'
begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Brown'
begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Brown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Green'
begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Silver'
begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_UTC'
begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsRealistic.Glock_Butter'
begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Butter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
