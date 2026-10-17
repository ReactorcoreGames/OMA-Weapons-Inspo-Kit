class M99RifleWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.9000000
		SightOffset=(X=5.0000000,Y=16.0000000,Z=36.0000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
		ZoomType=4
		ViewOffset=(X=12.0000000,Y=0.0000000,Z=-25.0000000)
		MagAmmo=1
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Desert'
	begin object name="M99_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
	end object
	Camos[0]=M99_Desert
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Jungle'
	begin object name="M99_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainJungle",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscJungle",Index=3,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=M99_Jungle
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Winter'
	begin object name="M99_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainWinter",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=M99_Winter
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Gray'
	begin object name="M99_Gray" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGray",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=M99_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_UTC'
	begin object name="M99_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99AShine",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99BShine",Index=3,pIndex=1,AIndex=1)
		Index=4
	end object
	Camos[4]=M99_UTC
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Hex'
	begin object name="M99_Hex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue Hex"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainHex",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=5
	end object
	Camos[5]=M99_Hex
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Molten'
	begin object name="M99_Molten" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Molten"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainMolten",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=6
	end object
	Camos[6]=M99_Molten
	// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Gold'
	begin object name="M99_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGold",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
		Index=7
	end object
	Camos[7]=M99_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=150000.0000000,Max=150000.0000000)
	WaterTraceRange=120000.0000000
	Damage=190
	LimbMult=0.5500000
	DamageType=Class'BWBP_JCF_Pro.DTM99Rifle'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTM99RifleHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTM99Rifle'
	PenetrationEnergy=300.0000000
	PenetrateForce=1000
	bPenetrate=true
	PDamageFactor=0.9000000
	WallPDamageFactor=0.9000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.M99.M99-Fire',Volume=5.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=6972.0000000
	PushbackForce=100.0000000
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.3000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=3072)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.2500000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=400
end object
// Reference: WeaponParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.9000000
	SightOffset=(X=5.0000000,Y=16.0000000,Z=36.0000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1024)
	ZoomType=4
	ViewOffset=(X=12.0000000,Y=0.0000000,Z=-25.0000000)
	MagAmmo=1
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.M7A3WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Desert'
begin object name="M99_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Jungle'
begin object name="M99_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainJungle",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscJungle",Index=3,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Winter'
begin object name="M99_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainWinter",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Gray'
begin object name="M99_Gray" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGray",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_UTC'
begin object name="M99_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99AShine",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99BShine",Index=3,pIndex=1,AIndex=1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Hex'
begin object name="M99_Hex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue Hex"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainHex",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=5
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Molten'
begin object name="M99_Molten" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Molten"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainMolten",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=6
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.M99RifleWeaponParamsClassic.M99_Gold'
begin object name="M99_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MainGold",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M99Camos.M99_MiscGray",Index=3,pIndex=1,AIndex=1)
	Index=7
end object
