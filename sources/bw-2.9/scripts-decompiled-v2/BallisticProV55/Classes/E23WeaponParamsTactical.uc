class E23WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.E23WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=4.0000000
		ZoomStages=1
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSeriesFireParams'
		FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalMultiFireParams'
		FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSniperFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalLaserFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsTactical.VPR_Gray'
	begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Purple"
	end object
	Camos[0]=VPR_Gray
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsTactical.VPR_UTC'
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
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalSeriesEffectParams'
begin object name="TacticalSeriesEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Std'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=52.0000000
	DamageRadius=16.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Chaos=0.0600000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalMultiEffectParams'
begin object name="TacticalMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_SG'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=5500.0000000
	AccelSpeed=60000.0000000
	Damage=52.0000000
	DamageRadius=64.0000000
	HeadMult=1.7500000
	LimbMult=0.8500000
	MaxDamageGainFactor=0.2500000
	DamageGainEndTime=0.3000000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SGFire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalSniperEffectParams'
begin object name="TacticalSniperEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Snpr'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=50000.0000000
	AccelSpeed=100000.0000000
	Damage=52.0000000
	DamageRadius=64.0000000
	HeadMult=1.7500000
	MaxDamageGainFactor=0.5000000
	DamageGainEndTime=0.3500000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SRFire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.3500000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSeriesFireParams'
begin object name="TacticalSeriesFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	AmmoPerFire=5
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalSeriesEffectParams'
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalMultiFireParams'
begin object name="TacticalMultiFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=5
	TargetState="Shotgun"
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalMultiEffectParams'
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSniperFireParams'
begin object name="TacticalSniperFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=25
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalSniperEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalLaserEffectParams'
begin object name="TacticalLaserEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=18
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DTVPRLaser'
	DamageTypeHead=Class'BallisticProV55.DTVPRLaserHead'
	DamageTypeArm=Class'BallisticProV55.DTVPRLaser'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalLaserFireParams'
begin object name="TacticalLaserFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireAnim="None"
	FireLoopAnim="'"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.E23WeaponParamsTactical.TacticalLaserEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.E23WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=-0.0100000),(InVal=0.3500000,OutVal=-0.0300000),(InVal=0.6000000,OutVal=0.0100000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.3800000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.7000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1900000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.E23WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.E23WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=4.0000000
	ZoomStages=1
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSeriesFireParams'
	FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalMultiFireParams'
	FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalSniperFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsTactical.TacticalLaserFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsTactical.VPR_Gray'
begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Purple"
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsTactical.VPR_UTC'
begin object name="VPR_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.ViperCamos.UTCViperShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
