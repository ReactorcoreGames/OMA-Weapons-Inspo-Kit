class FM13WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalParams_Flame'
	begin object name="TacticalParams_Flame" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dragon's Breath"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		WeaponName="FM-13 Dragon's Breath Shotgun"
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams_Flame'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams_Flame
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="8 Gauge Shot"
		LayoutTags="8Gauge"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		WeaponName="FM-13 Heavy Shotgun"
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams_Cluster'
	end object
	Layouts[1]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.4000000
	YRandFactor=0.2000000
	MaxRecoil=1892.0000000
	ClimbTime=0.0750000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryEffectParams_Flame'
begin object name="TacticalPrimaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
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
	Chaos=1.0000000
	Inaccuracy=(X=450,Y=450)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams_Flame'
begin object name="TacticalPrimaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="FireFromFireControl"
	FireAnim="FireCombined"
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryEffectParams_Flame'
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=14
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1500.0000000,Max=3750.0000000)
	RangeAtten=0.2000000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-FireStrong',Volume=3.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1836.0000000
	PushbackForce=1200.0000000
	Chaos=0.4000000
	Inaccuracy=(X=512,Y=512)
	SpreadMode=1
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.6500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryEffectParams_Cluster'
begin object name="TacticalSecondaryEffectParams_Cluster" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams_Cluster'
begin object name="TacticalSecondaryFireParams_Cluster" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryEffectParams_Cluster'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalParams_Flame'
begin object name="TacticalParams_Flame" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dragon's Breath"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	WeaponName="FM-13 Dragon's Breath Shotgun"
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams_Flame'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="8 Gauge Shot"
	LayoutTags="8Gauge"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	WeaponName="FM-13 Heavy Shotgun"
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsTactical.TacticalSecondaryFireParams_Cluster'
end object
