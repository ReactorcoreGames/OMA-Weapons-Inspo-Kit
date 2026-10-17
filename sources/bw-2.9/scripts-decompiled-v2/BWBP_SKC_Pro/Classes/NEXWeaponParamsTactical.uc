class NEXWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=5
		WeaponBoneScales[0]=(BoneName="WeldingShield",Slot=1,Scale=0.0000000)
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalAimParams'
	end object
	Layouts[0]=TacticalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=5
	WeaponBoneScales[0]=(BoneName="WeldingShield",Slot=1,Scale=0.0000000)
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.NEXWeaponParamsTactical.TacticalAimParams'
end object
