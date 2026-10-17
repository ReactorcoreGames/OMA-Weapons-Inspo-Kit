class M353WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M353WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		LayoutName="Default"
		PlayerSpeedFactor=0.8750000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		WeaponName="M353 5.56mm Squad Machinegun"
		MagAmmo=150
		RecoilParams[0]=RecoilParams'BallisticProV55.M353WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M353WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Gray'
	begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M353_Gray
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Jungle'
	begin object name="M353_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S2",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S2",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S2",Index=3,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=M353_Jungle
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Arctic'
	begin object name="M353_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S1",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S1",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S1",Index=3,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=M353_Arctic
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Ocean'
	begin object name="M353_Ocean" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S3",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S3",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S3",Index=3,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=M353_Ocean
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Gold'
	begin object name="M353_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S4",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S4",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S4",Index=3,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=M353_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.M353WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1600.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	Damage=45
	HeadMult=2.2500000
	LimbMult=0.6500000
	DamageType=Class'BallisticProV55.DTM353MG'
	DamageTypeHead=Class'BallisticProV55.DTM353MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM353MG'
	PenetrationEnergy=18.0000000
	PenetrateForce=55
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.8500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Fire1',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=384.0000000
	Chaos=0.0800000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M353WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.M353WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M353WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M353WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	PitchFactor=0.5000000
	YawFactor=0.3000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=2560.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.1350000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M353WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=3072)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=2000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=400
end object
// Reference: WeaponParams'BallisticProV55.M353WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	LayoutName="Default"
	PlayerSpeedFactor=0.8750000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	WeaponName="M353 5.56mm Squad Machinegun"
	MagAmmo=150
	RecoilParams[0]=RecoilParams'BallisticProV55.M353WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M353WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M353WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Gray'
begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Jungle'
begin object name="M353_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S2",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S2",Index=3,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Arctic'
begin object name="M353_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S1",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S1",Index=3,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Ocean'
begin object name="M353_Ocean" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S3",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S3",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S3",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsRealistic.M353_Gold'
begin object name="M353_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S4",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S4",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S4",Index=3,pIndex=2,AIndex=2)
	Index=4
end object
