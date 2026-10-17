class GASCPistolWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightingTime=0.1500000
		SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
		ViewOffset=(X=4.0000000,Y=10.0000000,Z=-8.0000000)
		MagAmmo=16
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="Burst of Four",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=5000.0000000)
	RangeAtten=0.2000000
	Damage=35
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_APC_Pro.DTGASCPistol'
	DamageTypeHead=Class'BWBP_APC_Pro.DTGASCPistolHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTGASCPistol'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.GASCFlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=SoundGroup'BWBP_APC_Sounds.GASC.Gaucho-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=32.0000000
	Chaos=0.1000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0950000
	FireEndAnim="None"
	FireAnimRate=1.4500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.5500000,OutVal=0.1200000),(InVal=0.8000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.4000000,OutVal=0.4200000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.3500000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1024)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=1200
end object
// Reference: WeaponParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightingTime=0.1500000
	SightOffset=(X=-5.0000000,Y=-6.3230000,Z=9.7100000)
	ViewOffset=(X=4.0000000,Y=10.0000000,Z=-8.0000000)
	MagAmmo=16
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="Burst of Four",bUnavailable=true,ModeID="WM_Burst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.GASCPistolWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsClassic.ClassicSecondaryFireParams'
end object
