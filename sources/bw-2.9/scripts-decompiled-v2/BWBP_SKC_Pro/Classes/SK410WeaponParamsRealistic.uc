class SK410WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		WeaponName="SK-410 8ga Breaching Shotgun"
		MagAmmo=6
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRDSParams'
	begin object name="RealisticRDSParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Red Dot Sight"
		PlayerSpeedFactor=1.0500000
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2200000
		SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
		WeaponName="SK-410 8ga Breaching Shotgun"
		MagAmmo=6
		bMagPlusOne=true
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticRDSParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Black'
	begin object name="SK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=SK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Urban'
	begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
		Index=1
	end object
	Camos[1]=SK_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Wood'
	begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
		Index=2
	end object
	Camos[2]=SK_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Digital'
	begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
		Index=3
	end object
	Camos[3]=SK_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Blood'
	begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
		Index=4
	end object
	Camos[4]=SK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_RedTiger'
	begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
		Index=5
	end object
	Camos[5]=SK_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Corrupt'
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
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	FireEndAnim="None"
	FireAnimRate=1.2500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	DeclineTime=0.8000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=576,Max=1200)
	ADSMultiplier=0.8000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.8500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunHE'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=750.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.6000000
	Damage=25
	LimbMult=0.4000000
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SK410ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Blast',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1100,Y=1100)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SK410HEProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=80.0000000
	DamageRadius=256.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-FireFRAG',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	WeaponName="SK-410 8ga Breaching Shotgun"
	MagAmmo=6
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRDSParams'
begin object name="RealisticRDSParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Red Dot Sight"
	PlayerSpeedFactor=1.0500000
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2200000
	SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
	WeaponName="SK-410 8ga Breaching Shotgun"
	MagAmmo=6
	bMagPlusOne=true
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst Fire",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Black'
begin object name="SK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Urban'
begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Wood'
begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Digital'
begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Blood'
begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_RedTiger'
begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsRealistic.SK_Corrupt'
begin object name="SK_Corrupt" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Corrupt"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-Charged",Index=1,pIndex=0,AIndex=2)
	Index=6
end object
