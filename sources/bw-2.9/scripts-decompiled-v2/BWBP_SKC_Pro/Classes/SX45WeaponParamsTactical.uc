class SX45WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalParams_IRONS'
	begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		InventorySize=3
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalCryoPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRadPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams_IRONS
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalParams_Supp'
	begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_amp"
		InventorySize=3
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.1700000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[1]=TacticalParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Green'
	begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=FNX_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Black'
	begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=FNX_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Desert'
	begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=FNX_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Ruby'
	begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ruby"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=FNX_Ruby
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Gold'
	begin object name="FNX_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainGoldShine",Index=4,pIndex=3,AIndex=3)
		Index=4
	end object
	Camos[4]=FNX_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.4000000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryEffectParams'
begin object name="TacticalStandardPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=32
	HeadMult=3.5000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.2500000
	Inaccuracy=(X=100,Y=100)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams'
begin object name="TacticalStandardPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryEffectParams_Supp'
begin object name="TacticalStandardPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=32
	HeadMult=3.5000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-FireSupp',Volume=2.3000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=400.0000000
	Chaos=0.3000000
	Inaccuracy=(X=90,Y=90)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams_Supp'
begin object name="TacticalStandardPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalCryoPrimaryEffectParams'
begin object name="TacticalCryoPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=40
	HeadMult=3.0000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_Cryo'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=0.0600000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyFrostFire',Volume=2.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalCryoPrimaryFireParams'
begin object name="TacticalCryoPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1750000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalCryoPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRadPrimaryEffectParams'
begin object name="TacticalRadPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.5000000
	Damage=34
	HeadMult=1.0000000
	LimbMult=1.0000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_RAD'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45RadMuzzleFlash'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyRadFire',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRadPrimaryFireParams'
begin object name="TacticalRadPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1750000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRadPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalParams_IRONS'
begin object name="TacticalParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	InventorySize=3
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalCryoPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRadPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalParams_Supp'
begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_amp"
	InventorySize=3
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.1700000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalStandardPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Green'
begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Black'
begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Desert'
begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Ruby'
begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ruby"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsTactical.FNX_Gold'
begin object name="FNX_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainGoldShine",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
