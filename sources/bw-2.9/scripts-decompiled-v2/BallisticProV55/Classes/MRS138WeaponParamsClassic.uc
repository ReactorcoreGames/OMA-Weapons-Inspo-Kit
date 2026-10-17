class MRS138WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Shot"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams_Frag'
	begin object name="ClassicParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga HE Slug"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
	end object
	Layouts[1]=ClassicParams_Frag
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams_Gas'
	begin object name="ClassicParams_Gas" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga Teargas Slug"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=7
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Gas'
	end object
	Layouts[2]=ClassicParams_Gas
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Silver'
	begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=MRS_Silver
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Arctic'
	begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MRS_Arctic
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Gold'
	begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MRS_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=0.9000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
	ChaosTurnThreshold=160000
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=2000.0000000,Max=4000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.4000000
	Damage=30
	LimbMult=0.3500000
	DamageType=Class'BallisticProV55.DTMRS138Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRS138ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRS138Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=120
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=900,Y=800)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.7500000
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams_Frag'
begin object name="ClassicPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=40.0000000
	bCombinedSplashImpact=true
	bOverrideArming=true
	ArmingDelay=0.0300000
	DetonateDelay=0.0300000
	UnarmedDetonateOn=1
	ArmedDetonateOn=1
	UnarmedPlayerImpactType=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BallisticProV55.MRS138Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=350000.0000000
	AccelSpeed=350000.0000000
	Damage=70.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1048.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
begin object name="ClassicPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams_Frag'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams_Gas'
begin object name="ClassicPrimaryEffectParams_Gas" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=40.0000000
	bCombinedSplashImpact=true
	bOverrideArming=true
	ArmingDelay=0.0300000
	DetonateDelay=0.0300000
	UnarmedDetonateOn=1
	ArmedDetonateOn=1
	UnarmedPlayerImpactType=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BallisticProV55.MRS138Slug_Gas'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	MaxSpeed=350000.0000000
	AccelSpeed=350000.0000000
	Damage=40.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-FireSlug',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1048.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Gas'
begin object name="ClassicPrimaryFireParams_Gas" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryEffectParams_Gas'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Shot"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams_Frag'
begin object name="ClassicParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga HE Slug"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Frag'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicParams_Gas'
begin object name="ClassicParams_Gas" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga Teargas Slug"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=7
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsClassic.ClassicPrimaryFireParams_Gas'
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Silver'
begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Arctic'
begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsClassic.MRS_Gold'
begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
