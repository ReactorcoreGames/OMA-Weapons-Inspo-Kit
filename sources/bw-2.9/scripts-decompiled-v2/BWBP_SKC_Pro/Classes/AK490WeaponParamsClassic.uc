class AK490WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Carbine"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
		MagAmmo=20
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams_Suppressed'
	begin object name="ClassicParams_Suppressed" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_knife"
		SightMoveSpeedFactor=0.5000000
		SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=20
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_Suppressed'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams_Suppressed
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams_Scope'
	begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		LayoutTags="no_knife"
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
		MaxZoom=4.0000000
		ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=20
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Scope
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Black'
	begin object name="AK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Desert'
	begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=AK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Flecktarn'
	begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=AK_Flecktarn
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Blood'
	begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=AK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Blue'
	begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=AK_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Red'
	begin object name="AK_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=AK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_AU'
	begin object name="AK_AU" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.GoldAK-Shine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=6
	end object
	Camos[6]=AK_AU
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=1524.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.6000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.8000000
	Damage=35
	HeadMult=2.8500000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=70.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK47-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=286.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	BurstFireRateFactor=0.2300000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams_HeavyBarrel'
begin object name="ClassicPrimaryEffectParams_HeavyBarrel" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.8000000
	Damage=35
	HeadMult=2.8500000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=70.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter_C'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=0.0500000
	Inaccuracy=(X=6,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
begin object name="ClassicPrimaryFireParams_HeavyBarrel" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams_HeavyBarrel'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams_Suppressed'
begin object name="ClassicPrimaryEffectParams_Suppressed" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	WaterTraceRange=10400.0000000
	RangeAtten=0.8000000
	Damage=35
	HeadMult=2.8500000
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=70.0000000
	PenetrateForce=180
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-SilFire',Volume=1.5000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=226.0000000
	Chaos=0.0500000
	Inaccuracy=(X=4,Y=4)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_Suppressed'
begin object name="ClassicPrimaryFireParams_Suppressed" class=BCoreProV55.FireParams
	FireInterval=0.1400000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryEffectParams_Suppressed'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AK490Knife'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=90.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="PreKnifeFire"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Carbine"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
	MagAmmo=20
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams_Suppressed'
begin object name="ClassicParams_Suppressed" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_knife"
	SightMoveSpeedFactor=0.5000000
	SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=20
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_Suppressed'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicParams_Scope'
begin object name="ClassicParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	LayoutTags="no_knife"
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
	MaxZoom=4.0000000
	ViewOffset=(X=6.0000000,Y=5.0000000,Z=-4.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=20
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi-Auto",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RS8WeaponParamsClassic.ClassicRecoilParamsBurst'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicPrimaryFireParams_HeavyBarrel'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Black'
begin object name="AK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Desert'
begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Flecktarn'
begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Blood'
begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Blue'
begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_Red'
begin object name="AK_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsClassic.AK_AU'
begin object name="AK_AU" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.GoldAK-Shine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=6
end object
