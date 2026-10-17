class CX85WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		ZoomType=1
		ScopeScale=0.7000000
		MaxZoom=4.0000000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaParams_Seeker'
	begin object name="ArenaParams_Seeker" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Seeker Spikes"
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		ZoomType=1
		ScopeScale=0.7000000
		MaxZoom=4.0000000
		MagAmmo=24
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams_Seeker'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams_Smart'
	end object
	Layouts[1]=ArenaParams_Seeker
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=15
	DamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Dart'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.4000000,OutVal=0.1800000),(InVal=0.8000000,OutVal=0.2200000),(InVal=1.0000000,OutVal=0.2500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.5000000,OutVal=0.4450000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	ViewBindFactor=0.3000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1024)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2363.0000000,Max=5000.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.5000000,bAtten=false,bNoOverride=false)
	Recoil=120.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryEffectParams_Seeker'
begin object name="ArenaPrimaryEffectParams_Seeker" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.CX85Flechette'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=15000.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=1000.0000000
	Damage=40.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX61.CX61-FireHeavy',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams_Seeker'
begin object name="ArenaPrimaryFireParams_Seeker" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryEffectParams_Seeker'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams_Smart'
begin object name="ArenaSecondaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	ZoomType=1
	ScopeScale=0.7000000
	MaxZoom=4.0000000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaParams_Seeker'
begin object name="ArenaParams_Seeker" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Seeker Spikes"
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	ZoomType=1
	ScopeScale=0.7000000
	MaxZoom=4.0000000
	MagAmmo=24
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaPrimaryFireParams_Seeker'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsComp.ArenaSecondaryFireParams_Smart'
end object
