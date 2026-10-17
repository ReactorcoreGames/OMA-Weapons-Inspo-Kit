class XMK5WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dart + RDS"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightOffset=(X=1.0000000,Y=0.0100000,Z=1.8000000)
		WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=1.0000000)
		WeaponName="XMk5 10mm Urban Submachinegun"
		MagAmmo=35
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=15
		LayoutName="Suppressed"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightOffset=(X=1.0000000,Y=0.0100000,Z=-0.6000000)
		WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=0.0000000)
		WeaponName="XMk5 10mm Urban Submachinegun (Sil)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="Muzzle",Scale=0.0250000,AugmentOffset=(X=-60.0000000,Y=-0.3000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		MagAmmo=35
		bMagPlusOne=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Supp
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Tan'
	begin object name="XMK5_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brown"
	end object
	Camos[0]=XMK5_Tan
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Desert'
	begin object name="XMK5_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainDesert",Index=1,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=XMK5_Desert
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Jungle'
	begin object name="XMK5_Jungle" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainJungle",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=XMK5_Jungle
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Red'
	begin object name="XMK5_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGMain",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=XMK5_Red
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Blast'
	begin object name="XMK5_Blast" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blast"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainOrk",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterOrk",Index=4,pIndex=3,AIndex=3)
		Index=4
	end object
	Camos[4]=XMK5_Blast
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Gold'
	begin object name="XMK5_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainGold",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MagDark",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterDark",Index=4,pIndex=3,AIndex=3)
		Index=5
	end object
	Camos[5]=XMK5_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1200)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3536,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.7500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=575
	ChaosTurnThreshold=185000
end object
// Reference: RecoilParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.5500000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.5000000
	YawFactor=0.2000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.1600000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=900.0000000,Max=4500.0000000)
	RangeAtten=0.1000000
	Damage=37
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXMK5SubMachinegun'
	DamageTypeHead=Class'BallisticProV55.DTXMK5SubMachinegunHead'
	DamageTypeArm=Class'BallisticProV55.DTXMK5SubMachinegun'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_Fire1',Volume=1.3500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=640.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=10,Y=10)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=900.0000000,Max=4500.0000000)
	RangeAtten=0.1000000
	Damage=37
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXMK5SubMachinegun'
	DamageTypeHead=Class'BallisticProV55.DTXMK5SubMachinegunHead'
	DamageTypeArm=Class'BallisticProV55.DTXMK5SubMachinegun'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-SilenceFire',Volume=0.5000000,Radius=128.0000000,Slot=0,Pitch=0.8000000,bAtten=true,bNoOverride=true)
	Recoil=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: ProjectileEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.XMK5Dart'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	Damage=10.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	PreFireAnim="None"
	FireAnim="Fire2"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dart + RDS"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightOffset=(X=1.0000000,Y=0.0100000,Z=1.8000000)
	WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=1.0000000)
	WeaponName="XMk5 10mm Urban Submachinegun"
	MagAmmo=35
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=15
	LayoutName="Suppressed"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightOffset=(X=1.0000000,Y=0.0100000,Z=-0.6000000)
	WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=0.0000000)
	WeaponName="XMk5 10mm Urban Submachinegun (Sil)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="Muzzle",Scale=0.0250000,AugmentOffset=(X=-60.0000000,Y=-0.3000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	MagAmmo=35
	bMagPlusOne=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Tan'
begin object name="XMK5_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brown"
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Desert'
begin object name="XMK5_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainDesert",Index=1,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Jungle'
begin object name="XMK5_Jungle" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainJungle",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Red'
begin object name="XMK5_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGMain",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Blast'
begin object name="XMK5_Blast" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blast"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainOrk",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterOrk",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsRealistic.XMK5_Gold'
begin object name="XMK5_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainGold",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MagDark",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterDark",Index=4,pIndex=3,AIndex=3)
	Index=5
end object
