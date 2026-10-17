class XMV500WeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7000000
		PlayerJumpFactor=0.7000000
		InventorySize=12
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		DisplaceDurationMult=1.9000000
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaPrimaryEffectParams'
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
	Recoil=24.0000000
	Chaos=0.1200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2800000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.7000000,OutVal=0.2500000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.6000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1700000),(InVal=0.3500000,OutVal=-0.4000000),(InVal=0.5000000,OutVal=-0.7000000),(InVal=1.0000000,OutVal=-1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=32768.0000000
	DeclineTime=2.5000000
	ViewBindFactor=0.1000000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	SprintOffset=(Pitch=-7000,Yaw=-3500,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7000000
	PlayerJumpFactor=0.7000000
	InventorySize=12
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	DisplaceDurationMult=1.9000000
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParams.ArenaSecondaryFireParams'
end object
