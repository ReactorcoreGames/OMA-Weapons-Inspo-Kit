class PS9mWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Poison Auto"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		DisplaceDurationMult=0.5000000
		MagAmmo=10
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalParams_Tox'
	begin object name="TacticalParams_Tox" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Neurotoxin"
		LayoutTags="tox"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1500000
		DisplaceDurationMult=0.5000000
		MagAmmo=10
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams_Tox'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Tox
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Gray'
	begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Black'
	begin object name="PS_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=PS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Jungle'
	begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=PS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_RedTiger'
	begin object name="PS_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ember"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Tiger",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=PS_RedTiger
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1200000),(InVal=0.0000000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4500000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	FireAnim="DartFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=3000.0000000)
	Damage=10
	HeadMult=4.0000000
	LimbMult=1.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Fire',Volume=1.0000000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0500000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	FireEndAnim="None"
	FireAnimRate=3.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryEffectParams_Tox'
begin object name="TacticalPrimaryEffectParams_Tox" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=3000.0000000)
	Damage=10
	HeadMult=4.0000000
	LimbMult=1.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-FireAlt',Volume=1.4000000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0500000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams_Tox'
begin object name="TacticalPrimaryFireParams_Tox" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryEffectParams_Tox'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PS9mMedDart'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6500.0000000
	Damage=20.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-DartFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Poison Auto"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	DisplaceDurationMult=0.5000000
	MagAmmo=10
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalParams_Tox'
begin object name="TacticalParams_Tox" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Neurotoxin"
	LayoutTags="tox"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1500000
	DisplaceDurationMult=0.5000000
	MagAmmo=10
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalPrimaryFireParams_Tox'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Gray'
begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Black'
begin object name="PS_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_Jungle'
begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsTactical.PS_RedTiger'
begin object name="PS_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ember"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Tiger",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
