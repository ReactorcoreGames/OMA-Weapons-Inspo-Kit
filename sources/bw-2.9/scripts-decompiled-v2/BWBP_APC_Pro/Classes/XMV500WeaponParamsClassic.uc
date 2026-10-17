class XMV500WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		MagAmmo=600
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="2400 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	Damage=35
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_APC_Pro.DTXMV500MG'
	DamageTypeHead=Class'BWBP_APC_Pro.DTXMV500MGHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTXMV500MG'
	PenetrationEnergy=40.0000000
	PenetrateForce=125
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.550.Mini-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=40.0000000
	PushbackForce=15.0000000
	Chaos=0.0008500
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Drop"
	FireEffectParams[0]=FireEffectParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.2500000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.4000000,OutVal=-0.3000000),(InVal=0.5000000,OutVal=0.4000000),(InVal=0.7000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=-0.1000000),(InVal=0.4500000,OutVal=-0.2500000),(InVal=0.6500000,OutVal=0.5000000),(InVal=0.8000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=0.3000000)))
	YawFactor=0.5000000
	XRandFactor=0.0240000
	YRandFactor=0.0240000
	MaxRecoil=3000.0000000
	ViewBindFactor=0.7500000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1000,Max=2000)
	CrouchMultiplier=0.5000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	MagAmmo=600
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="2400 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.XMV500WeaponParamsClassic.ClassicSecondaryFireParams'
end object
