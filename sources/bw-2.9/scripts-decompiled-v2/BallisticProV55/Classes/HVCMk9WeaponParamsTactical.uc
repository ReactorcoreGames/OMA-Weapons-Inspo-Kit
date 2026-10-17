class HVCMk9WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=15
	HeadMult=2.5000000
	DamageType=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCLightning'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireStart',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	TargetState="DirectFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=200
	HeadMult=1.0000000
	LimbMult=1.0000000
	DamageType=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCRedLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCRedLightning'
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-SecFire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	PushbackForce=1600.0000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=1.0000000
end object
// Reference: AimParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=2,Max=2)
	AimAdjustTime=0.6000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsTactical.TacticalSecondaryFireParams'
end object
