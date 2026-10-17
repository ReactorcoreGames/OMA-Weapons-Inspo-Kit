class PS9mWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Poison Auto"
		InventorySize=1
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=10
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaParams_Tox'
	begin object name="ArenaParams_Tox" class=BCoreProV55.WeaponParams
		Weight=2
		LayoutName="Neurotoxin"
		LayoutTags="tox"
		InventorySize=1
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=10
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Tox
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Gray'
	begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PS_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Black'
	begin object name="PS_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=PS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Jungle'
	begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=PS_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_RedTiger'
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
// Reference: AimParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=128)
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.1200000),(InVal=0.0000000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4500000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	ViewBindFactor=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	FireAnim="DartFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	FireEndAnim="None"
	FireAnimRate=3.0000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3000.0000000,Max=5000.0000000)
	Damage=12
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.3000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Fire',Volume=0.2500000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	Chaos=0.0500000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.PS9mMedDart'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=6500.0000000
	Damage=20.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-DartFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Poison Auto"
	InventorySize=1
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=10
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaParams_Tox'
begin object name="ArenaParams_Tox" class=BCoreProV55.WeaponParams
	Weight=2
	LayoutName="Neurotoxin"
	LayoutTags="tox"
	InventorySize=1
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=10
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.PS9mWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Gray'
begin object name="PS_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Black'
begin object name="PS_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Black",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_Jungle'
begin object name="PS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-TigerGreen",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.PS9mWeaponParamsComp.PS_RedTiger'
begin object name="PS_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ember"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.StealthCamos.Stealth-Tiger",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
