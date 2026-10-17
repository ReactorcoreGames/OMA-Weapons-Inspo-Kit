class FC01WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicParams_Smart'
	begin object name="ClassicParams_Smart" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="6mm Smart"
		LayoutTags="TargetScope"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams_Smart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams_Smart
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm AP"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPhotonPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.4000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.6500000
	XRandFactor=0.1000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=120,Max=256)
	AimAdjustTime=1.2000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0500000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=850
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryEffectParams_Smart'
begin object name="ClassicPrimaryEffectParams_Smart" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FC01SmartProj'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=20.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FC01.FC01-SmartShot',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams_Smart'
begin object name="ClassicPrimaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryEffectParams_Smart'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2500.0000000
	RangeAtten=0.5000000
	Damage=13
	HeadMult=3.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Body'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Body'
	PenetrationEnergy=24.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.FC01.P90Fire2',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=48.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=21,Y=21)
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0780000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPhotonPrimaryEffectParams'
begin object name="ClassicPhotonPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPhotonPrimaryFireParams'
begin object name="ClassicPhotonPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPhotonPrimaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicParams_Smart'
begin object name="ClassicParams_Smart" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="6mm Smart"
	LayoutTags="TargetScope"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams_Smart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm AP"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.4500000)
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParamsClassic.ClassicPhotonPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsClassic.ClassicSecondaryFireParams'
end object
