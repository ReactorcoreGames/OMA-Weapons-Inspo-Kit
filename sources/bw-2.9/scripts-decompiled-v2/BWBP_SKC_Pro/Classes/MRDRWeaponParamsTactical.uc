class MRDRWeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightPivot=(Pitch=900,Yaw=0,Roll=-800)
		DisplaceDurationMult=0.5000000
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Body'
	PenetrationEnergy=16.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MRDRFlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MRDR.MRDR-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=200.0000000
	Chaos=0.1000000
	Inaccuracy=(X=128,Y=128)
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0670000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=45
	DamageType=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MRDR88SpikeHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MRDR88Spike'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.8000000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.2000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1900000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	MaxMoveMultiplier=1.1500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightPivot=(Pitch=900,Yaw=0,Roll=-800)
	DisplaceDurationMult=0.5000000
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MRDRWeaponParamsTactical.TacticalSecondaryFireParams'
end object
