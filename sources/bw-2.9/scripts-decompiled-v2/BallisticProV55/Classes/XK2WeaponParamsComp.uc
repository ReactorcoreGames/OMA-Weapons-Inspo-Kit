class XK2WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressed"
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		DisplaceDurationMult=0.7500000
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsComp.ArenaParams_RDS'
	begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="RDS"
		LayoutTags="no_muzzle"
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		DisplaceDurationMult=0.7500000
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_RDS
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Black'
	begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XK2_Black
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Jungle'
	begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XK2_Jungle
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Desert'
	begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=XK2_Desert
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Winter'
	begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=XK2_Winter
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Silver'
	begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=XK2_Silver
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Pink'
	begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=XK2_Pink
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Gold'
	begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=XK2_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.XK2WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=378)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.XK2WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=-0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.4500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceFireParams'
begin object name="ArenaPrimaryIceFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=20
	DamageType=Class'BallisticProV55.DTXK2SMG'
	DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Fire',Volume=0.5000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=150.0000000
	Chaos=0.0250000
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceEffectParams'
begin object name="ArenaPrimaryIceEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=22
	DamageType=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeHead=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeArm=Class'BallisticProV55.DTXK2Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Impact',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=190.0000000
	Chaos=0.0500000
	Inaccuracy=(X=96,Y=96)
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Attach AMP"
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressed"
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	DisplaceDurationMult=0.7500000
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsComp.ArenaParams_RDS'
begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="RDS"
	LayoutTags="no_muzzle"
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	DisplaceDurationMult=0.7500000
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaPrimaryIceFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Black'
begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Jungle'
begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Desert'
begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Winter'
begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Silver'
begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Pink'
begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsComp.XK2_Gold'
begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
