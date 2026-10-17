class TyphonPDWWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		InventorySize=4
		SightingTime=0.2500000
		WeaponBoneScales[0]=(BoneName="Ladder",Slot=52,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=4.0000000,Z=-2.5000000)
		MagAmmo=25
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParamsCharged'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Black'
	begin object name="TY_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=TY_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Urban'
	begin object name="TY_Urban" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineUrban",Index=1,pIndex=0,AIndex=5)
		Index=1
	end object
	Camos[1]=TY_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Jungle'
	begin object name="TY_Jungle" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineGreen",Index=1,pIndex=0,AIndex=5)
		Index=2
	end object
	Camos[2]=TY_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_UTC'
	begin object name="TY_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.UMPMainShine",Index=1,pIndex=0,AIndex=5)
		Index=3
	end object
	Camos[3]=TY_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Blue'
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
// Reference: InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	DecayRange=(Min=1800.0000000,Max=3600.0000000)
	RangeAtten=0.3000000
	Damage=26
	DamageType=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_TyphonPDWHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Fire',Volume=7.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=70.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireAnim="SightFire"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryEffectParamsCharged'
begin object name="ClassicPrimaryEffectParamsCharged" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=6000.0000000)
	DecayRange=(Min=1800.0000000,Max=3600.0000000)
	RangeAtten=0.3000000
	Damage=51
	DamageType=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_TyphonPDWHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_TyphonPDW'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.0500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Typhon.Typhon-Overblast',Volume=7.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=140.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParamsCharged'
begin object name="ClassicPrimaryFireParamsCharged" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	AmmoPerFire=5
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryEffectParamsCharged'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0300000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	DeclineTime=0.9000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.4500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=512)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.9000000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	InventorySize=4
	SightingTime=0.2500000
	WeaponBoneScales[0]=(BoneName="Ladder",Slot=52,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=4.0000000,Z=-2.5000000)
	MagAmmo=25
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.ClassicPrimaryFireParamsCharged'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Black'
begin object name="TY_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Urban'
begin object name="TY_Urban" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineUrban",Index=1,pIndex=0,AIndex=5)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Jungle'
begin object name="TY_Jungle" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineGreen",Index=1,pIndex=0,AIndex=5)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_UTC'
begin object name="TY_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.UMPMainShine",Index=1,pIndex=0,AIndex=5)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.TyphonPDWWeaponParamsClassic.TY_Blue'
begin object name="TY_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Nebula"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.UMPCamos.PUMA-ShineBlue",Index=1,pIndex=0,AIndex=5)
	Index=4
end object
