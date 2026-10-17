class HVPCMk66WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=300
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66Projectile'
	SpawnOffset=(X=100.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	Damage=500.0000000
	DamageRadius=1280.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.BFGFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-Fire',Volume=4.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=820.0000000
	Chaos=0.6000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5000000
	AmmoPerFire=100
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66ProjectileSmall'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=8000.0000000
	MaxSpeed=8000.0000000
	Damage=65.0000000
	DamageRadius=128.0000000
	MomentumTransfer=12500.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-SmallFire',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	AmmoPerFire=4
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.1000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	DeclineTime=0.7500000
	ADSViewBindFactor=0.5000000
end object
// Reference: AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=192,Max=1024)
	AimAdjustTime=0.6000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=300
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsTactical.TacticalSecondaryFireParams'
end object
