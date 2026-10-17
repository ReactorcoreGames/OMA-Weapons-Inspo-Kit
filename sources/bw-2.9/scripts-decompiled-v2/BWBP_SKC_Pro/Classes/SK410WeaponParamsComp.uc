class SK410WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Iron Sights"
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaParams_RDS'
	begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Red Dot Sight"
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_RDS
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Black'
	begin object name="SK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=SK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Urban'
	begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
		Index=1
	end object
	Camos[1]=SK_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Wood'
	begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
		Index=2
	end object
	Camos[2]=SK_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Digital'
	begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Digital"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
		Index=3
	end object
	Camos[3]=SK_Digital
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Blood'
	begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
		Index=4
	end object
	Camos[4]=SK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_RedTiger'
	begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
		Index=5
	end object
	Camos[5]=SK_RedTiger
	// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Corrupt'
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
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2250000
	FireEndAnim="None"
	FireAnimRate=1.7500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	FireEndAnim="None"
	FireAnimRate=1.2500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0200000),(InVal=0.4000000,OutVal=0.0600000),(InVal=0.6000000,OutVal=0.0700000),(InVal=0.7500000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.1600000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.0500000
	DeclineTime=0.3500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.6500000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunHE'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.3500000
	Damage=11
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SK410ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Blast',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	Chaos=0.4000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.SK410HEProjectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=8000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=75.0000000
	DamageRadius=256.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-FireFRAG',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=180.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Iron Sights"
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=-4.0000000,Y=0.0100000,Z=1.1000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=0.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaParams_RDS'
begin object name="ArenaParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Red Dot Sight"
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0100000,Z=2.4000000)
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="RDS",Slot=7,Scale=1.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.SK410WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Black'
begin object name="SK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Urban'
begin object name="SK_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-C-CamoSnow",Index=1,pIndex=0,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Wood'
begin object name="SK_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoJungle",Index=1,pIndex=0,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Digital'
begin object name="SK_Digital" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Digital"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-UC-CamoDigital",Index=1,pIndex=0,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Blood'
begin object name="SK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoBlood",Index=1,pIndex=0,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_RedTiger'
begin object name="SK_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-R-CamoTiger",Index=1,pIndex=0,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.SK410WeaponParamsComp.SK_Corrupt'
begin object name="SK_Corrupt" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Corrupt"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SK410Camos.SK410-Charged",Index=1,pIndex=0,AIndex=2)
	Index=6
end object
