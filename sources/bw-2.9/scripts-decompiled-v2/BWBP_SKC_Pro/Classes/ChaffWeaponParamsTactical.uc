class ChaffWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MaxInventoryCount=1
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=1
		WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ChaffGrenade'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1000.0000000
	Damage=40.0000000
	DamageRadius=256.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
end object
// Reference: FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=140.0000000,Max=140.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTChaffSmack'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=0.8000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	PreFireAnim="PrepSmack"
	FireAnim="Smack"
	PreFireAnimRate=2.0000000
	FireAnimRate=1.5000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MaxInventoryCount=1
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=1
	WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsTactical.TacticalSecondaryFireParams'
end object
