class SARWeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Flash Bulb"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams_CombatLaser'
	begin object name="TacticalParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
	end object
	Layouts[1]=TacticalParams_CombatLaser
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams_Supp'
	begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressor"
		LayoutTags="target_laser"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams_Scope'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams_Scope'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireParams_Supp'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
	end object
	Layouts[2]=TacticalParams_Supp
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Green'
	begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=SAR_Green
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Desert'
	begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SAR_Desert
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Gray'
	begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SAR_Gray
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Black'
	begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SAR_Black
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Ocean'
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
// Reference: AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
begin object name="TacticalStockOutAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
begin object name="TacticalStockInAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInRecoilParams'
begin object name="TacticalStockInRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=-0.0300000),(InVal=0.4500000,OutVal=-0.0500000),(InVal=0.6000000,OutVal=0.0600000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2300000),(InVal=0.4000000,OutVal=0.3600000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams_Scope'
begin object name="TacticalStockOutRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=-0.0300000),(InVal=0.4500000,OutVal=-0.0500000),(InVal=0.6000000,OutVal=0.0600000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2300000),(InVal=0.4000000,OutVal=0.3600000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.1500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams'
begin object name="TacticalStockOutRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=-0.0300000),(InVal=0.4500000,OutVal=-0.0500000),(InVal=0.6000000,OutVal=0.0600000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2300000),(InVal=0.4000000,OutVal=0.3600000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireParams_Supp'
begin object name="TacticalFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireEffectParams_Supp'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstFireParams'
begin object name="TacticalBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstEffectParams'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoFireParams'
begin object name="TacticalAutoFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoEffectParams'
begin object name="TacticalAutoEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.FlashEmitter_AR'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0220000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstEffectParams'
begin object name="TacticalBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.FlashEmitter_AR'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireEffectParams_Supp'
begin object name="TacticalFireEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50FireSil',Volume=1.2000000,Radius=192.0000000,Slot=0,Pitch=1.1000000,bAtten=true,bNoOverride=true)
	Recoil=175.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="Flash"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams_LaserSight'
begin object name="TacticalSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
begin object name="TacticalSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams_LaserSight'
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams_CombatLaser'
begin object name="TacticalSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
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
// Reference: FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
begin object name="TacticalSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryEffectParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Flash Bulb"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams_CombatLaser'
begin object name="TacticalParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalAutoFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsTactical.TacticalParams_Supp'
begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressor"
	LayoutTags="target_laser"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams_Scope'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutRecoilParams_Scope'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockOutAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsTactical.TacticalStockInAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireParams_Supp'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Green'
begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Desert'
begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Gray'
begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Black'
begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsTactical.SAR_Ocean'
begin object name="SAR_Ocean" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.CSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
