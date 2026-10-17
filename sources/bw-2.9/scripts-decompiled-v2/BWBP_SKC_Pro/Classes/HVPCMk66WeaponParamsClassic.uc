class HVPCMk66WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.6500000
		PlayerJumpFactor=0.6000000
		InventorySize=16
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66Projectile'
	SpawnOffset=(X=100.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=1500.0000000
	MaxSpeed=1000000.0000000
	AccelSpeed=100.0000000
	Damage=500.0000000
	DamageRadius=832.0000000
	MomentumTransfer=280000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.BFGFlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-Fire',Volume=4.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=820.0000000
	Chaos=0.6000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.5000000
	AmmoPerFire=50
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk66ProjectileSmall'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=250.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=190000.0000000
	Damage=60.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	HeadMult=2.0833330
	LimbMult=0.6666660
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.BFG.BFG-SmallFire',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0500000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=256.0000000
	DeclineTime=0.7500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=50,Max=1100)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.3500000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=380
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.6500000
	PlayerJumpFactor=0.6000000
	InventorySize=16
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk66WeaponParamsClassic.ClassicSecondaryFireParams'
end object
