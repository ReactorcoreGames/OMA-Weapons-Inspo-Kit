class AM67WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=7
		LayoutName="Flash Bulb"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=9
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_Flash'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams_RDS'
	begin object name="TacticalParams_RDS" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="RDS + Lasersight"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=9
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
		bNoaltfire=true
	end object
	Layouts[1]=TacticalParams_RDS
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams_CombatLaser'
	begin object name="TacticalParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=9
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
	end object
	Layouts[2]=TacticalParams_CombatLaser
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Green'
	begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=AM67_Green
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Gray'
	begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Pounder"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=AM67_Gray
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Silver'
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
// Reference: FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
begin object name="TacticalPriFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2700000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.0600000),(InVal=0.3000000,OutVal=-0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=0.0600000),(InVal=0.7000000,OutVal=0.0100000),(InVal=0.8000000,OutVal=-0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0800000
	DeclineTime=0.7500000
	DeclineDelay=0.4500000
	EscapeMultiplier=1.3500000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.2000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriEffectParams'
begin object name="TacticalPriEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.5000000
	Damage=60
	HeadMult=3.0000000
	DamageType=Class'BallisticProV55.DTAM67Pistol'
	DamageTypeHead=Class'BallisticProV55.DTAM67PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.2000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_Flash'
begin object name="TacticalSecondaryEffectParams_Flash" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=1.0000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_Flash'
begin object name="TacticalSecondaryFireParams_Flash" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	FireAnim="Idle"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_Flash'
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_CombatLaser'
begin object name="TacticalSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
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
// Reference: FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
begin object name="TacticalSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_CombatLaser'
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_LaserSight'
begin object name="TacticalSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
begin object name="TacticalSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryEffectParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=7
	LayoutName="Flash Bulb"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=9
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_Flash'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams_RDS'
begin object name="TacticalParams_RDS" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="RDS + Lasersight"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=9
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_LaserSight'
	bNoaltfire=true
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsTactical.TacticalParams_CombatLaser'
begin object name="TacticalParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=9
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalPriFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsTactical.TacticalSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Green'
begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Gray'
begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Pounder"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsTactical.AM67_Silver'
begin object name="AM67_Silver" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Special Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AH999-Main",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
