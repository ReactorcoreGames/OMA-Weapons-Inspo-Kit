class LS14WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Marksman"
		LayoutDescription="Scope, Rockets, Double Barrel"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
		ViewOffset=(X=0.0000000,Y=6.0000000,Z=-5.0000000)
		WeaponName="LS14 Laser Rifle"
		AllowedCamos[0]=0
		MagAmmo=20
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Dbl'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Carbine'
	begin object name="ClassicParams_Carbine" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Carbine"
		LayoutDescription="Reflex Sight, Rockets, Double Barrel, Light"
		PlayerSpeedFactor=1.1000000
		PlayerJumpFactor=1.1000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=1.0000000)
		WeaponName="LS10 Laser Carbine"
		AllowedCamos[0]=0
		MagAmmo=20
		bNeedCock=true
		WeaponModes[0]=(ModeName="Burst Barrel",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Carbine'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_Carbine
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Auto'
	begin object name="ClassicParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Laser Repeater"
		LayoutDescription="Automatic Barrel, Big Battery"
		LayoutTags="gatling"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		ReloadAnimRate=0.8000000
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=5.0000000,Y=0.0000000,Z=2.7500000)
		ZoomType=1
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-3.0000000)
		WeaponName="LS18 Laser Repeater"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		MagAmmo=40
		bNeedCock=true
		WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams_Gatling'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Gatling'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Auto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Gatling'
	begin object name="ClassicParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Laser Gatling"
		LayoutDescription="Gatling Barrel, Backpack Battery"
		LayoutTags="gatling,rapid,backpack"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
		WeaponName="LS440 Laser Gatling"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		MagAmmo=500
		bNeedCock=true
		WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams_Gatling'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Gatling'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Gatling'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[3]=ClassicParams_Gatling
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS14_Black'
	begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=LS14_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS440_Black'
	begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		Index=1
	end object
	Camos[1]=LS440_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS440_Green'
	begin object name="LS440_Green" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="OD Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LS440Camos.LS440-Green",Index=1,pIndex=-1,AIndex=1)
		Index=2
	end object
	Camos[2]=LS440_Green
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0200000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="GrenadePrepFire"
	FireAnim="RLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Gatling'
begin object name="ClassicAimParams_Gatling" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	OffsetAdjustTime=0.4000000
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=2.0000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams_Gatling'
begin object name="ClassicRecoilParams_Gatling" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.1000000
	XRandFactor=0.7000000
	YRandFactor=0.7000000
	MaxRecoil=4000.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.7000000
	YRandFactor=0.7000000
	MaxRecoil=2048.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.5500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=0.9000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.7500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrationEnergy=64.0000000
	PenetrateForce=400
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS14.Gauss-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=100.0000000
	Chaos=-1.0000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Dbl'
begin object name="ClassicPrimaryEffectParams_Dbl" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=70
	HeadMult=2.7500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrationEnergy=64.0000000
	PenetrateForce=400
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FireDouble',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2000.0000000
	Chaos=1.5000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Dbl'
begin object name="ClassicPrimaryFireParams_Dbl" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Dbl'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Auto'
begin object name="ClassicPrimaryEffectParams_Auto" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=30
	HeadMult=1.7500000
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrationEnergy=64.0000000
	PenetrateForce=400
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	Recoil=75.0000000
	Chaos=-0.1000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Auto'
begin object name="ClassicPrimaryFireParams_Auto" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	TargetState="GatlingLaser"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Auto'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Gatling'
begin object name="ClassicPrimaryEffectParams_Gatling" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=30
	HeadMult=1.7500000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrationEnergy=64.0000000
	PenetrateForce=400
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	Recoil=25.0000000
	Chaos=-0.1000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Gatling'
begin object name="ClassicPrimaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=0.0400000
	TargetState="GatlingLaser"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryEffectParams_Gatling'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LS14Rocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=50.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=2.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Rocket-Launch',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=20,Max=1400)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.5000000
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Carbine'
begin object name="ClassicAimParams_Carbine" class=BCoreProV55.AimParams
	AimSpread=(Min=10,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.8000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Marksman"
	LayoutDescription="Scope, Rockets, Double Barrel"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
	ViewOffset=(X=0.0000000,Y=6.0000000,Z=-5.0000000)
	WeaponName="LS14 Laser Rifle"
	AllowedCamos[0]=0
	MagAmmo=20
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Dbl'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Carbine'
begin object name="ClassicParams_Carbine" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Carbine"
	LayoutDescription="Reflex Sight, Rockets, Double Barrel, Light"
	PlayerSpeedFactor=1.1000000
	PlayerJumpFactor=1.1000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=1.0000000)
	WeaponName="LS10 Laser Carbine"
	AllowedCamos[0]=0
	MagAmmo=20
	bNeedCock=true
	WeaponModes[0]=(ModeName="Burst Barrel",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Carbine'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Auto'
begin object name="ClassicParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Laser Repeater"
	LayoutDescription="Automatic Barrel, Big Battery"
	LayoutTags="gatling"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	ReloadAnimRate=0.8000000
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=5.0000000,Y=0.0000000,Z=2.7500000)
	ZoomType=1
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-3.0000000)
	WeaponName="LS18 Laser Repeater"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	MagAmmo=40
	bNeedCock=true
	WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams_Gatling'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Gatling'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Auto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicParams_Gatling'
begin object name="ClassicParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Laser Gatling"
	LayoutDescription="Gatling Barrel, Backpack Battery"
	LayoutTags="gatling,rapid,backpack"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
	WeaponName="LS440 Laser Gatling"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	MagAmmo=500
	bNeedCock=true
	WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicRecoilParams_Gatling'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicAimParams_Gatling'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicPrimaryFireParams_Gatling'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS14_Black'
begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS440_Black'
begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsClassic.LS440_Green'
begin object name="LS440_Green" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LS440Camos.LS440-Green",Index=1,pIndex=-1,AIndex=1)
	Index=2
end object
