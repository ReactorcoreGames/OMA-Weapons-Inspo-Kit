class CX85WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Seeker Spikes"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.7000000
		ZoomType=2
		MagAmmo=32
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams_Smart'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicParams_556'
	begin object name="ClassicParams_556" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.7000000
		ZoomType=2
		MagAmmo=50
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams_556mm'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_556
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.3500000
	Damage=5
	DamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Dart'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.4000000,OutVal=0.1800000),(InVal=0.8000000,OutVal=0.2200000),(InVal=1.0000000,OutVal=0.2500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.5000000,OutVal=0.4450000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	DeclineTime=1.0000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2048)
	AimAdjustTime=0.8000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ViewBindFactor=0.6000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=2.0000000
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.CX85Flechette'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=45.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX85.CX85-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryEffectParams_556mm'
begin object name="ClassicPrimaryEffectParams_556mm" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.9000000
	Damage=24
	HeadMult=3.1250000
	LimbMult=0.5000000
	DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=150.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams_556mm'
begin object name="ClassicPrimaryFireParams_556mm" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryEffectParams_556mm'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams_Smart'
begin object name="ClassicSecondaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Seeker Spikes"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.7000000
	ZoomType=2
	MagAmmo=32
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams_Smart'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicParams_556'
begin object name="ClassicParams_556" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.7000000
	ZoomType=2
	MagAmmo=50
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicPrimaryFireParams_556mm'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsClassic.ClassicSecondaryFireParams'
end object
