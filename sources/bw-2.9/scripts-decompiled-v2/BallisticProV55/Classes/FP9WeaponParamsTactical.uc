class FP9WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.FP9WeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MaxInventoryCount=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.FP9WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.FP9WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.FP9WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.FP9Bomb'
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	Speed=600.0000000
	Damage=150.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=50000.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Throw',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.9000000
end object
// Reference: FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.FP9WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.FP9WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Detonate"
end object
// Reference: FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.FP9WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.FP9WeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.FP9WeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.FP9WeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MaxInventoryCount=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.FP9WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.FP9WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.FP9WeaponParamsTactical.TacticalSecondaryFireParams'
end object
