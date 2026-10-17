class FG50WeaponParamsClassic extends BallisticWeaponParams;

static simulated function OnInitialize(BallisticWeapon BW)
{
	FG50MachineGun(BW).HeatDecayRate = 0.1000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicParams_Holo'
	begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		PlayerSpeedFactor=0.8900000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5500000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-3.0000000)
		MagAmmo=40
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[0]=ClassicParams_Holo
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicParams_Bipod'
	begin object name="ClassicParams_Bipod" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Bipod"
		PlayerSpeedFactor=0.8900000
		PlayerJumpFactor=0.7500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5500000
		SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
		ViewOffset=(X=5.0000000,Y=5.0000000,Z=-3.0000000)
		MagAmmo=40
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Mount'
	end object
	Layouts[1]=ClassicParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Gold'
	begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=4
	end object
	Camos[4]=FG50_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=2800.0000000
	DeclineTime=2.2000000
	ViewBindFactor=0.7000000
	CrouchMultiplier=0.1000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=1.0000000
	CrouchMultiplier=0.1000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.5000000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledFireParams'
begin object name="ClassicPriControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="IncAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="IncAmmo"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicControlledAimParams'
begin object name="ClassicControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	AimAdjustTime=1.1000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-3072,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=350
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=6000.0000000
	Damage=65
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrationEnergy=72.0000000
	PenetrateForce=350
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter_C'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	PushbackForce=125.0000000
	Chaos=-1.0000000
	Heat=0.2500000
	Inaccuracy=(X=3,Y=3)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledEffectParams'
begin object name="ClassicPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=65
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrationEnergy=72.0000000
	PenetrateForce=350
	bPenetrate=true
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=384.0000000
	PushbackForce=64.0000000
	Chaos=0.0700000
	Heat=0.2500000
	WarnTargetPct=0.4000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryEffectParams_Mount'
begin object name="ClassicSecondaryEffectParams_Mount" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Mount'
begin object name="ClassicSecondaryFireParams_Mount" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Mount"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryEffectParams_Mount'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicParams_Holo'
begin object name="ClassicParams_Holo" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	PlayerSpeedFactor=0.8900000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5500000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-3.0000000)
	MagAmmo=40
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicParams_Bipod'
begin object name="ClassicParams_Bipod" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Bipod"
	PlayerSpeedFactor=0.8900000
	PlayerJumpFactor=0.7500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5500000
	SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
	ViewOffset=(X=5.0000000,Y=5.0000000,Z=-3.0000000)
	MagAmmo=40
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsClassic.ClassicSecondaryFireParams_Mount'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsClassic.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=4
end object
