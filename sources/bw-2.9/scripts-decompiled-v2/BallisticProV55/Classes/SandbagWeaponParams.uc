class SandbagWeaponParams extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.SandbagWeaponParams.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.SandbagWeaponParams.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.SandbagWeaponParams.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.SandbagWeaponParams.UniversalFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.SandbagWeaponParams.UniversalFireParams'
	end object
	Layouts[0]=UniversalParams
	// Reference: WeaponCamo'BallisticProV55.SandbagWeaponParams.Default'
	begin object name="Default" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Default"
	end object
	Camos[0]=Default
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.SandbagWeaponParams.UniversalFireParams'
begin object name="UniversalFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireAnim="Place2"
	FireAnimRate=1.3000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.SandbagWeaponParams.UniversalEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.SandbagWeaponParams.UniversalEffectParams'
begin object name="UniversalEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=2.0000000
	EffectString="Deploy bags"
end object
// Reference: RecoilParams'BallisticProV55.SandbagWeaponParams.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.SandbagWeaponParams.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.SandbagWeaponParams.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.SandbagWeaponParams.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.SandbagWeaponParams.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.SandbagWeaponParams.UniversalFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.SandbagWeaponParams.UniversalFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.SandbagWeaponParams.Default'
begin object name="Default" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Default"
end object
