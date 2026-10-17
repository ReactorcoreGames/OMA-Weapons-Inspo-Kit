class AM67WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=7
		LayoutName="Flash Bulb"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
		MagAmmo=14
		bNeedCock=true
		bDualMixing=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="RDS + Lasersight"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
		ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
		MagAmmo=14
		bNeedCock=true
		bDualMixing=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
		bNoaltfire=true
	end object
	Layouts[1]=ClassicParams_RDS
	// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams_CombatLaser'
	begin object name="ClassicParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
		WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
		ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
		MagAmmo=14
		bNeedCock=true
		bDualMixing=true
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
	end object
	Layouts[2]=ClassicParams_CombatLaser
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Green'
	begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=AM67_Green
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Gray'
	begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Pounder"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=AM67_Gray
	// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Silver'
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
// Reference: FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=2048)
	AimAdjustTime=0.4500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1400
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2500.0000000
	RangeAtten=0.3500000
	Damage=55
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTAM67Pistol'
	DamageTypeHead=Class'BallisticProV55.DTAM67PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTAM67Pistol'
	PenetrationEnergy=24.0000000
	PenetrateForce=200
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.3000000
	Inaccuracy=(X=4,Y=4)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=4.0000000
	AmmoPerFire=0
	TargetState="Flash"
	BurstFireRateFactor=1.0000000
	FireAnim="SecFire"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams_CombatLaser'
begin object name="ClassicSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
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
// Reference: FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
begin object name="ClassicSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams_CombatLaser'
end object
// Reference: FireEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams_LaserSight'
begin object name="ClassicSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
begin object name="ClassicSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryEffectParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=7
	LayoutName="Flash Bulb"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
	MagAmmo=14
	bNeedCock=true
	bDualMixing=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="RDS + Lasersight"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=4.4300000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=1.0000000)
	ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
	MagAmmo=14
	bNeedCock=true
	bDualMixing=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
	bNoaltfire=true
end object
// Reference: WeaponParams'BallisticProV55.AM67WeaponParamsClassic.ClassicParams_CombatLaser'
begin object name="ClassicParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-24.0000000,Y=0.0600000,Z=2.5000000)
	WeaponBoneScales[0]=(BoneName="Sight",Slot=12,Scale=0.0000000)
	ViewOffset=(X=16.0000000,Y=9.0000000,Z=-5.5000000)
	MagAmmo=14
	bNeedCock=true
	bDualMixing=true
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.AM67WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.AM67WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.AM67WeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Green'
begin object name="AM67_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Gray'
begin object name="AM67_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Pounder"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AM67.AH104-MainMk2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.AM67WeaponParamsClassic.AM67_Silver'
begin object name="AM67_Silver" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Special Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AM67Camos.AH999-Main",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
