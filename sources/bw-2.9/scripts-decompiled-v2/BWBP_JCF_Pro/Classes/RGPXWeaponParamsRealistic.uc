class RGPXWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4000000
		SightOffset=(X=-5.0000000,Y=-26.2500000,Z=24.4000000)
		WeaponBoneScales[0]=(BoneName="Irons",Slot=18,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=19,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="RocketMain",Slot=20,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="RocketBig",Slot=21,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=20.0000000,Z=-22.0000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Orange'
	begin object name="RPG_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
	end object
	Camos[0]=RPG_Orange
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Green'
	begin object name="RPG_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGP_Launcher_S2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RPG_Green
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Wood'
	begin object name="RPG_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGX_Black_Diff",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=RPG_Wood
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.RGPXRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=5000.0000000
	MaxSpeed=17500.0000000
	AccelSpeed=18000.0000000
	Damage=120.0000000
	DamageRadius=512.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.RGPXFlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.RGPXFlakGrenade'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=1800.0000000
	MaxSpeed=3000.0000000
	AccelSpeed=18000.0000000
	Damage=40.0000000
	DamageRadius=384.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.RGPXFlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_FireFlak',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4000000
	SightOffset=(X=-5.0000000,Y=-26.2500000,Z=24.4000000)
	WeaponBoneScales[0]=(BoneName="Irons",Slot=18,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=19,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="RocketMain",Slot=20,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="RocketBig",Slot=21,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=20.0000000,Z=-22.0000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Orange'
begin object name="RPG_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Green'
begin object name="RPG_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGP_Launcher_S2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsRealistic.RPG_Wood'
begin object name="RPG_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGX_Black_Diff",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
