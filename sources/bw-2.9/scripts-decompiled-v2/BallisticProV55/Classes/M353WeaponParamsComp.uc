class M353WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M353WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		LayoutName="Default"
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.4500000
		DisplaceDurationMult=1.2500000
		MagAmmo=100
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M353WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M353WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M353WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M353WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Gray'
	begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M353_Gray
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Jungle'
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
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Arctic'
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
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Ocean'
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
	// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Gold'
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
// Reference: InstantEffectParams'BallisticProV55.M353WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BallisticProV55.DTM353MG'
	DamageTypeHead=Class'BallisticProV55.DTM353MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM353MG'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Fire1',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=110.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M353WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=0.6600000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M353WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.M353WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.M353WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M353WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M353WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1800000,OutVal=-0.0200000),(InVal=0.3000000,OutVal=0.0400000),(InVal=0.5000000,OutVal=0.0300000),(InVal=0.6500000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0200000),(InVal=0.8500000,OutVal=0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=12288.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.M353WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=3000,Roll=0)
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M353WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	LayoutName="Default"
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.4500000
	DisplaceDurationMult=1.2500000
	MagAmmo=100
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M353WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M353WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M353WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M353WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Gray'
begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Jungle'
begin object name="M353_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S2",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S2",Index=3,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Arctic'
begin object name="M353_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S1",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S1",Index=3,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Ocean'
begin object name="M353_Ocean" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S3",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S3",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S3",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M353WeaponParamsComp.M353_Gold'
begin object name="M353_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S4",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S4",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S4",Index=3,pIndex=2,AIndex=2)
	Index=4
end object
