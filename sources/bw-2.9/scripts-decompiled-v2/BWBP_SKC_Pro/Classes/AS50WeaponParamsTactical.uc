class AS50WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5500000
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=4.0000000
		MaxZoom=8.0000000
		ZoomStages=1
		DisplaceDurationMult=1.2500000
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=150
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8500000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=3072.0000000
	PushbackForce=255.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireAnim="CFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=100
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PDamageFactor=0.0000000
	WallPDamageFactor=0.8500000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=3072.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireAnim="CFire"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0400000),(InVal=0.4000000,OutVal=0.0600000),(InVal=0.8000000,OutVal=0.1300000),(InVal=1.0000000,OutVal=0.1700000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.4500000
	YRandFactor=0.2500000
	MinRandFactor=0.3500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1500000
	DeclineTime=1.5000000
	DeclineDelay=0.7500000
	ViewBindFactor=0.1500000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5500000
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=4.0000000
	MaxZoom=8.0000000
	ZoomStages=1
	DisplaceDurationMult=1.2500000
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AS50WeaponParamsTactical.TacticalSecondaryFireParams'
end object
