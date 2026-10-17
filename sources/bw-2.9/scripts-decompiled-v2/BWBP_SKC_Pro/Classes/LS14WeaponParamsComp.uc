class LS14WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Marksman"
		LayoutDescription="Scope, Rockets, Double Barrel"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
		ZoomType=1
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
		AllowedCamos[0]=0
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryDoubleFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams_Auto'
	begin object name="ArenaParams_Auto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Automatic"
		LayoutDescription="Automatic Barrel, Big Battery"
		LayoutTags="gatling,heavy"
		ReloadAnimRate=0.8000000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=5.0000000,Y=0.0000000,Z=2.7500000)
		ZoomType=1
		MaxZoom=3.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
		ViewOffset=(X=5.0000000,Y=10.0000000,Z=-3.0000000)
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
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Auto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_Auto
	// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams_Gatling'
	begin object name="ArenaParams_Gatling" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Laser Gatling"
		LayoutDescription="Gatling Barrel, Backpack Battery"
		LayoutTags="gatling,rapid,backpack"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
		MaxZoom=3.0000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=1
		AllowedCamos[1]=2
		DisplaceDurationMult=1.5000000
		MagAmmo=200
		WeaponModes[0]=(ModeName="Gatling Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams_Gatling'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Gatling'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_Gatling
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS14_Black'
	begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=LS14_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS440_Black'
	begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		Index=1
	end object
	Camos[1]=LS440_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS440_Green'
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
// Reference: RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	ClimbTime=0.0100000
	DeclineTime=1.0000000
	DeclineDelay=0.1800000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.0000000
	ChaosDeclineDelay=0.5000000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS14.Gauss-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.3000000
	Heat=10.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryDoubleEffectParams'
begin object name="ArenaPrimaryDoubleEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=50
	DamageType=Class'BWBP_SKC_Pro.DTLS14Twin'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Twin'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Twin'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FireDouble',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.3000000
	Heat=20.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryDoubleFireParams'
begin object name="ArenaPrimaryDoubleFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=2
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryDoubleEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams_Auto'
begin object name="ArenaPrimaryEffectParams_Auto" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=25
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.LS440.AQ-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Heat=10.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Auto'
begin object name="ArenaPrimaryFireParams_Auto" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="GatlingLaser"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams_Auto'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams_Gatling'
begin object name="ArenaPrimaryEffectParams_Gatling" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=15
	DamageType=Class'BWBP_SKC_Pro.DTLS14Body'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTLS14Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTLS14Limb'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.LS14FlashEmitter'
	FlashScaleFactor=0.4000000
	Recoil=16.0000000
	Chaos=0.3000000
	Heat=5.0000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Gatling'
begin object name="ArenaPrimaryFireParams_Gatling" class=BCoreProV55.FireParams
	FireInterval=0.0400000
	TargetState="GatlingLaser"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryEffectParams_Gatling'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LS14Rocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=750.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=6750.0000000
	Damage=80.0000000
	DamageRadius=384.0000000
	MomentumTransfer=50000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=2.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Rocket-Launch',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	AmmoPerFire=0
	PreFireAnim="GrenadePrepFire"
	FireAnim="RLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams_Gatling'
begin object name="ArenaAimParams_Gatling" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1536)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Marksman"
	LayoutDescription="Scope, Rockets, Double Barrel"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightPivot=(Pitch=600,Yaw=0,Roll=-1024)
	ZoomType=1
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="RDS",Slot=92,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LongBarrel",Slot=93,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="ShortBarrel",Slot=94,Scale=0.0000000)
	AllowedCamos[0]=0
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryDoubleFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams_Auto'
begin object name="ArenaParams_Auto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Automatic"
	LayoutDescription="Automatic Barrel, Big Battery"
	LayoutTags="gatling,heavy"
	ReloadAnimRate=0.8000000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=5.0000000,Y=0.0000000,Z=2.7500000)
	ZoomType=1
	MaxZoom=3.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=1.0000000)
	ViewOffset=(X=5.0000000,Y=10.0000000,Z=-3.0000000)
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
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Auto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaParams_Gatling'
begin object name="ArenaParams_Gatling" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Laser Gatling"
	LayoutDescription="Gatling Barrel, Backpack Battery"
	LayoutTags="gatling,rapid,backpack"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=11.0000000,Y=0.0000000,Z=4.7000000)
	MaxZoom=3.0000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_SKC_Tex.LS440.LS440-Blue',MaterialName="",Index=1,pIndex=-1,AIndex=-1)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=91,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.LS440_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.LS440.LS440PickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=1
	AllowedCamos[1]=2
	DisplaceDurationMult=1.5000000
	MagAmmo=200
	WeaponModes[0]=(ModeName="Gatling Barrel",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Double Barrel",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Automatic",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaAimParams_Gatling'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaPrimaryFireParams_Gatling'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LS14WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS14_Black'
begin object name="LS14_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS440_Black'
begin object name="LS440_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LS14WeaponParamsComp.LS440_Green'
begin object name="LS440_Green" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="OD Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LS440Camos.LS440-Green",Index=1,pIndex=-1,AIndex=1)
	Index=2
end object
