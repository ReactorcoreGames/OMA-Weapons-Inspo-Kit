class KF8XWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		ZoomType=2
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.KF8XToxicBolt'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=9000.0000000
	Damage=20.0000000
	HeadMult=1.5000000
	LimbMult=0.8500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XBow.XBow-Fire',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.1500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.1500000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	PreFireAnim="None"
	FireAnim="FireCycleRotate"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.5000000
end object
// Reference: AimParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.0000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	JumpChaos=0.2000000
	FallingChaos=0.3000000
	SprintChaos=0.3000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	ZoomType=2
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsClassic.ClassicSecondaryFireParams'
end object
