class KF8XWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=8.0000000
		ZoomStages=2
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.KF8XToxicBolt'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	Damage=40.0000000
	LimbMult=0.8500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XBow.XBow-Fire',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.1500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.1500000
end object
// Reference: FireParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	PreFireAnim="None"
	FireAnim="FireCycleRotate"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.5000000
end object
// Reference: AimParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.2500000
	JumpChaos=0.2000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=8.0000000
	ZoomStages=2
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.KF8XWeaponParamsComp.ArenaPrimaryFireParams'
end object
