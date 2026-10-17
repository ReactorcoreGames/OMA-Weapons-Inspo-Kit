class XMV500TW_WeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.8000000
		InventorySize=12
		SightingTime=0.8000000
		DisplaceDurationMult=1.2500000
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	RangeAtten=0.3500000
	Damage=20
	DamageType=Class'BWBP_APC_Pro.DTXMV500MG'
	DamageTypeHead=Class'BWBP_APC_Pro.DTXMV500MGHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTXMV500MG'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.550.Mini-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=48.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=-0.0500000),(InVal=0.3000000,OutVal=-0.0700000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=0.1800000),(InVal=0.7000000,OutVal=0.0500000),(InVal=0.8000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3500000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0300000
	YRandFactor=0.0300000
	DeclineTime=1.1000000
end object
// Reference: AimParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	AimAdjustTime=1.0000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=1.0000000
	AimDamageThreshold=2000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.8000000
	InventorySize=12
	SightingTime=0.8000000
	DisplaceDurationMult=1.2500000
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500TW_WeaponParams.ArenaSecondaryFireParams'
end object
