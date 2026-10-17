class A51GrenadeWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MaxInventoryCount=1
		ViewOffset=(X=8.0000000,Y=10.0000000,Z=-12.0000000)
		ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
		MagAmmo=1
		WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A51Thrown'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1000.0000000
	MaxSpeed=1000.0000000
	Damage=5.0000000
	DamageRadius=768.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.4000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A51Rolled'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-14.0000000)
	Speed=350.0000000
	MaxSpeed=350.0000000
	Damage=5.0000000
	DamageRadius=768.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MaxInventoryCount=1
	ViewOffset=(X=8.0000000,Y=10.0000000,Z=-12.0000000)
	ViewPivot=(Pitch=1024,Yaw=-1024,Roll=0)
	MagAmmo=1
	WeaponModes[0]=(ModeName="Fixed Throw",bUnavailable=false,ModeID="WM_None",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Charged Throw",bUnavailable=false,ModeID="WM_None",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A51GrenadeWeaponParamsTactical.TacticalSecondaryFireParams'
end object
