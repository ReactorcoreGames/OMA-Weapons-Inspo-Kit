class RSNovaWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.3000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		WeaponModes[0]=(ModeName="Slow Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Lightning",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Thunder Strike",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Chain Lightning",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaBoltRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSlowFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaLightningFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaGodStrikeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaChainLightningFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSlowEffectParams'
begin object name="ArenaSlowEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=75.0000000
	DamageRadius=128.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSlowFireParams'
begin object name="ArenaSlowFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	AmmoPerFire=3
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSlowEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastEffectParams'
begin object name="ArenaFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSNovaFastProjectile'
	SpawnOffset=(X=12.0000000,Y=8.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=32.0000000
	DamageRadius=48.0000000
	MomentumTransfer=10000.0000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastFireParams'
begin object name="ArenaFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaLightningEffectParams'
begin object name="ArenaLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=3.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaLightningFireParams'
begin object name="ArenaLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="NovaLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaLightningEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaGodStrikeEffectParams'
begin object name="ArenaGodStrikeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=140.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-LightningBolt',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaGodStrikeFireParams'
begin object name="ArenaGodStrikeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=2
	TargetState="Zap"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaGodStrikeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaChainLightningEffectParams'
begin object name="ArenaChainLightningEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=3.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaChainLightningFireParams'
begin object name="ArenaChainLightningFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ChainLightning"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaChainLightningEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=200.0000000,Max=200.0000000)
	WaterTraceRange=5000.0000000
	Damage=65
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
// Reference: FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepSwipe"
	FireAnim="Swipe"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaBoltRecoilParams'
begin object name="ArenaBoltRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=0.8000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.8000000
	ViewBindFactor=0.4000000
	HipMultiplier=1.5000000
end object
// Reference: RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastRecoilParams'
begin object name="ArenaFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6500000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=384)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.3000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	WeaponModes[0]=(ModeName="Slow Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Lightning",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Thunder Strike",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Chain Lightning",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaBoltRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSlowFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaLightningFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaGodStrikeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaChainLightningFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSNovaWeaponParamsComp.ArenaSecondaryFireParams'
end object
