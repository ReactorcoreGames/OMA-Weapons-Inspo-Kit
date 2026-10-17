class WrenchWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=2
		ViewOffset=(X=10.0000000,Y=0.0000000,Z=-7.0000000)
		MagAmmo=1
		WeaponModes[0]=(ModeName="Boost Pad",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Teleporter",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Sandbag Stack",bUnavailable=false,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Shield Generator",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Ammo Crate",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[5]=(ModeName="Minigun Turret",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaBoostPadFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaTeleporterFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSandBagFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaGeneratorFireParams'
		FireParams[4]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAmmoCrateFireParams'
		FireParams[5]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaMinigunFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaBoostPadEffectParams'
begin object name="ArenaBoostPadEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaBoostPadFireParams'
begin object name="ArenaBoostPadFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaBoostPadEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaTeleporterEffectParams'
begin object name="ArenaTeleporterEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaTeleporterFireParams'
begin object name="ArenaTeleporterFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=50
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaTeleporterEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSandBagEffectParams'
begin object name="ArenaSandBagEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSandBagFireParams'
begin object name="ArenaSandBagFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSandBagEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaGeneratorEffectParams'
begin object name="ArenaGeneratorEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaGeneratorFireParams'
begin object name="ArenaGeneratorFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=10
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaGeneratorEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAmmoCrateEffectParams'
begin object name="ArenaAmmoCrateEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAmmoCrateFireParams'
begin object name="ArenaAmmoCrateFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=30
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAmmoCrateEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaMinigunEffectParams'
begin object name="ArenaMinigunEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaMinigunFireParams'
begin object name="ArenaMinigunFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=100
	FireAnim="Button"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaMinigunEffectParams'
end object
// Reference: FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
end object
// Reference: FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=20
	FireAnim="BarrierButton"
	FireAnimRate=2.0000000
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=2
	ViewOffset=(X=10.0000000,Y=0.0000000,Z=-7.0000000)
	MagAmmo=1
	WeaponModes[0]=(ModeName="Boost Pad",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Teleporter",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sandbag Stack",bUnavailable=false,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Shield Generator",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo Crate",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Minigun Turret",bUnavailable=false,ModeID="WM_SemiAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaBoostPadFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaTeleporterFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSandBagFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaGeneratorFireParams'
	FireParams[4]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaAmmoCrateFireParams'
	FireParams[5]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaMinigunFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.WrenchWeaponParamsComp.ArenaSecondaryFireParams'
end object
