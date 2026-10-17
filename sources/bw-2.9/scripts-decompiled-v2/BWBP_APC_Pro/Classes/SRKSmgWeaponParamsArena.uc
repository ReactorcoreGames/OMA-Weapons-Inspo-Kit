class SRKSmgWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		ReloadAnimRate=0.8500000
		SightingTime=0.2000000
		SightOffset=(X=0.0000000,Y=-0.3450000,Z=15.8000000)
		ViewOffset=(X=5.0000000,Y=6.0000000,Z=-14.0000000)
		MagAmmo=36
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.1800000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.6000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1800000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.5000000,OutVal=0.5000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.0900000
	DeclineTime=1.0000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.1500000
	CrouchMultiplier=0.8000000
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	RangeAtten=0.9000000
	Damage=26
	DamageType=Class'BWBP_APC_Pro.DTSRKSmg'
	DamageTypeHead=Class'BWBP_APC_Pro.DTSRKSmgHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTSRKSmg'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.SRKS.SRKS-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.0400000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	BurstFireRateFactor=0.8000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.SHADRACHRifleGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=320.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.SRKSmgAltFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MJ51.MJ51Carbine-GrenLaunch',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="GrenadeFire"
	AimedFireAnim="GrenadeFireSight"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=1.2500000
end object
// Reference: WeaponParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	ReloadAnimRate=0.8500000
	SightingTime=0.2000000
	SightOffset=(X=0.0000000,Y=-0.3450000,Z=15.8000000)
	ViewOffset=(X=5.0000000,Y=6.0000000,Z=-14.0000000)
	MagAmmo=36
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.SRKSmgWeaponParamsArena.ArenaSecondaryFireParams'
end object
