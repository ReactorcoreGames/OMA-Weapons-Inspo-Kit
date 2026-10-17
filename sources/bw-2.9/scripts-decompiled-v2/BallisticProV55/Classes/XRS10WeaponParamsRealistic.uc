class XRS10WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=4
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1500000
		SightPivot=(Pitch=32,Yaw=0,Roll=0)
		WeaponName="XRS-10 .45 Automatic"
		MagAmmo=25
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Silver'
	begin object name="XRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=XRS_Silver
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Black'
	begin object name="XRS_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainBlack",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XRS_Black
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Desert'
	begin object name="XRS_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-SuppDesert",Index=3,pIndex=5,AIndex=2)
		Index=2
	end object
	Camos[2]=XRS_Desert
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Purple'
	begin object name="XRS_Purple" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Purple"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainPurple",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=XRS_Purple
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_CandyCane'
	begin object name="XRS_CandyCane" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Candy Cane"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Main-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Sil-Shine",Index=3,pIndex=5,AIndex=2)
		Index=4
	end object
	Camos[4]=XRS_CandyCane
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_GoldTiger'
	begin object name="XRS_GoldTiger" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
		Index=5
	end object
	Camos[5]=XRS_GoldTiger
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Gold'
	begin object name="XRS_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainGold",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
		Index=6
	end object
	Camos[6]=XRS_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=800.0000000,Max=4000.0000000)
	WaterTraceRange=2000.0000000
	Damage=44
	HeadMult=2.3181810
	LimbMult=0.5681810
	DamageType=Class'BallisticProV55.DTXRS10SMG'
	DamageTypeHead=Class'BallisticProV55.DTXRS10SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXRS10SMG'
	PenetrationEnergy=9.0000000
	PenetrateForce=35
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=700.0000000
	Chaos=0.1000000
	Inaccuracy=(X=48,Y=48)
end object
// Reference: FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.8000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.2000000),(InVal=0.7000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	PitchFactor=0.8000000
	YawFactor=0.3000000
	XRandFactor=0.1900000
	YRandFactor=0.1900000
	MaxRecoil=2560.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1450000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1200)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=650
	ChaosTurnThreshold=160000
end object
// Reference: WeaponParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=4
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1500000
	SightPivot=(Pitch=32,Yaw=0,Roll=0)
	WeaponName="XRS-10 .45 Automatic"
	MagAmmo=25
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Silver'
begin object name="XRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Black'
begin object name="XRS_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainBlack",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Desert'
begin object name="XRS_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-SuppDesert",Index=3,pIndex=5,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Purple'
begin object name="XRS_Purple" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Purple"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainPurple",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_CandyCane'
begin object name="XRS_CandyCane" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Candy Cane"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_GoldTiger'
begin object name="XRS_GoldTiger" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsRealistic.XRS_Gold'
begin object name="XRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=6
end object
