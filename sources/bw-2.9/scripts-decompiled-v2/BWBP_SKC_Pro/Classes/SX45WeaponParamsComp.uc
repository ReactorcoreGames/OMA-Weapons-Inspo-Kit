class SX45WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaParams_IRONS'
	begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		InventorySize=3
		SightingTime=0.2000000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaCryoPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRadPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams_IRONS
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_amp"
		InventorySize=3
		SightingTime=0.2000000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		DisplaceDurationMult=0.3300000
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Green'
	begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=FNX_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Black'
	begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=FNX_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Desert'
	begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=FNX_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Ruby'
	begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ruby"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=FNX_Ruby
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Gold'
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
// Reference: RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.6000000
end object
// Reference: AimParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimAdjustTime=0.4500000
	ChaosDeclineTime=0.4500000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryEffectParams'
begin object name="ArenaStandardPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.SX45.SX45-Fire',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams'
begin object name="ArenaStandardPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryEffectParams_Supp'
begin object name="ArenaStandardPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-FireSupp',Volume=2.3000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=200.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams_Supp'
begin object name="ArenaStandardPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaCryoPrimaryEffectParams'
begin object name="ArenaCryoPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_Cryo'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=0.0600000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-FrostFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaCryoPrimaryFireParams'
begin object name="ArenaCryoPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2750000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaCryoPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRadPrimaryEffectParams'
begin object name="ArenaRadPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.6700000
	Damage=26
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_RAD'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45RadMuzzleFlash'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-RadFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRadPrimaryFireParams'
begin object name="ArenaRadPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2750000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRadPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaParams_IRONS'
begin object name="ArenaParams_IRONS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	InventorySize=3
	SightingTime=0.2000000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaCryoPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRadPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_amp"
	InventorySize=3
	SightingTime=0.2000000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	DisplaceDurationMult=0.3300000
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaStandardPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Green'
begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Black'
begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Desert'
begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Ruby'
begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ruby"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsComp.FNX_Gold'
begin object name="FNX_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainGoldShine",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
