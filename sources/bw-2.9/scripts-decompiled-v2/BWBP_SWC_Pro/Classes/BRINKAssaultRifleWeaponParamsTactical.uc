class BRINKAssaultRifleWeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 1.0000000;
	BWA.ModeInfos[0].TracerMix = 4;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		CockAnimRate=0.9500000
		ReloadAnimRate=0.9500000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4500000
		SightOffset=(X=-7.0000000,Y=-0.4000000,Z=16.2000000)
		ViewOffset=(X=10.0000000,Y=7.0000000,Z=-13.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Blue'
	begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=BRINK_Blue
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Jungle'
	begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=BRINK_Jungle
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Winter'
	begin object name="BRINK_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=BRINK_Winter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.8000000
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_SWC_Pro.DTBRINKAssault'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTBRINKAssaultHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTBRINKAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SWC_Pro.BRINKFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Chaos=0.0200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0720000
	BurstFireRateFactor=0.8500000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.BRINKRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=600.0000000
	MaxSpeed=14000.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
end object
// Reference: RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.1500000),(InVal=0.4800000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.7500000,OutVal=0.0500000),(InVal=0.9000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=3000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	CockAnimRate=0.9500000
	ReloadAnimRate=0.9500000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4500000
	SightOffset=(X=-7.0000000,Y=-0.4000000,Z=16.2000000)
	ViewOffset=(X=10.0000000,Y=7.0000000,Z=-13.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Blue'
begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Jungle'
begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsTactical.BRINK_Winter'
begin object name="BRINK_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
