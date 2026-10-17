class MRDRWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightPivot=(Pitch=900,Yaw=0,Roll=-800)
		DisplaceDurationMult=0.5000000
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=20
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	PenetrationEnergy=16.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=200.0000000
	Chaos=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1350000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=55
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88SpikeHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.1500000),(InVal=0.8000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.2000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1900000
	ViewBindFactor=0.7500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=256)
	AimAdjustTime=0.4500000
	ChaosDeclineTime=0.4500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightPivot=(Pitch=900,Yaw=0,Roll=-800)
	DisplaceDurationMult=0.5000000
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsComp.ArenaSecondaryFireParams'
end object
