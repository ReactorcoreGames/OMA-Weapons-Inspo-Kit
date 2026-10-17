class FM13WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicParams_Flame'
	begin object name="ClassicParams_Flame" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dragon's Breath"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams_Flame'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Flame
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="8 Gauge Shot"
		LayoutTags="8Gauge"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-5.0000000,Y=-0.1000000,Z=29.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
		ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
		MagAmmo=4
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams_Cluster'
	end object
	Layouts[1]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.2000000
	XRandFactor=0.2000000
	YRandFactor=0.5000000
	DeclineTime=1.4000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1760)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ViewBindFactor=0.2500000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=550
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryEffectParams_Flame'
begin object name="ClassicPrimaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_ShotgunFlame'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2072.0000000,Max=2072.0000000)
	RangeAtten=0.1500000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	MuzzleFlashClass=Class'BWBP_OP_Pro.FM13FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=900,Y=900)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams_Flame'
begin object name="ClassicPrimaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	TargetState="FireFromFireControl"
	FireAnim="FireCombined"
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryEffectParams_Flame'
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.4000000
	Damage=45
	LimbMult=0.5000000
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	PenetrationEnergy=32.0000000
	PenetrateForce=120
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-FireStrong',Volume=3.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=1000.0000000
	Chaos=1.0000000
	Inaccuracy=(X=900,Y=900)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.6500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryEffectParams_Cluster'
begin object name="ClassicSecondaryEffectParams_Cluster" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams_Cluster'
begin object name="ClassicSecondaryFireParams_Cluster" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryEffectParams_Cluster'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicParams_Flame'
begin object name="ClassicParams_Flame" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dragon's Breath"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams_Flame'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="8 Gauge Shot"
	LayoutTags="8Gauge"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-5.0000000,Y=-0.1000000,Z=29.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
	ViewOffset=(X=0.0000000,Y=13.0000000,Z=-23.0000000)
	MagAmmo=4
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsClassic.ClassicSecondaryFireParams_Cluster'
end object
