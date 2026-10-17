class CX85WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.7500000
		ZoomType=2
		WeaponName="CX85 15mm Flechette Cannon"
		MagAmmo=32
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams_Smart'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticParams_556'
	begin object name="RealisticParams_556" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Seeker Spikes"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.7500000
		ZoomType=2
		WeaponName="CX85 5.56mm Modified Rifle"
		MagAmmo=60
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams_556'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_556
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.3500000
	Damage=5
	DamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Dart'
	FireSound=(Sound=Sound'AssaultSounds.HumanShip.TargetCycle01',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.6000000,OutVal=0.2500000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.3000000)))
	PitchFactor=0.5000000
	YawFactor=0.3000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	DeclineDelay=0.1650000
	ViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2772)
	AimAdjustTime=0.8000000
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=525
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.CX85Flechette'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=50.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX85.CX85-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=376.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryEffectParams_556'
begin object name="RealisticPrimaryEffectParams_556" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
	PenetrationEnergy=32.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams_556'
begin object name="RealisticPrimaryFireParams_556" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireAnim="SightFire"
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryEffectParams_556'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams_Smart'
begin object name="RealisticSecondaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.7500000
	ZoomType=2
	WeaponName="CX85 15mm Flechette Cannon"
	MagAmmo=32
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams_Smart'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticParams_556'
begin object name="RealisticParams_556" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Seeker Spikes"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.7500000
	ZoomType=2
	WeaponName="CX85 5.56mm Modified Rifle"
	MagAmmo=60
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticPrimaryFireParams_556'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
