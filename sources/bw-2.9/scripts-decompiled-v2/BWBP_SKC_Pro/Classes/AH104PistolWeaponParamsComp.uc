class AH104PistolWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		PlayerSpeedFactor=0.9500000
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightOffset=(X=-11.5000000,Y=0.0000000,Z=2.0300000)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=0.0000000)
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaParams_Holo'
	begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Holosight"
		PlayerSpeedFactor=0.9500000
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightOffset=(X=-29.5000000,Y=-0.0200000,Z=5.0500000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel_Main1_Tex',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel-MainSpec',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=1.0000000)
		MagAmmo=9
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Black'
	begin object name="AH_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AH_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Red'
	begin object name="AH_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainRed",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=AH_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Green'
	begin object name="AH_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=AH_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Tiger'
	begin object name="AH_Tiger" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Tiger"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainTiger",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=AH_Tiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Meat'
	begin object name="AH_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainMeat",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=AH_Meat
	// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Gold'
	begin object name="AH_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGoldShine",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=AH_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.0800000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=0.1700000),(InVal=0.7000000,OutVal=0.2400000),(InVal=0.8000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.7500000,OutVal=0.7700000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	MaxRecoil=8192.0000000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=40,Max=1024)
	AimAdjustTime=0.6000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.3000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=1250
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=1536.0000000,Max=2560.0000000)
	RangeAtten=0.5000000
	Damage=100
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AH104PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AH104Pistol'
	PenetrationEnergy=64.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=0.9000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Super',Volume=7.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.2000000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=15.0000000
	DamageRadius=192.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-FlameLoopStart',Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=0.0100000
	Chaos=0.0500000
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	PlayerSpeedFactor=0.9500000
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightOffset=(X=-11.5000000,Y=0.0000000,Z=2.0300000)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=0.0000000)
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaParams_Holo'
begin object name="ArenaParams_Holo" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Holosight"
	PlayerSpeedFactor=0.9500000
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightOffset=(X=-29.5000000,Y=-0.0200000,Z=5.0500000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel_Main1_Tex',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_SKC_Tex.TechSawnOff.DoubleBarrel-MainSpec',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=50,Scale=1.0000000)
	MagAmmo=9
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Black'
begin object name="AH_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Red'
begin object name="AH_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainRed",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Green'
begin object name="AH_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Tiger'
begin object name="AH_Tiger" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Tiger"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainTiger",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Meat'
begin object name="AH_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainMeat",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AH104PistolWeaponParamsComp.AH_Gold'
begin object name="AH_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AH104Camos.AH104-MainGoldShine",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
