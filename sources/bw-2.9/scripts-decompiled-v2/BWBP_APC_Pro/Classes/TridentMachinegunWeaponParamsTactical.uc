class TridentMachinegunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4500000
		SightOffset=(X=5.0000000,Y=-0.8500000,Z=19.2000000)
		WeaponBoneScales[0]=(BoneName="Bullet1",Slot=101,Scale=0.0000000)
		ViewOffset=(X=0.0000000,Y=10.0000000,Z=-16.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=100
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.3500000
	Damage=20
	HeadMult=2.5000000
	DamageType=Class'BWBP_APC_Pro.DTTridentMG'
	DamageTypeHead=Class'BWBP_APC_Pro.DTTridentMGHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTTridentMG'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_APC_Sounds.CruMG.MG-Fire',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunHE'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	RangeAtten=0.3500000
	Damage=60
	HeadMult=2.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SK410ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Blast',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=378.0000000
	Chaos=0.4000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	AmmoPerFire=3
	FireEndAnim="None"
	FireAnimRate=1.7500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0700000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0850000),(InVal=0.1800000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.6500000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4500000),(InVal=0.8500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=12288.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.5000000
	HipMultiplier=1.5000000
end object
// Reference: AimParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-3000,Yaw=-6000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=3000,Roll=0)
	ChaosDeclineTime=1.6000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4500000
	SightOffset=(X=5.0000000,Y=-0.8500000,Z=19.2000000)
	WeaponBoneScales[0]=(BoneName="Bullet1",Slot=101,Scale=0.0000000)
	ViewOffset=(X=0.0000000,Y=10.0000000,Z=-16.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=100
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.TridentMachinegunWeaponParamsTactical.ArenaSecondaryFireParams'
end object
