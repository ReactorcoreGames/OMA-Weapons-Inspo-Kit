class X4WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.X4WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=1
		WeaponPrice=150
		SightMoveSpeedFactor=0.5000000
		WeaponName="X4 Venom Blade"
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.X4WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.X4WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BallisticProV55.X4WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=78.0000000,Max=78.0000000)
	WaterTraceRange=5000.0000000
	Damage=46
	HeadMult=2.2826080
	LimbMult=0.4565210
	DamageType=Class'BallisticProV55.DTX4KnifeTox'
	DamageTypeHead=Class'BallisticProV55.DTX4KnifeHeadTox'
	DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimbTox'
	HookStopFactor=1.3000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X4WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.X4WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=92.0000000,Max=92.0000000)
	WaterTraceRange=5000.0000000
	Damage=82
	HeadMult=2.6829260
	LimbMult=0.4756090
	DamageType=Class'BallisticProV55.DTX4KnifeTox'
	DamageTypeHead=Class'BallisticProV55.DTX4KnifeHeadTox'
	DamageTypeArm=Class'BallisticProV55.DTX4KnifeLimbTox'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepMelee"
	FireAnim="Melee"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X4WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.X4WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.X4WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.X4WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=1
	WeaponPrice=150
	SightMoveSpeedFactor=0.5000000
	WeaponName="X4 Venom Blade"
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.X4WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.X4WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.X4WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
