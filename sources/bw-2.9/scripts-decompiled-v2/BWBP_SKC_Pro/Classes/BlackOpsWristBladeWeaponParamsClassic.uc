class BlackOpsWristBladeWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Single"
		LayoutTags="single"
		PlayerSpeedFactor=1.2000000
		InventorySize=2
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.BOBOg_FPm'
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicParams_Double'
	begin object name="ClassicParams_Double" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Double"
		PlayerSpeedFactor=1.1000000
		InventorySize=2
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Double
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Slash1"
	FireAnimRate=0.9000000
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	PreFireAnim="PrepHack"
	FireAnim="Hack"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.5000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=100.0000000,Max=100.0000000)
	Damage=55
	HeadMult=2.0000000
	LimbMult=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.1000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Damage=115
	HeadMult=1.5000000
	LimbMult=0.8000000
	DamageType=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBOBHeadLunge'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBOBTorsoLunge'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=2.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Single"
	LayoutTags="single"
	PlayerSpeedFactor=1.2000000
	InventorySize=2
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.BOBOg_FPm'
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicParams_Double'
begin object name="ClassicParams_Double" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Double"
	PlayerSpeedFactor=1.1000000
	InventorySize=2
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BlackOpsWristBladeWeaponParamsClassic.ClassicSecondaryFireParams'
end object
