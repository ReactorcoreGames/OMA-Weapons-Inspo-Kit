class SX45WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_RDS'
	begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="RDS"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1300000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
		WeaponName="SX-45 .45 Tech Pistol"
		MagAmmo=15
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_Irons'
	begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Iron Sights"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1300000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
		WeaponName="SX-45 .45 Tech Pistol"
		MagAmmo=15
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Irons
	// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_amp"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.1300000
		SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
		WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
		WeaponName="SX-45 .45 Pistol (Sil)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
		MagAmmo=15
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Supp
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Green'
	begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Olive Drab"
	end object
	Camos[0]=FNX_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Black'
	begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=FNX_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Desert'
	begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=FNX_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Ruby'
	begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ruby"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=FNX_Ruby
	// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Gold'
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
// Reference: RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.5500000
	YawFactor=0.1000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=1670.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=1100)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8200000
	ADSMultiplier=0.7700000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1200
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryFireParams'
begin object name="RealisticCryoPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryFireParams'
begin object name="RealisticRadPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SRXWeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	Damage=40
	HeadMult=2.3500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrationEnergy=9.0000000
	PenetrateForce=30
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyFire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=800.0000000
	Chaos=0.1000000
	Inaccuracy=(X=18,Y=18)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
begin object name="RealisticPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=5000.0000000
	DecayRange=(Min=800.0000000,Max=4000.0000000)
	Damage=40
	HeadMult=2.3000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol'
	PenetrationEnergy=9.0000000
	PenetrateForce=30
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-FireSupp',Volume=2.3000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=700.0000000
	Chaos=0.1500000
	Inaccuracy=(X=18,Y=18)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
begin object name="RealisticPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryEffectParams_Supp'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryEffectParams'
begin object name="RealisticCryoPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	RangeAtten=0.3000000
	Damage=70
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_Cryo'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_Cryo'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyFrostFire',Volume=2.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=700.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryEffectParams'
begin object name="RealisticRadPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4000.0000000,Max=4000.0000000)
	RangeAtten=0.3000000
	Damage=55
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSX45PistolHead_RAD'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSX45Pistol_RAD'
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45RadMuzzleFlash'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SX45.SX45-HeavyRadFire',Volume=2.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=700.0000000
	Chaos=0.2500000
	BotRefireRate=0.7500000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_RDS'
begin object name="RealisticParams_RDS" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="RDS"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1300000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
	WeaponName="SX-45 .45 Tech Pistol"
	MagAmmo=15
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_Irons'
begin object name="RealisticParams_Irons" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Iron Sights"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1300000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
	WeaponName="SX-45 .45 Tech Pistol"
	MagAmmo=15
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticCryoPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRadPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_amp"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.1300000
	SightOffset=(X=-15.0000000,Y=0.0000000,Z=2.3000000)
	WeaponMaterialSwaps[0]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-6.0000000)
	WeaponName="SX-45 .45 Pistol (Sil)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorOsprey',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-2.0000000,Y=0.2000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=16384))
	MagAmmo=15
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SX45WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Green'
begin object name="FNX_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Olive Drab"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Black'
begin object name="FNX_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainBlack",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Desert'
begin object name="FNX_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainTan",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Ruby'
begin object name="FNX_Ruby" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ruby"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainRedShine",Index=4,pIndex=3,AIndex=3)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SX45WeaponParamsRealistic.FNX_Gold'
begin object name="FNX_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SX45Camos.SX45-MainGoldShine",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
