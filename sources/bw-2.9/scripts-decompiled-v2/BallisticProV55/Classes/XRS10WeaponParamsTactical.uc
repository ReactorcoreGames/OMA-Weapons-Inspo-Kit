class XRS10WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		DisplaceDurationMult=0.5000000
		MagAmmo=25
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalPriFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalSecFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Silver'
	begin object name="XRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=XRS_Silver
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Black'
	begin object name="XRS_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainBlack",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XRS_Black
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Desert'
	begin object name="XRS_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-SuppDesert",Index=3,pIndex=5,AIndex=2)
		Index=2
	end object
	Camos[2]=XRS_Desert
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Purple'
	begin object name="XRS_Purple" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Purple"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainPurple",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=XRS_Purple
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_CandyCane'
	begin object name="XRS_CandyCane" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Candy Cane"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Main-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Sil-Shine",Index=3,pIndex=5,AIndex=2)
		Index=4
	end object
	Camos[4]=XRS_CandyCane
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_GoldTiger'
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
	// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Gold'
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
// Reference: InstantEffectParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalPriEffectParams'
begin object name="TacticalPriEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=25
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTXRS10SMG'
	DamageTypeHead=Class'BallisticProV55.DTXRS10SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXRS10SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-Fire',Volume=0.9000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=220.0000000
	Inaccuracy=(X=128,Y=128)
end object
// Reference: FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalPriFireParams'
begin object name="TacticalPriFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	BurstFireRateFactor=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalPriEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalSecEffectParams'
begin object name="TacticalSecEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Laser sight"
end object
// Reference: FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalSecFireParams'
begin object name="TacticalSecFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalSecEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.0700000),(InVal=0.5500000,OutVal=0.0900000),(InVal=0.8000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.5500000),(InVal=0.8000000,OutVal=0.8500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=6144.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	DisplaceDurationMult=0.5000000
	MagAmmo=25
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalPriFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XRS10WeaponParamsTactical.TacticalSecFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Silver'
begin object name="XRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Black'
begin object name="XRS_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainBlack",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Desert'
begin object name="XRS_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-SuppDesert",Index=3,pIndex=5,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Purple'
begin object name="XRS_Purple" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Purple"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainPurple",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_CandyCane'
begin object name="XRS_CandyCane" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Candy Cane"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10RS-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_GoldTiger'
begin object name="XRS_GoldTiger" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.XRS10WeaponParamsTactical.XRS_Gold'
begin object name="XRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-LAM-Shine",Index=2,pIndex=3,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XRS10Camos.XRS10Gold-Sil-Shine",Index=3,pIndex=5,AIndex=2)
	Index=6
end object
