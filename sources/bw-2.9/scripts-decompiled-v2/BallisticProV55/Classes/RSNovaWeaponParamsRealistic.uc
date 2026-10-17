class RSNovaWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightPivot=(Pitch=1200,Yaw=0,Roll=0)
		MagAmmo=66
		RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[2]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[3]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
		RecoilParams[4]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
		AimParams[1]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
		AimParams[2]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
		AimParams[3]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
		AimParams[4]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSlowFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticLightningFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticGodStrikeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticChainLightningFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=2048)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
	ChaosTurnThreshold=150000
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=-0.1500000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=-1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSlowEffectParams'
begin object name="RealisticSlowEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=6000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=10000.0000000
	Damage=80.0000000
	DamageRadius=192.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.2000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSlowFireParams'
begin object name="RealisticSlowFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=3
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSlowEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticFastEffectParams'
begin object name="RealisticFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaFastProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=10000.0000000
	Damage=25.0000000
	DamageRadius=48.0000000
	MomentumTransfer=10000.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=14.0000000
	Chaos=0.0050000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticFastFireParams'
begin object name="RealisticFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1750000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticLightningEffectParams'
begin object name="RealisticLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=5.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticLightningFireParams'
begin object name="RealisticLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="NovaLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticLightningEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticGodStrikeEffectParams'
begin object name="RealisticGodStrikeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=250.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-LightningBolt',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticGodStrikeFireParams'
begin object name="RealisticGodStrikeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=2
	TargetState="Zap"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticGodStrikeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticChainLightningEffectParams'
begin object name="RealisticChainLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=5.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticChainLightningFireParams'
begin object name="RealisticChainLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ChainLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticChainLightningEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=200.0000000,Max=200.0000000)
	WaterTraceRange=5000.0000000
	Damage=55
	HeadMult=1.8181810
	LimbMult=0.4545450
	DamageType=Class'BallisticProV55.DT_RSNovaStab'
	DamageTypeHead=Class'BallisticProV55.DT_RSNovaStabHead'
	DamageTypeArm=Class'BallisticProV55.DT_RSNovaStab'
	HookStopFactor=1.7000000
	HookPullForce=150.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.NovaStaff.Nova-Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightPivot=(Pitch=1200,Yaw=0,Roll=0)
	MagAmmo=66
	RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[2]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[3]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
	RecoilParams[4]=RecoilParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
	AimParams[1]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
	AimParams[2]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
	AimParams[3]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
	AimParams[4]=AimParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSlowFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticLightningFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticGodStrikeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticChainLightningFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
