class E23WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.E23WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		ZoomType=2
		ScopeScale=0.7000000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSeriesFireParams'
		FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaMultiFireParams'
		FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSniperFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaLaserFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsComp.VPR_Gray'
	begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Purple"
	end object
	Camos[0]=VPR_Gray
	// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsComp.VPR_UTC'
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
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaSeriesEffectParams'
begin object name="ArenaSeriesEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Std'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=43.0000000
	DamageRadius=16.0000000
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
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaMultiEffectParams'
begin object name="ArenaMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_SG'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=5500.0000000
	AccelSpeed=60000.0000000
	Damage=43.0000000
	DamageRadius=64.0000000
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
// Reference: ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaSniperEffectParams'
begin object name="ArenaSniperEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.E23Projectile_Snpr'
	SpawnOffset=(X=30.0000000,Y=6.0000000,Z=-12.0000000)
	Speed=5500.0000000
	MaxSpeed=50000.0000000
	AccelSpeed=100000.0000000
	Damage=43.0000000
	DamageRadius=64.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainEndTime=0.3500000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-SRFire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.3500000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSeriesFireParams'
begin object name="ArenaSeriesFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	AmmoPerFire=5
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaSeriesEffectParams'
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsComp.ArenaMultiFireParams'
begin object name="ArenaMultiFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=5
	TargetState="Shotgun"
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaMultiEffectParams'
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSniperFireParams'
begin object name="ArenaSniperFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=20
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaSniperEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaLaserEffectParams'
begin object name="ArenaLaserEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=11
	DamageType=Class'BallisticProV55.DTVPRLaser'
	DamageTypeHead=Class'BallisticProV55.DTVPRLaserHead'
	DamageTypeArm=Class'BallisticProV55.DTVPRLaser'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.E23WeaponParamsComp.ArenaLaserFireParams'
begin object name="ArenaLaserFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="None"
	FireLoopAnim="'"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.E23WeaponParamsComp.ArenaLaserEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.E23WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=-0.0100000),(InVal=0.3500000,OutVal=-0.0300000),(InVal=0.6000000,OutVal=0.0100000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.3800000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.7000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1900000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.E23WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.E23WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	ZoomType=2
	ScopeScale=0.7000000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BallisticProV55.E23WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.E23WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSeriesFireParams'
	FireParams[1]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaMultiFireParams'
	FireParams[2]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaSniperFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.E23WeaponParamsComp.ArenaLaserFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsComp.VPR_Gray'
begin object name="VPR_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Purple"
end object
// Reference: WeaponCamo'BallisticProV55.E23WeaponParamsComp.VPR_UTC'
begin object name="VPR_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.ViperCamos.UTCViperShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
