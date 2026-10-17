class SkrithStaffWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5500000
		SightOffset=(X=-20.0000000,Y=0.3100000,Z=12.5000000)
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=9.0000000,Y=4.0000000,Z=-7.0000000)
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRapidPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSlowPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRapidPrimaryEffectParams'
begin object name="ArenaRapidPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.SkrithStaffProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=38.0000000
	DamageRadius=96.0000000
	MomentumTransfer=150.0000000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.2000000
	Recoil=128.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRapidPrimaryFireParams'
begin object name="ArenaRapidPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	AmmoPerFire=2
	FireEndAnim="None"
	AimedFireAnim="FireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRapidPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSlowPrimaryEffectParams'
begin object name="ArenaSlowPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.SkrithStaffPower'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=11000.0000000
	MaxSpeed=11000.0000000
	Damage=80.0000000
	DamageRadius=180.0000000
	MomentumTransfer=150.0000000
	MuzzleFlashClass=Class'BallisticProV55.E23FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSlowPrimaryFireParams'
begin object name="ArenaSlowPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=12
	FireAnim="FireBomb"
	FireEndAnim="None"
	AimedFireAnim="FireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSlowPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	Damage=8
	DamageType=Class'BWBP_SWC_Pro.DT_SkrithStaff'
	DamageTypeHead=Class'BWBP_SWC_Pro.DT_SkrithStaffHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DT_SkrithStaff'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SWC_Pro.SkrithStaffFlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Chaos=0.0100000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireAnim="None"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	AimedFireAnim="SecFireLoopSight"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.3500000
	YRandFactor=0.5000000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	AimDamageThreshold=75
	ChaosDeclineTime=2.5000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5500000
	SightOffset=(X=-20.0000000,Y=0.3100000,Z=12.5000000)
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=9.0000000,Y=4.0000000,Z=-7.0000000)
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaRapidPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSlowPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryFireParams'
end object
