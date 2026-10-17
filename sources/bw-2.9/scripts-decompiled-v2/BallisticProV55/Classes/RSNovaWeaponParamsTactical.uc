class RSNovaWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		WeaponModes[0]=(ModeName="Slow Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Lightning",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Thunder Strike",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Chain Lightning",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalBoltRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSlowFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalLightningFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalGodStrikeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalChainLightningFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSlowEffectParams'
begin object name="TacticalSlowEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=90.0000000
	DamageRadius=128.0000000
	MomentumTransfer=70000.0000000
	HeadMult=2.5000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSlowFireParams'
begin object name="TacticalSlowFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5500000
	AmmoPerFire=3
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSlowEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastEffectParams'
begin object name="TacticalFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaFastProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=37.0000000
	DamageRadius=48.0000000
	MomentumTransfer=10000.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastFireParams'
begin object name="TacticalFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1350000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalLightningEffectParams'
begin object name="TacticalLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=2.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalLightningFireParams'
begin object name="TacticalLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="NovaLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalLightningEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalGodStrikeEffectParams'
begin object name="TacticalGodStrikeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=145.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-LightningBolt',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalGodStrikeFireParams'
begin object name="TacticalGodStrikeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=2
	TargetState="Zap"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalGodStrikeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalChainLightningEffectParams'
begin object name="TacticalChainLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=3.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalChainLightningFireParams'
begin object name="TacticalChainLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ChainLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalChainLightningEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=200.0000000,Max=200.0000000)
	WaterTraceRange=5000.0000000
	DamageType=Class'BallisticProV55.DT_RSNovaStab'
	DamageTypeHead=Class'BallisticProV55.DT_RSNovaStabHead'
	DamageTypeArm=Class'BallisticProV55.DT_RSNovaStab'
	HookStopFactor=1.7000000
	HookPullForce=150.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.NovaStaff.Nova-Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalBoltRecoilParams'
begin object name="TacticalBoltRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=0.8000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.8000000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastRecoilParams'
begin object name="TacticalFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	WeaponModes[0]=(ModeName="Slow Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Lightning",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Thunder Strike",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Chain Lightning",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalBoltRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSlowFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalLightningFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalGodStrikeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalChainLightningFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsTactical.TacticalSecondaryFireParams'
end object
