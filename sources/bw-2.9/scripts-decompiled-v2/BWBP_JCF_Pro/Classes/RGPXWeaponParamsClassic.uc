class RGPXWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.8500000
		SightingTime=0.4000000
		SightOffset=(X=-20.0000000,Y=-26.2500000,Z=24.4000000)
		WeaponBoneScales[0]=(BoneName="Irons",Slot=18,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Scope",Slot=19,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="RocketMain",Slot=20,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="RocketBig",Slot=21,Scale=0.0000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Orange'
	begin object name="RPG_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
	end object
	Camos[0]=RPG_Orange
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Green'
	begin object name="RPG_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGP_Launcher_S2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RPG_Green
	// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Wood'
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
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.RGPXRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=5000.0000000
	MaxSpeed=17500.0000000
	AccelSpeed=18000.0000000
	Damage=80.0000000
	DamageRadius=356.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.RGPXFlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_JCF_Pro.RGPXFlakGrenade'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=1800.0000000
	MaxSpeed=3000.0000000
	AccelSpeed=18000.0000000
	Damage=40.0000000
	DamageRadius=520.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BWBP_JCF_Pro.RGPXFlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.RGX.RGX_FireFlak',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFireAlt"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=1.5000000
	YRandFactor=0.7000000
	MaxRecoil=512.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.7000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	AimAdjustTime=0.9000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpChaos=0.2000000
	FallingChaos=0.2000000
	SprintChaos=0.2000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=380
end object
// Reference: WeaponParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.8500000
	SightingTime=0.4000000
	SightOffset=(X=-20.0000000,Y=-26.2500000,Z=24.4000000)
	WeaponBoneScales[0]=(BoneName="Irons",Slot=18,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Scope",Slot=19,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="RocketMain",Slot=20,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="RocketBig",Slot=21,Scale=0.0000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.RGPXWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Orange'
begin object name="RPG_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Green'
begin object name="RPG_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGP_Launcher_S2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.RGPXWeaponParamsClassic.RPG_Wood'
begin object name="RPG_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RGPCamos.RGX_Black_Diff",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
