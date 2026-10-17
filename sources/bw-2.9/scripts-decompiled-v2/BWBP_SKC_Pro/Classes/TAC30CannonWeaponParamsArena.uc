class TAC30CannonWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		InventorySize=30
		SightMoveSpeedFactor=0.8000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=2048)
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.TAC30Projectile'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=8000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=50000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.SRAC-Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FlashScaleFactor=0.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	ViewBindFactor=0.0000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1024)
	ViewBindFactor=0.2500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	InventorySize=30
	SightMoveSpeedFactor=0.8000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=2048)
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.TAC30CannonWeaponParamsArena.ArenaSecondaryFireParams'
end object
