class E23WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.E23WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ZoomType=2
		WeaponName="E-23 'Viper' Particle Rifle"
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSeriesFireParams'
		FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticMultiFireParams'
		FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSniperFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticLaserFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsRealistic.VPR_Gray'
	begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Purple"
	end object
	Camos[0]=VPR_Gray
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsRealistic.VPR_UTC'
	begin object name="VPR_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.ViperCamos.UTCViperShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=VPR_UTC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSeriesEffectParams'
begin object name="RealisticSeriesEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Std'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=30000.0000000
	AccelSpeed=100000.0000000
	Damage=35.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=40.0000000
	Chaos=0.0600000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSeriesFireParams'
begin object name="RealisticSeriesFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSeriesEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticMultiEffectParams'
begin object name="RealisticMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_SG'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=60000.0000000
	Damage=20.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BallisticProV55.E23SGFlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SGFire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.1000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticMultiFireParams'
begin object name="RealisticMultiFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	TargetState="Shotgun"
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticMultiEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSniperEffectParams'
begin object name="RealisticSniperEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Snpr'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=50000.0000000
	AccelSpeed=100000.0000000
	Damage=70.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=1.4500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SRFire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.1000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSniperFireParams'
begin object name="RealisticSniperFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=3
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSniperEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticLaserEffectParams'
begin object name="RealisticLaserEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=3000.0000000)
	WaterTraceRange=2100.0000000
	RangeAtten=0.4000000
	Damage=16
	HeadMult=1.3000000
	LimbMult=0.7000000
	DamageType=Class'BallisticProV55.DTVPRLaser'
	DamageTypeHead=Class'BallisticProV55.DTVPRLaserHead'
	DamageTypeArm=Class'BallisticProV55.DTVPRLaser'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=4.0000000
	Chaos=0.0050000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticLaserFireParams'
begin object name="RealisticLaserFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireAnim="None"
	FireLoopAnim="'"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.E23WeaponParamsRealistic.RealisticLaserEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.E23WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.3000000
	YawFactor=0.3000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=1024.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.E23WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1648)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.3500000
	FallingChaos=0.3500000
	SprintChaos=0.3500000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=650
end object
// Reference: WeaponParams'BallisticProV55.E23WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ZoomType=2
	WeaponName="E-23 'Viper' Particle Rifle"
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSeriesFireParams'
	FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticMultiFireParams'
	FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticSniperFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsRealistic.RealisticLaserFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsRealistic.VPR_Gray'
begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Purple"
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsRealistic.VPR_UTC'
begin object name="VPR_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.ViperCamos.UTCViperShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
