class WrenchgunWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		CockAnimRate=0.7000000
		ReloadAnimRate=1.1000000
		SightOffset=(X=-40.0000000,Y=12.0000000,Z=43.0000000)
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ViewOffset=(X=-10.0000000,Y=20.0000000,Z=-30.0000000)
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.WrenchgunWrenchShot'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Damage=12.0000000
	MomentumTransfer=17000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=440,Y=220)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	FireAnim="FireCombined"
	FireAnimRate=0.8000000
	AimedFireAnim="SightFireCombined"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.WrenchgunWrench'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=44.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.SuperMagnum-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=50,Y=25)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	FireAnim="FireCombined"
	FireAnimRate=0.8000000
	AimedFireAnim="SightFireCombined"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3500000
end object
// Reference: AimParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=128)
end object
// Reference: WeaponParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	CockAnimRate=0.7000000
	ReloadAnimRate=1.1000000
	SightOffset=(X=-40.0000000,Y=12.0000000,Z=43.0000000)
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ViewOffset=(X=-10.0000000,Y=20.0000000,Z=-30.0000000)
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.WrenchgunWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
