class M46WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M46WeaponParamsTactical.TacticalParams_RDS'
	begin object name="TacticalParams_RDS" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="RDS"
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
		MagAmmo=24
		RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams_RDS
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Tan'
	begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=M46_Tan
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Jungle'
	begin object name="M46_Jungle" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenClip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=1
	end object
	Camos[1]=M46_Jungle
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Blue'
	begin object name="M46_Blue" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ocean"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AL_PulseRifle_Clip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=2
	end object
	Camos[2]=M46_Blue
	// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Black'
	begin object name="M46_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Stealth"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayMain",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayClip",Index=2,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
		Index=3
	end object
	Camos[3]=M46_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.M46WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.7500000
	Damage=45
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTM46Assault'
	DamageTypeHead=Class'BallisticProV55.DTM46AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM46Assault'
	PenetrationEnergy=48.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M46FlashEmitter'
	FlashScaleFactor=0.4500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_Fire1',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=250.0000000
	Chaos=0.0320000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M46WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.M46WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.M46Grenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=90.0000000
	DamageRadius=384.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_FireGren',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.M46WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M46WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.0400000),(InVal=0.3000000,OutVal=-0.0500000),(InVal=0.4500000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.8000000,OutVal=-0.1200000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.5000000,OutVal=0.6000000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1650000
	EscapeMultiplier=1.3500000
	ViewBindFactor=0.3500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.M46WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M46WeaponParamsTactical.TacticalParams_RDS'
begin object name="TacticalParams_RDS" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="RDS"
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-2.5000000,Y=0.0400000,Z=3.8500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=0,Scale=0.0000000)
	MagAmmo=24
	RecoilParams[0]=RecoilParams'BallisticProV55.M46WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M46WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M46WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Tan'
begin object name="M46_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Jungle'
begin object name="M46_Jungle" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenClip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoGreenGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Blue'
begin object name="M46_Blue" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ocean"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AL_PulseRifle_Clip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-CamoBlueGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M46WeaponParamsTactical.M46_Black'
begin object name="M46_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Stealth"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayMain",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayClip",Index=2,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M46Camos.AR-GrayGrenadeLauncher",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.OA-AR.OA-AR_Grenade',MaterialName="",Index=4,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.OA-AR.OA-AR_Scope_Shine',MaterialName="",Index=5,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[6]=(Material=FinalBlend'BW_Core_WeaponTex.OA-SMG.OA-SMG_SightFB',MaterialName="",Index=6,pIndex=-1,AIndex=4)
	Index=3
end object
