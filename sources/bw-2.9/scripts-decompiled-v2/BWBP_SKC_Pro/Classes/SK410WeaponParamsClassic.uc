class SK410WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRDSParams'
	begin object name="ClassicRDSParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Red Dot Sight"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
		MagAmmo=6
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicRDSParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Black'
	begin object name="SK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=SK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Urban'
	begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
		Index=1
	end object
	Camos[1]=SK_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Wood'
	begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
		Index=2
	end object
	Camos[2]=SK_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Digital'
	begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
		Index=3
	end object
	Camos[3]=SK_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Blood'
	begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
		Index=4
	end object
	Camos[4]=SK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_RedTiger'
	begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
		Index=5
	end object
	Camos[5]=SK_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Corrupt'
	begin object name="SK_Corrupt" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Corrupt"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-Charged",Index=1,pIndex=0,AIndex=2)
		Index=6
	end object
	Camos[6]=SK_Corrupt
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1960)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.8500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	DeclineTime=1.5000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunHE'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=25
	LimbMult=0.4000000
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SK410ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Blast',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=640.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1400,Y=1200)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SK410HEProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=6300.0000000
	MaxSpeed=6300.0000000
	AccelSpeed=3000.0000000
	Damage=65.0000000
	DamageRadius=200.0000000
	MomentumTransfer=10000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-FireFRAG',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=640.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRDSParams'
begin object name="ClassicRDSParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Red Dot Sight"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
	MagAmmo=6
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Black'
begin object name="SK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Urban'
begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Wood'
begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Digital'
begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Blood'
begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_RedTiger'
begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsClassic.SK_Corrupt'
begin object name="SK_Corrupt" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Corrupt"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-Charged",Index=1,pIndex=0,AIndex=2)
	Index=6
end object
