class WrenchWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		ViewOffset=(X=10.0000000,Y=0.0000000,Z=-7.0000000)
		MagAmmo=1
		WeaponModes[0]=(ModeName="Boost Pad",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Teleporter",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Sandbag Stack",bUnavailable=false,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Shield Generator",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Ammo Crate",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[5]=(ModeName="Minigun Turret",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalBoostPadFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalTeleporterFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSandBagFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalGeneratorFireParams'
		FireParams[4]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAmmoCrateFireParams'
		FireParams[5]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalMinigunFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalBoostPadEffectParams'
begin object name="TacticalBoostPadEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalBoostPadFireParams'
begin object name="TacticalBoostPadFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalBoostPadEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalTeleporterEffectParams'
begin object name="TacticalTeleporterEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalTeleporterFireParams'
begin object name="TacticalTeleporterFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=50
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalTeleporterEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSandBagEffectParams'
begin object name="TacticalSandBagEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSandBagFireParams'
begin object name="TacticalSandBagFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSandBagEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalGeneratorEffectParams'
begin object name="TacticalGeneratorEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalGeneratorFireParams'
begin object name="TacticalGeneratorFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalGeneratorEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAmmoCrateEffectParams'
begin object name="TacticalAmmoCrateEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAmmoCrateFireParams'
begin object name="TacticalAmmoCrateFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=30
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAmmoCrateEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalMinigunEffectParams'
begin object name="TacticalMinigunEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalMinigunFireParams'
begin object name="TacticalMinigunFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=100
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalMinigunEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=20
	FireAnim="BarrierButton"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	ViewOffset=(X=10.0000000,Y=0.0000000,Z=-7.0000000)
	MagAmmo=1
	WeaponModes[0]=(ModeName="Boost Pad",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Teleporter",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sandbag Stack",bUnavailable=false,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Shield Generator",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo Crate",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Minigun Turret",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalBoostPadFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalTeleporterFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSandBagFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalGeneratorFireParams'
	FireParams[4]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalAmmoCrateFireParams'
	FireParams[5]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalMinigunFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsTactical.TacticalSecondaryFireParams'
end object
