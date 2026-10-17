class TyphonPDWWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		WeaponBoneScales[0]=(BoneName="Ladder",Slot=52,Scale=0.0000000)
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParamsCharged'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Black'
	begin object name="TY_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=TY_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Urban'
	begin object name="TY_Urban" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineUrban",Index=1,pIndex=0,AIndex=5)
		Index=1
	end object
	Camos[1]=TY_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Jungle'
	begin object name="TY_Jungle" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineGreen",Index=1,pIndex=0,AIndex=5)
		Index=2
	end object
	Camos[2]=TY_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_UTC'
	begin object name="TY_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.UMPMainShine",Index=1,pIndex=0,AIndex=5)
		Index=3
	end object
	Camos[3]=TY_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Blue'
	begin object name="TY_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Nebula"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineBlue",Index=1,pIndex=0,AIndex=5)
		Index=4
	end object
	Camos[4]=TY_Blue
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.7500000
	Damage=38
	DamageType=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_TyphonPDWHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.TyphonPDWFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Fire',Volume=9.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryEffectParamsCharged'
begin object name="ArenaPrimaryEffectParamsCharged" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.7500000
	Damage=54
	DamageType=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_TyphonPDWHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	PenetrationEnergy=64.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Overblast',Volume=7.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=384.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParamsCharged'
begin object name="ArenaPrimaryFireParamsCharged" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	AmmoPerFire=2
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryEffectParamsCharged'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1850000
	ViewBindFactor=0.4500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=384)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	WeaponBoneScales[0]=(BoneName="Ladder",Slot=52,Scale=0.0000000)
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.ArenaPrimaryFireParamsCharged'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Black'
begin object name="TY_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Urban'
begin object name="TY_Urban" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineUrban",Index=1,pIndex=0,AIndex=5)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Jungle'
begin object name="TY_Jungle" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineGreen",Index=1,pIndex=0,AIndex=5)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_UTC'
begin object name="TY_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.UMPMainShine",Index=1,pIndex=0,AIndex=5)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsComp.TY_Blue'
begin object name="TY_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Nebula"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineBlue",Index=1,pIndex=0,AIndex=5)
	Index=4
end object
