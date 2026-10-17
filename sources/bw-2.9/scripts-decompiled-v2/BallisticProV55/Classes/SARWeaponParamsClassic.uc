class SARWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Flash Bulb"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3200000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
		MagAmmo=40
		bNeedCock=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_CombatLaser'
	begin object name="ClassicParams_CombatLaser" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Combat Laser"
		LayoutTags="combat_laser"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3200000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
		MagAmmo=40
		bNeedCock=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
	end object
	Layouts[1]=ClassicParams_CombatLaser
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="3X Scope"
		LayoutTags="target_laser, lock_stock"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
		MaxZoom=4.0000000
		ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.1200000,AugmentOffset=(X=-220.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
		MagAmmo=40
		bNeedCock=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
	end object
	Layouts[2]=ClassicParams_Scope
	// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_Supp'
	begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressor"
		LayoutTags="target_laser"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3200000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=40
		bNeedCock=true
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
		FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
	end object
	Layouts[3]=ClassicParams_Supp
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Green'
	begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=SAR_Green
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Desert'
	begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SAR_Desert
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Gray'
	begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SAR_Gray
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Black'
	begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SAR_Black
	// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Ocean'
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
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=-0.0500000),(InVal=0.1500000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=3840.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
begin object name="ClassicBurstRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.1500000,OutVal=-0.0600000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0500000),(InVal=0.1000000,OutVal=-0.0500000),(InVal=0.1500000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.7000000
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=3840.0000000
	DeclineTime=0.7000000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.9000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1200
	ChaosTurnThreshold=170000
end object
// Reference: AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
begin object name="ClassicBurstAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=960
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
begin object name="ClassicPrimaryBurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstEffectParams'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
begin object name="ClassicSecondaryFireParams_LaserSight" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="LaserSight"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams_LaserSight'
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams_Supp'
begin object name="ClassicPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=25
	HeadMult=3.3000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0400000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstEffectParams'
begin object name="ClassicPrimaryBurstEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=25
	HeadMult=3.3000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Chaos=0.0300000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
begin object name="ClassicPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	RangeAtten=0.8000000
	Damage=25
	HeadMult=3.3000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTSARRifle'
	DamageTypeHead=Class'BallisticProV55.DTSARRifleHead'
	DamageTypeArm=Class'BallisticProV55.DTSARRifle'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50FireSil',Volume=1.2000000,Radius=192.0000000,Slot=0,Pitch=1.1000000,bAtten=true,bNoOverride=true)
	Recoil=96.0000000
	Chaos=0.0400000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=10.0000000
	AmmoPerFire=0
	MaxHoldTime=0.5000000
	TargetState="Flash"
	FireAnim="None"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams_LaserSight'
begin object name="ClassicSecondaryEffectParams_LaserSight" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams_CombatLaser'
begin object name="ClassicSecondaryEffectParams_CombatLaser" class=BCoreProV55.InstantEffectParams
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
// Reference: FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
begin object name="ClassicSecondaryFireParams_CombatLaser" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	AmmoPerFire=0
	TargetState="CombatLaser"
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryEffectParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Flash Bulb"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3200000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
	MagAmmo=40
	bNeedCock=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_CombatLaser'
begin object name="ClassicParams_CombatLaser" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Combat Laser"
	LayoutTags="combat_laser"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3200000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
	MagAmmo=40
	bNeedCock=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_CombatLaser'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="3X Scope"
	LayoutTags="target_laser, lock_stock"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BW_Core_WeaponTex.Attachment.SKAR-Scope'
	MaxZoom=4.0000000
	ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.1200000,AugmentOffset=(X=-220.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=0))
	MagAmmo=40
	bNeedCock=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryBurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
end object
// Reference: WeaponParams'BallisticProV55.SARWeaponParamsClassic.ClassicParams_Supp'
begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressor"
	LayoutTags="target_laser"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3200000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=12.0000000,Y=12.0000000,Z=-7.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.3000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=40
	bNeedCock=true
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	RecoilParams[0]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BallisticProV55.SARWeaponParamsClassic.ClassicBurstAimParams'
	FireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	FireParams[1]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.SARWeaponParamsClassic.ClassicSecondaryFireParams_LaserSight'
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Green'
begin object name="SAR_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Desert'
begin object name="SAR_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.AAS-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Gray'
begin object name="SAR_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.SAR15-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Black'
begin object name="SAR_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.DSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.SARWeaponParamsClassic.SAR_Ocean'
begin object name="SAR_Ocean" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SARCamos.CSARSkin-Shiny",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
