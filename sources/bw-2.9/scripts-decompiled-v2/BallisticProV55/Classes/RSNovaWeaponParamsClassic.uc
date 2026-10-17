class RSNovaWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		LayoutName="Standard"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1200,Yaw=0,Roll=0)
		MagAmmo=66
		RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSlowFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicLightningFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicGodStrikeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicChainLightningFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSlowEffectParams'
begin object name="ClassicSlowEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=50.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=16000.0000000
	Damage=80.0000000
	DamageRadius=192.0000000
	MomentumTransfer=90000.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.2000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSlowFireParams'
begin object name="ClassicSlowFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=3
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSlowEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicFastEffectParams'
begin object name="ClassicFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaFastProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=50.0000000
	MaxSpeed=7000.0000000
	AccelSpeed=30000.0000000
	Damage=18.0000000
	DamageRadius=48.0000000
	MomentumTransfer=10000.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=14.0000000
	Chaos=0.0050000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicFastFireParams'
begin object name="ClassicFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicLightningEffectParams'
begin object name="ClassicLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=5.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicLightningFireParams'
begin object name="ClassicLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="NovaLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicLightningEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicGodStrikeEffectParams'
begin object name="ClassicGodStrikeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=200.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-LightningBolt',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicGodStrikeFireParams'
begin object name="ClassicGodStrikeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=2
	TargetState="Zap"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicGodStrikeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicChainLightningEffectParams'
begin object name="ClassicChainLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=5.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicChainLightningFireParams'
begin object name="ClassicChainLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ChainLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicChainLightningEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
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
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
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
// Reference: AimParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=2048)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=2400
	ChaosTurnThreshold=150000
end object
// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	LayoutName="Standard"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1200,Yaw=0,Roll=0)
	MagAmmo=66
	RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSlowFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicLightningFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicGodStrikeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicChainLightningFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsClassic.ClassicSecondaryFireParams'
end object
