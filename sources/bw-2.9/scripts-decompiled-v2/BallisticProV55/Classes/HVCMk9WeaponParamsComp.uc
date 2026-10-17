class HVCMk9WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=13
	DamageType=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeHead=Class'BallisticProV55.DT_HVCLightning'
	DamageTypeArm=Class'BallisticProV55.DT_HVCLightning'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.LightningGun.LG-FireStart',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	TargetState="DirectFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=200
	HeadMult=1.5000000
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
// Reference: FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=1.0000000
end object
// Reference: AimParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=2,Max=2)
	AimAdjustTime=0.4000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.HVCMk9WeaponParamsComp.ArenaSecondaryFireParams'
end object
