class KF8XWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=8.0000000
		ZoomStages=2
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalPrimaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.KF8XToxicBolt'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=30.0000000
	HeadMult=3.2500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XBow.XBow-Fire',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.1500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.1500000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	PreFireAnim="None"
	FireAnim="FireCycleRotate"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.5000000
end object
// Reference: AimParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	JumpChaos=0.2000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=2
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsTactical.TacticalPrimaryFireParams'
end object
