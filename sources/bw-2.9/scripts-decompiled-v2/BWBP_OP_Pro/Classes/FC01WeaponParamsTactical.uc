class FC01WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalParams_Smart'
	begin object name="TacticalParams_Smart" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="6mm Smart"
		LayoutTags="TargetScope"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams_Smart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams_Smart
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm AP"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPhotonPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.2500000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.0300000),(InVal=0.3500000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.2400000
	YRandFactor=0.2400000
	MaxRecoil=6400.0000000
	ClimbTime=0.0200000
	DeclineTime=0.5500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryEffectParams_Smart'
begin object name="TacticalPrimaryEffectParams_Smart" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FC01SmartProj'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=25.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FC01.FC01-SmartShot',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams_Smart'
begin object name="TacticalPrimaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryEffectParams_Smart'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=20
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Body'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Body'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.FC01.P90Fire2',Volume=0.9500000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=360.0000000
	Chaos=0.0200000
	Inaccuracy=(X=32,Y=32)
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPhotonPrimaryEffectParams'
begin object name="TacticalPhotonPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	RangeAtten=0.1000000
	Damage=22
	DamageType=Class'BWBP_OP_Pro.DT_FC01Photon'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01PhotonHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Photon'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.F2000-FireAlt1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPhotonPrimaryFireParams'
begin object name="TacticalPhotonPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPhotonPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Photon'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01PhotonHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Photon'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalParams_Smart'
begin object name="TacticalParams_Smart" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="6mm Smart"
	LayoutTags="TargetScope"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams_Smart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm AP"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	ViewOffset=(X=10.0000000,Y=10.0000000,Z=-18.0000000)
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalPhotonPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsTactical.TacticalSecondaryFireParams'
end object
