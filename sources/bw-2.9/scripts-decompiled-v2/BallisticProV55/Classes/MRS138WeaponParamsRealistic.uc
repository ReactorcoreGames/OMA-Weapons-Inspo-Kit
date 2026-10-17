class MRS138WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Shot"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		WeaponName="MRS138 10ga Riot Shotgun"
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams_Frag'
	begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga HE Slug"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
		WeaponName="MRS138 10ga Riot Shotgun (Frag)"
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Frag
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams_Gas'
	begin object name="RealisticParams_Gas" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga Teargas Slug"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		WeaponName="MRS138 10ga Riot Shotgun (Gas)"
		MagAmmo=5
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Gas'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Gas
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Silver'
	begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=MRS_Silver
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Arctic'
	begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MRS_Arctic
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Gold'
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
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="TazerStart"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1792.0000000
	DeclineTime=0.5500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.7000000
	ADSViewBindFactor=0.7000000
	CrouchMultiplier=0.8750000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=640,Max=1280)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.8750000
	ADSMultiplier=0.8750000
	SprintOffset=(Pitch=-4096,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.7000000
	ChaosSpeedThreshold=600
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=13
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=15
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTMRS138Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRS138ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRS138Shotgun'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=900,Y=900)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
begin object name="RealisticPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=110.0000000
	ProjectileClass=Class'BallisticProV55.MRS138Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=350000.0000000
	AccelSpeed=350000.0000000
	Damage=150.0000000
	DamageRadius=200.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=0.1500000
	Inaccuracy=(X=64,Y=64)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
begin object name="RealisticPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams_Gas'
begin object name="RealisticPrimaryEffectParams_Gas" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=60.0000000
	bCombinedSplashImpact=true
	ProjectileClass=Class'BallisticProV55.MRS138Slug_Gas'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=350000.0000000
	AccelSpeed=350000.0000000
	Damage=50.0000000
	DamageRadius=200.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-FireSlug',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=0.1500000
	Inaccuracy=(X=64,Y=64)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Gas'
begin object name="RealisticPrimaryFireParams_Gas" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryEffectParams_Gas'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRS138TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=12800.0000000
	MaxSpeed=12800.0000000
	Damage=5.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Shot"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	WeaponName="MRS138 10ga Riot Shotgun"
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams_Frag'
begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga HE Slug"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
	WeaponName="MRS138 10ga Riot Shotgun (Frag)"
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticParams_Gas'
begin object name="RealisticParams_Gas" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga Teargas Slug"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	WeaponName="MRS138 10ga Riot Shotgun (Gas)"
	MagAmmo=5
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticPrimaryFireParams_Gas'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Silver'
begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Arctic'
begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsRealistic.MRS_Gold'
begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
