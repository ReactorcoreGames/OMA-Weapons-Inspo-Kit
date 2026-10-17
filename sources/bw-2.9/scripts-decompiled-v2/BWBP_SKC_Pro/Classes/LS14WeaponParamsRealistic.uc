class LS14WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Marksman"
		LayoutDescription="Scope, Rockets, Double Barrel"
		LayoutTags="heavy"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=2
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
		WeaponName="LS14 Directed Energy Weapon"
		AllowedCamos[0]=0
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Dbl'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams_Auto'
	begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Laser Repeater"
		LayoutDescription="Automatic Barrel, Big Battery"
		LayoutTags="heavy,gatling"
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
		WeaponName="LS10 Auto Directed Energy Weapon"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		MagAmmo=40
		WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams_Gatling'
	begin object name="RealisticParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Laser Gatling"
		LayoutDescription="Gatling Barrel, Backpack Battery"
		LayoutTags="gatling,rapid,backpack"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
		WeaponName="LS440 Suppressive DEW"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		MagAmmo=200
		WeaponModes[0]=(ModeName="Gatling Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Gatling'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Gatling
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS14_Black'
	begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=LS14_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS440_Black'
	begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		Index=1
	end object
	Camos[1]=LS440_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS440_Green'
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
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0200000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="GrenadePrepFire"
	FireAnim="RLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=1936)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.0750000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.7000000
	ChaosSpeedThreshold=550
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.1850000
	YRandFactor=0.1850000
	MaxRecoil=4000.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=40
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
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS14.Gauss-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=25.0000000
	Chaos=-1.0000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Dbl'
begin object name="RealisticPrimaryEffectParams_Dbl" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=80
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
	Recoil=50.0000000
	Chaos=-1.0000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Dbl'
begin object name="RealisticPrimaryFireParams_Dbl" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Dbl'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Auto'
begin object name="RealisticPrimaryEffectParams_Auto" class=BCoreProV55.InstantEffectParams
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
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS440.AQ-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=25.0000000
	Chaos=-1.0000000
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
begin object name="RealisticPrimaryFireParams_Auto" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="GatlingLaser"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Auto'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Gatling'
begin object name="RealisticPrimaryEffectParams_Gatling" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1500000.0000000,Max=1500000.0000000)
	WaterTraceRange=5000.0000000
	Damage=30
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
	Recoil=16.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=1.0500000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Gatling'
begin object name="RealisticPrimaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=0.0400000
	TargetState="GatlingLaser"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryEffectParams_Gatling'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LS14Rocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=2000.0000000
	Damage=100.0000000
	DamageRadius=350.0000000
	MomentumTransfer=20000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=2.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Rocket-Launch',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=5.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Marksman"
	LayoutDescription="Scope, Rockets, Double Barrel"
	LayoutTags="heavy"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=2
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
	WeaponName="LS14 Directed Energy Weapon"
	AllowedCamos[0]=0
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Dbl'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams_Auto'
begin object name="RealisticParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Laser Repeater"
	LayoutDescription="Automatic Barrel, Big Battery"
	LayoutTags="heavy,gatling"
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
	WeaponName="LS10 Auto Directed Energy Weapon"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	MagAmmo=40
	WeaponModes[0]=(ModeName="Rotary Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Auto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticParams_Gatling'
begin object name="RealisticParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Laser Gatling"
	LayoutDescription="Gatling Barrel, Backpack Battery"
	LayoutTags="gatling,rapid,backpack"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
	WeaponName="LS440 Suppressive DEW"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	MagAmmo=200
	WeaponModes[0]=(ModeName="Gatling Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticPrimaryFireParams_Gatling'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS14_Black'
begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS440_Black'
begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsRealistic.LS440_Green'
begin object name="LS440_Green" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LS440Camos.LS440-Green",Index=1,pIndex=-1,AIndex=1)
	Index=2
end object
