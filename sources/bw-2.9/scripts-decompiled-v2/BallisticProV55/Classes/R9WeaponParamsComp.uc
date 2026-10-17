class R9WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.R9WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=50,Yaw=0,Roll=0)
		MagAmmo=12
		RecoilParams[0]=RecoilParams'BallisticProV55.R9WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.R9WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaFreezeFireParams'
		FireParams[2]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaHeatFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_OrangeShine'
	begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Fresh Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
	end object
	Camos[0]=R9_OrangeShine
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_IceFire'
	begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fire & Ice"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_OP_Tex.R9A1.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=R9_IceFire
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Jungle'
	begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=R9_Jungle
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Orange'
	begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		Index=3
	end object
	Camos[3]=R9_Orange
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Gray'
	begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=R9_Gray
	// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Winter'
	begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=R9_Winter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=56
	DamageType=Class'BallisticProV55.DTR9Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR9RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR9Rifle'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.4500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaFreezeEffectParams'
begin object name="ArenaFreezeEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=50
	DamageType=Class'BallisticProV55.DTR9Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR9RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR9Rifle'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.4500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsComp.ArenaFreezeFireParams'
begin object name="ArenaFreezeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaFreezeEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaHeatEffectParams'
begin object name="ArenaHeatEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.7500000
	Damage=42
	DamageType=Class'BallisticProV55.DTR9Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR9RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR9Rifle'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.4500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsComp.ArenaHeatFireParams'
begin object name="ArenaHeatFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaHeatEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.R9WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.R9WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.R9WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.2500000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.3500000),(InVal=0.8500000,OutVal=0.4200000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1750000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.7500000
	DeclineDelay=0.3500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BallisticProV55.R9WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.R9WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=50,Yaw=0,Roll=0)
	MagAmmo=12
	RecoilParams[0]=RecoilParams'BallisticProV55.R9WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.R9WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaFreezeFireParams'
	FireParams[2]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaHeatFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.R9WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_OrangeShine'
begin object name="R9_OrangeShine" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Fresh Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH2",Index=1,pIndex=0,AIndex=0)
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_IceFire'
begin object name="R9_IceFire" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fire & Ice"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_OP_Tex.R9A1.R9_body_SH1",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Jungle'
begin object name="R9_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH3",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Orange'
begin object name="R9_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Gray'
begin object name="R9_Gray" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH4",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.R9WeaponParamsComp.R9_Winter'
begin object name="R9_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.R9Camos.R9_body_SH5",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
