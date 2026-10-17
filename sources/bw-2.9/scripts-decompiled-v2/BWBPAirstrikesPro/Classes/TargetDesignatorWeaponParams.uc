class TargetDesignatorWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=10
		ZoomType=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalRecoilParams'
		AimParams[0]=AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalAimParams'
		FireParams[0]=FireParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=1.0000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	FireAnim="Point"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=10
	ZoomType=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalRecoilParams'
	AimParams[0]=AimParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.UniversalAimParams'
	FireParams[0]=FireParams'BWBPAirstrikesPro.TargetDesignatorWeaponParams.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.SkrithStaffWeaponParamsArena.ArenaSecondaryFireParams'
end object
