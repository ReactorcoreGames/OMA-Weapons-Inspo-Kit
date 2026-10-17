class TargetDesignatorWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=10
		ZoomType=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalAimParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=10
	ZoomType=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParamsClassic.UniversalAimParams'
end object
