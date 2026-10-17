class XMV850WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Default"
		PlayerSpeedFactor=0.7000000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightPivot=(Pitch=700,Yaw=0,Roll=2048)
		WeaponName="XMV-858 5.56mm Minigun"
		MagAmmo=900
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Teal'
	begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Teal"
	end object
	Camos[0]=XMV_Teal
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Green'
	begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
		Index=1
	end object
	Camos[1]=XMV_Green
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Black'
	begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=2)
		Index=2
	end object
	Camos[2]=XMV_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=45
	HeadMult=2.2666660
	LimbMult=0.6666660
	DamageType=Class'BallisticProV55.DTXMV850MG'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MG'
	PenetrationEnergy=18.0000000
	PenetrateForce=65
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Fire-1',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-0.0100000
	Inaccuracy=(X=9,Y=9)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=-0.2000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.4500000),(InVal=0.7000000,OutVal=0.5000000),(InVal=0.8500000,OutVal=0.6500000),(InVal=1.0000000,OutVal=0.7000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.0500000),(InVal=0.4750000,OutVal=0.2500000),(InVal=0.5750000,OutVal=0.5000000),(InVal=0.6750000,OutVal=0.4000000),(InVal=0.8250000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.3500000)))
	PitchFactor=0.4500000
	YawFactor=0.4500000
	XRandFactor=0.1250000
	YRandFactor=0.1250000
	MaxRecoil=4800.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.7500000
	ADSViewBindFactor=0.7500000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1536,Max=3584)
	AimAdjustTime=0.6000000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.9000000
	SprintOffset=(Pitch=-3000,Yaw=-7000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=375
	ChaosDeclineTime=1.6500000
	ChaosSpeedThreshold=350
end object
// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Default"
	PlayerSpeedFactor=0.7000000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightPivot=(Pitch=700,Yaw=0,Roll=2048)
	WeaponName="XMV-858 5.56mm Minigun"
	MagAmmo=900
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Teal'
begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Teal"
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Green'
begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsRealistic.XMV_Black'
begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=2
end object
