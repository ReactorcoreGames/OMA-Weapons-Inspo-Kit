class RCS715WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Shot"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
		WeaponName="RCS-715 Assault Shotgun"
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicParams_Frag'
	begin object name="ClassicParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Frag"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
		WeaponName="RCS-715 Assault Shotgun (FRAG)"
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Frag
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Red'
	begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=RCS_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Yellow'
	begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
		Index=1
	end object
	Camos[1]=RCS_Yellow
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Jungle'
	begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
		Index=2
	end object
	Camos[2]=RCS_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Arctic'
	begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
		Index=3
	end object
	Camos[3]=RCS_Arctic
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Clown'
	begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Clown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
		Index=4
	end object
	Camos[4]=RCS_Clown
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=0
	FireAnim="GLFire"
	FireAnimRate=1.2500000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	AimAdjustTime=0.8000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ViewBindFactor=0.5000000
	JumpChaos=1.0000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=565
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_RCSShotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3000000
	Damage=20
	HeadMult=1.0000000
	LimbMult=1.0000000
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_RCS715ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.RCS715FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.AssaultShotgun.RCS-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.5000000
	Inaccuracy=(X=1200,Y=1200)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryEffectParams_Frag'
begin object name="ClassicPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=30.0000000
	bCombinedSplashImpact=true
	bOverrideArming=true
	ArmingDelay=0.0300000
	DetonateDelay=0.0300000
	UnarmedDetonateOn=1
	ArmedDetonateOn=1
	UnarmedPlayerImpactType=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=18000.0000000
	MaxSpeed=770000.0000000
	AccelSpeed=370000.0000000
	Damage=60.0000000
	DamageRadius=150.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_OP_Pro.RCS715FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.AssaultShotgun.RCS-FireFrag',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
begin object name="ClassicPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="Projectile"
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryEffectParams_Frag'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Projectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=4000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=50.0000000
	DamageRadius=128.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=650.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Shot"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
	WeaponName="RCS-715 Assault Shotgun"
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicParams_Frag'
begin object name="ClassicParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Frag"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
	WeaponName="RCS-715 Assault Shotgun (FRAG)"
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Red'
begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Yellow'
begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Jungle'
begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Arctic'
begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsClassic.RCS_Clown'
begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Clown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
	Index=4
end object
