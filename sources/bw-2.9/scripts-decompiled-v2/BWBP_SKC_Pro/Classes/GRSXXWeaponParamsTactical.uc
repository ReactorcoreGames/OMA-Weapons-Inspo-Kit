class GRSXXWeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Hyper Amp"
		LayoutTags="no_starting_amp,no_combat_laser"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=33
		bDualBlocked=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Amp: Hypermode",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryAmpFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalParams_Laser'
	begin object name="TacticalParams_Laser" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Superlaser"
		LayoutTags="no_amp"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=33
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Laser
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Gold'
	begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
		Weight=60
		CamoName="Gold"
	end object
	Camos[0]=Glock_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Black'
	begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Glock_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Brown'
	begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Brown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Glock_Brown
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Green'
	begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Glock_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Silver'
	begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Glock_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_UTC'
	begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=Glock_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Butter'
	begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Butter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=Glock_Butter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
begin object name="TacticalSecondaryFireParams_Amp" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="AmpAttach"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryEffectParams_Amp'
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0550000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.7000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0900000),(InVal=0.3000000,OutVal=-0.0800000),(InVal=0.4000000,OutVal=0.0400000),(InVal=0.5500000,OutVal=-0.0900000),(InVal=0.7000000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4500000,OutVal=0.4500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1500000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	SprintChaos=0.0500000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=23
	HeadMult=3.5000000
	DamageType=Class'BallisticProV55.DTGRS9Pistol'
	DamageTypeHead=Class'BallisticProV55.DTGRS9PistolHead'
	DamageTypeArm=Class'BallisticProV55.DTGRS9Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Glock.Glk-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=270.0000000
	Chaos=0.1200000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryAmpEffectParams'
begin object name="TacticalPrimaryAmpEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=1337.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=43
	HeadMult=3.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=340.0000000
	Chaos=0.1800000
	Inaccuracy=(X=100,Y=100)
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryAmpFireParams'
begin object name="TacticalPrimaryAmpFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5500000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryAmpEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	RangeAtten=0.5000000
	Damage=16
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXLaserHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	PenetrateForce=300
	bPenetrate=true
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryEffectParams_Amp'
begin object name="TacticalSecondaryEffectParams_Amp" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Hyper Amp"
	LayoutTags="no_starting_amp,no_combat_laser"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=33
	bDualBlocked=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Amp: Hypermode",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryAmpFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams_Amp'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalParams_Laser'
begin object name="TacticalParams_Laser" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Superlaser"
	LayoutTags="no_amp"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=33
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Gold'
begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
	Weight=60
	CamoName="Gold"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Black'
begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Brown'
begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Brown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Green'
begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Silver'
begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_UTC'
begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsTactical.Glock_Butter'
begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Butter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
