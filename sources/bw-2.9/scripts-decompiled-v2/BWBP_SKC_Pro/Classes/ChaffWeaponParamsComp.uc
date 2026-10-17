class ChaffWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=1
		WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.ChaffGrenade'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1000.0000000
	Damage=50.0000000
	DamageRadius=256.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
end object
// Reference: FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=140.0000000,Max=140.0000000)
	Damage=65
	DamageType=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTChaffSmack'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=0.8000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	PreFireAnim="PrepSmack"
	FireAnim="Smack"
	PreFireAnimRate=2.0000000
	FireAnimRate=1.5000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=1
	WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ChaffWeaponParamsComp.ArenaSecondaryFireParams'
end object
