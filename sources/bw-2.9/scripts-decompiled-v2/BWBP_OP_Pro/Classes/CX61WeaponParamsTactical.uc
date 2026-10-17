class CX61WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		SightMoveSpeedFactor=0.6000000
		WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireHealParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalParams_Spike'
	begin object name="TacticalParams_Spike" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Cryon Spikes"
		SightMoveSpeedFactor=0.6000000
		MagAmmo=16
		WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams_Spike'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireHealParams'
	end object
	Layouts[1]=TacticalParams_Spike
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Blue'
	begin object name="CX61_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=CX61_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Red'
	begin object name="CX61_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainRedShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=CX61_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_White'
	begin object name="CX61_White" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainWhiteShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=CX61_White
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Hex'
	begin object name="CX61_Hex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainHexShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=CX61_Hex
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Stripes'
	begin object name="CX61_Stripes" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="Limited"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainStripesShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=CX61_Stripes
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Meat'
	begin object name="CX61_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="MEAT"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainMeat",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
		Index=5
	end object
	Camos[5]=CX61_Meat
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Gold'
	begin object name="CX61_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainGold",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=CX61_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoopStart',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AmmoPerFire=0
	TargetState="Flamer"
	FireAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireHealParams'
begin object name="TacticalSecondaryFireHealParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AmmoPerFire=0
	TargetState="HealGas"
	FireAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.0300000),(InVal=0.4000000,OutVal=0.1100000),(InVal=0.5000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=-0.0200000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.1900000),(InVal=0.4000000,OutVal=0.3600000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1350000
	EscapeMultiplier=1.5000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_CX61Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_CX61Chest'
	PenetrationEnergy=32.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireAnim="SightFire"
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryEffectParams_Spike'
begin object name="TacticalPrimaryEffectParams_Spike" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=4725.0000000)
	RangeAtten=0.3500000
	Damage=55
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_CX61Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_CX61Chest'
	PenetrationEnergy=64.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX61.CX61-FireHeavy',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.4000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.2000000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams_Spike'
begin object name="TacticalPrimaryFireParams_Spike" class=BCoreProV55.FireParams
	FireInterval=0.3750000
	BurstFireRateFactor=0.4000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryEffectParams_Spike'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	SightMoveSpeedFactor=0.6000000
	WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireHealParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalParams_Spike'
begin object name="TacticalParams_Spike" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Cryon Spikes"
	SightMoveSpeedFactor=0.6000000
	MagAmmo=16
	WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalPrimaryFireParams_Spike'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsTactical.TacticalSecondaryFireHealParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Blue'
begin object name="CX61_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Red'
begin object name="CX61_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainRedShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_White'
begin object name="CX61_White" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainWhiteShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Hex'
begin object name="CX61_Hex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainHexShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Stripes'
begin object name="CX61_Stripes" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="Limited"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainStripesShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Meat'
begin object name="CX61_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MEAT"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainMeat",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsTactical.CX61_Gold'
begin object name="CX61_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainGold",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=6
end object
