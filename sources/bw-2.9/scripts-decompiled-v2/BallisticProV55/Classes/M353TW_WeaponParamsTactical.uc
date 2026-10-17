class M353TW_WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 1.0000000;
	BWA.ModeInfos[0].TracerMix = 4;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4500000
		MagAmmo=100
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Gray'
	begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M353_Gray
	// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Jungle'
	begin object name="M353_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S2",Index=2,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S2",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S2",Index=3,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=M353_Jungle
	// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Arctic'
	begin object name="M353_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S1",Index=2,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S1",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S1",Index=3,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=M353_Arctic
	// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Ocean'
	begin object name="M353_Ocean" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S3",Index=2,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S3",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S3",Index=3,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=M353_Ocean
	// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Gold'
	begin object name="M353_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S4",Index=2,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S4",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S4",Index=3,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=M353_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTM353MGDeploy'
	DamageTypeHead=Class'BallisticProV55.DTM353MGDeployHead'
	DamageTypeArm=Class'BallisticProV55.DTM353MGDeploy'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M353FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M353.M353-Fire1',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=0.6600000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0700000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0850000),(InVal=0.1800000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.6500000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4500000),(InVal=0.8500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0300000
	YRandFactor=0.0300000
	MaxRecoil=12288.0000000
	DeclineTime=1.5000000
	DeclineDelay=0.1300000
end object
// Reference: AimParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	ViewBindFactor=1.0000000
	AimDamageThreshold=2000
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4500000
	MagAmmo=100
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=true,ModeID="WM_Burst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Five",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M353TW_WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Gray'
begin object name="M353_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Jungle'
begin object name="M353_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S2",Index=2,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S2",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S2",Index=3,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Arctic'
begin object name="M353_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S1",Index=2,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S1",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S1",Index=3,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Ocean'
begin object name="M353_Ocean" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S3",Index=2,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S3",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S3",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M353TW_WeaponParamsTactical.M353_Gold'
begin object name="M353_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD2_S4",Index=2,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_SD1_S4",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M353Camos.M353_Ammo_S4",Index=3,pIndex=2,AIndex=2)
	Index=4
end object
