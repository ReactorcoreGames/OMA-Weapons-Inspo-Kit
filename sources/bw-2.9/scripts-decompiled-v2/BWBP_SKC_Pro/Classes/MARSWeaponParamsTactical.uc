class MARSWeaponParamsTactical extends BallisticWeaponParams;

static simulated function OnInitialize(BallisticWeapon BW)
{
	MARSAssaultRifle(BW).MaxTrackTime = 3.0000000;
	//return;	
}

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalParams_Holosight'
	begin object name="TacticalParams_Holosight" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holo + Ice"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalRecoilParams_CQC'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalAimParams_CQC'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalPrimaryFireParams_CQC'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalSecondaryFireParams_Ice'
	end object
	Layouts[0]=TacticalParams_Holosight
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Black'
	begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=MARS_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Tan'
	begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Tan"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
		Index=1
	end object
	Camos[1]=MARS_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Green'
	begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Olive Drab"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
		Index=2
	end object
	Camos[2]=MARS_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Urban'
	begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
		Index=3
	end object
	Camos[3]=MARS_Urban
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Arctic'
	begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
		Index=4
	end object
	Camos[4]=MARS_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Proto'
	begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
		Index=5
	end object
	Camos[5]=MARS_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_LE'
	begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Limited Edition"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
		Index=6
	end object
	Camos[6]=MARS_LE
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalPrimaryEffectParams_CQC'
begin object name="TacticalPrimaryEffectParams_CQC" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.6600000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-Fire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.2500000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0200000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalPrimaryFireParams_CQC'
begin object name="TacticalPrimaryFireParams_CQC" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalPrimaryEffectParams_CQC'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalSecondaryEffectParams_Ice'
begin object name="TacticalSecondaryEffectParams_Ice" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=80.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.MARSGrenade_Ice'
	SpawnOffset=(X=35.0000000,Y=5.0000000,Z=-15.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=80.0000000
	DamageRadius=512.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalSecondaryFireParams_Ice'
begin object name="TacticalSecondaryFireParams_Ice" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="GLPrepFire"
	FireAnim="GLFire"
	AimedFireAnim="GLSightFireFromPrep"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalSecondaryEffectParams_Ice'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalRecoilParams_CQC'
begin object name="TacticalRecoilParams_CQC" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2500000,OutVal=0.0800000),(InVal=0.3500000,OutVal=0.0700000),(InVal=0.4800000,OutVal=0.0900000),(InVal=0.6000000,OutVal=-0.0200000),(InVal=0.7500000,OutVal=0.0300000),(InVal=0.9000000,OutVal=0.0600000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalAimParams_CQC'
begin object name="TacticalAimParams_CQC" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalParams_Holosight'
begin object name="TacticalParams_Holosight" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holo + Ice"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=6.5000000,Y=0.0100000,Z=3.6500000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.MARS3_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.MARS.MARS3PickupHi'
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalRecoilParams_CQC'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalAimParams_CQC'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalPrimaryFireParams_CQC'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MARSWeaponParamsTactical.TacticalSecondaryFireParams_Ice'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Black'
begin object name="MARS_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Tan'
begin object name="MARS_Tan" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronsTan",Index=1,pIndex=1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Green'
begin object name="MARS_Green" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Olive Drab"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainGreen",Index=1,pIndex=1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Urban'
begin object name="MARS_Urban" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-MainSplitter",Index=1,pIndex=1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Arctic'
begin object name="MARS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronArctic",Index=1,pIndex=1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_Proto'
begin object name="MARS_Proto" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronBlack",Index=1,pIndex=1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MARSWeaponParamsTactical.MARS_LE'
begin object name="MARS_LE" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Limited Edition"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MARSCamos.F2000-IronWhite",Index=1,pIndex=1,AIndex=0)
	Index=6
end object
