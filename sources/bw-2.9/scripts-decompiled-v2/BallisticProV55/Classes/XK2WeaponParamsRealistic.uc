class XK2WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressed"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
		SightPivot=(Pitch=40,Yaw=0,Roll=0)
		WeaponName="XK2-SD 9mm Submachinegun"
		MagAmmo=40
		bMagPlusOne=true
		bDualBlocked=true
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="RDS"
		LayoutTags="no_muzzle"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1800000
		SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		WeaponName="XK2 9mm Submachinegun"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=40
		bMagPlusOne=true
		bDualBlocked=true
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_RDS
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Black'
	begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XK2_Black
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Jungle'
	begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XK2_Jungle
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Desert'
	begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=XK2_Desert
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Winter'
	begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=XK2_Winter
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Silver'
	begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=XK2_Silver
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Pink'
	begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=XK2_Pink
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Gold'
	begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=XK2_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0670000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3536,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6500000
	ChaosSpeedThreshold=600
	ChaosTurnThreshold=140000
end object
// Reference: RecoilParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.5500000,OutVal=0.2000000),(InVal=0.8000000,OutVal=-0.1000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.5000000
	YawFactor=0.3000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2560.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.1500000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceFireParams'
begin object name="RealisticPrimaryIceFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1200.0000000,Max=4800.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.1000000
	Damage=30
	HeadMult=2.6000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXK2SMG'
	DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
	PenetrationEnergy=11.0000000
	PenetrateForce=15
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.2500000,bAtten=false,bNoOverride=true)
	Recoil=520.0000000
	Inaccuracy=(X=10,Y=10)
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceEffectParams'
begin object name="RealisticPrimaryIceEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	RangeAtten=0.2000000
	Damage=14
	HeadMult=1.4000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeHead=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeArm=Class'BallisticProV55.DTXK2Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Impact',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=98.0000000
	Chaos=0.0500000
	Inaccuracy=(X=96,Y=96)
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Attach AMP"
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressed"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
	SightPivot=(Pitch=40,Yaw=0,Roll=0)
	WeaponName="XK2-SD 9mm Submachinegun"
	MagAmmo=40
	bMagPlusOne=true
	bDualBlocked=true
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="RDS"
	LayoutTags="no_muzzle"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1800000
	SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	WeaponName="XK2 9mm Submachinegun"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=40
	bMagPlusOne=true
	bDualBlocked=true
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=4.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticPrimaryIceFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Black'
begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Jungle'
begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Desert'
begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Winter'
begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Silver'
begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Pink'
begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsRealistic.XK2_Gold'
begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
