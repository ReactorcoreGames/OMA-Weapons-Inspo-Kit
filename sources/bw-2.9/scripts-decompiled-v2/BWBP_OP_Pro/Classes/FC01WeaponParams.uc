class FC01WeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParams.ArenaParams_Smart'
	begin object name="ArenaParams_Smart" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="6mm Smart"
		LayoutTags="TargetScope"
		InventorySize=5
		CockAnimRate=1.4000000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.9500000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=6.0000000,Z=-18.0000000)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams_Smart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams_Smart
	// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParams.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.7mm AP"
		InventorySize=5
		CockAnimRate=1.4000000
		SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.9500000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=6.0000000,Z=-18.0000000)
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParams.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParams.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPhotonPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FC01WeaponParams.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.2500000,OutVal=0.1300000),(InVal=0.3000000,OutVal=0.1100000),(InVal=0.3500000,OutVal=0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=-0.0200000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.7000000,OutVal=0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.1300000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2600000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.4000000
	DeclineDelay=0.1600000
	ViewBindFactor=0.3000000
end object
// Reference: AimParams'BWBP_OP_Pro.FC01WeaponParams.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=768)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.3000000
	SprintOffset=(Pitch=-3000,Yaw=-8000,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=7000
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryEffectParams_Smart'
begin object name="ArenaPrimaryEffectParams_Smart" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams_Smart'
begin object name="ArenaPrimaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryEffectParams_Smart'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	RangeAtten=0.1000000
	Damage=20
	DamageType=Class'BWBP_OP_Pro.DT_FC01Body'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Body'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.FC01.P90Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	PreFireAnim="None"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPhotonPrimaryEffectParams'
begin object name="ArenaPhotonPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	RangeAtten=0.1000000
	Damage=22
	DamageType=Class'BWBP_OP_Pro.DT_FC01Photon'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01PhotonHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Photon'
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.F2000-FireAlt1',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=70.0000000
	Chaos=0.0320000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPhotonPrimaryFireParams'
begin object name="ArenaPhotonPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPhotonPrimaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParams.ArenaParams_Smart'
begin object name="ArenaParams_Smart" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="6mm Smart"
	LayoutTags="TargetScope"
	InventorySize=5
	CockAnimRate=1.4000000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.9500000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=6.0000000,Z=-18.0000000)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams_Smart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FC01WeaponParams.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.7mm AP"
	InventorySize=5
	CockAnimRate=1.4000000
	SightOffset=(X=0.0000000,Y=-0.9500000,Z=24.9500000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=6.0000000,Z=-18.0000000)
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FC01WeaponParams.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FC01WeaponParams.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.FC01WeaponParams.ArenaPhotonPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.DefibWeaponParamsComp.ArenaSecondaryFireParams'
end object
