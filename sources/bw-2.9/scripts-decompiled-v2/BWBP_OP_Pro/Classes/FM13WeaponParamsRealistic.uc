class FM13WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticParams_Flame'
	begin object name="RealisticParams_Flame" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dragon's Breath"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		WeaponName="FM-13 Dragon's Breath Shotgun"
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams_Flame
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="8 Gauge Shot"
		LayoutTags="8Gauge"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		WeaponName="FM-13 8 Guage Shotgun"
		MagAmmo=4
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams_Cluster'
	end object
	Layouts[1]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.4000000
	YRandFactor=0.2000000
	MaxRecoil=2492.0000000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.7000000
	ADSViewBindFactor=0.7000000
	CrouchMultiplier=0.8750000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=740,Max=1480)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8750000
	ADSMultiplier=0.8750000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=600
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryEffectParams_Flame'
begin object name="RealisticPrimaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_ShotgunFlame'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2572.0000000,Max=2572.0000000)
	RangeAtten=0.1500000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	MuzzleFlashClass=Class'BWBP_OP_Pro.FM13FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=450,Y=450)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
begin object name="RealisticPrimaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="FireFromFireControl"
	FireAnim="FireCombined"
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryEffectParams_Flame'
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=3500.0000000,Max=3500.0000000)
	WaterTraceRange=5000.0000000
	DecayRange=(Min=1500.0000000,Max=3500.0000000)
	Damage=25
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-FireStrong',Volume=3.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2492.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=800,Y=800)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.6500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FM13Grenade'
	Speed=3500.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryEffectParams_Cluster'
begin object name="RealisticSecondaryEffectParams_Cluster" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FM13FlakGrenade'
	Speed=3500.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams_Cluster'
begin object name="RealisticSecondaryFireParams_Cluster" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryEffectParams_Cluster'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticParams_Flame'
begin object name="RealisticParams_Flame" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dragon's Breath"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	WeaponName="FM-13 Dragon's Breath Shotgun"
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="8 Gauge Shot"
	LayoutTags="8Gauge"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	WeaponName="FM-13 8 Guage Shotgun"
	MagAmmo=4
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsRealistic.RealisticSecondaryFireParams_Cluster'
end object
