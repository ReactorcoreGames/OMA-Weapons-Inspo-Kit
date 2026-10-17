class XM84WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		SightMoveSpeedFactor=0.5000000
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.XM84Thrown'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1400.0000000
	MaxSpeed=1500.0000000
	Damage=40.0000000
	DamageRadius=1024.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.XM84Rolled'
	SpawnOffset=(X=25.0000000,Y=10.0000000,Z=2.0000000)
	Speed=1400.0000000
	MaxSpeed=1500.0000000
	Damage=45.0000000
	DamageRadius=768.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-Throw',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.4000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepRoll"
	FireAnim="Roll"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
end object
// Reference: AimParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	SightMoveSpeedFactor=0.5000000
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.XM84WeaponParamsClassic.ClassicSecondaryFireParams'
end object
