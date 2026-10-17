class AK490WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Carbine"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		WeaponName="AK-490U 7.62mm Battle Rifle"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams_Supp'
	begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_knife"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		WeaponName="AKM-490 7.62mm Battle Rifle (Sil)"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_S'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[1]=RealisticParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams_Scope'
	begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="4X Scope"
		LayoutTags="no_knife"
		WeaponPrice=1200
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
		MaxZoom=4.0000000
		WeaponName="AKM-490 7.62mm Battle Rifle (4X)"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_HB'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
	end object
	Layouts[2]=RealisticParams_Scope
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Black'
	begin object name="AK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Desert'
	begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=AK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Flecktarn'
	begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=AK_Flecktarn
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Blood'
	begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=AK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Blue'
	begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=AK_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Red'
	begin object name="AK_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=AK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_AU'
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
// Reference: AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1024)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.3500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
begin object name="RealisticSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=2800.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.1000000
	ADSViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1400.0000000,Max=7000.0000000)
	WaterTraceRange=4000.0000000
	Damage=50
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=22.0000000
	PenetrateForce=70
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK47-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=465.0000000
	Chaos=0.1000000
	Inaccuracy=(X=18,Y=18)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1050000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams_HB'
begin object name="RealisticPrimaryEffectParams_HB" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1400.0000000,Max=7000.0000000)
	WaterTraceRange=4000.0000000
	Damage=50
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=22.0000000
	PenetrateForce=70
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=425.0000000
	Chaos=0.1500000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_HB'
begin object name="RealisticPrimaryFireParams_HB" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams_HB'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams_S'
begin object name="RealisticPrimaryEffectParams_S" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=1400.0000000,Max=7000.0000000)
	WaterTraceRange=4000.0000000
	Damage=50
	HeadMult=2.2000000
	LimbMult=0.6500000
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=22.0000000
	PenetrateForce=70
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.6000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-SilFire',Volume=1.5000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=405.0000000
	Chaos=0.2000000
	Inaccuracy=(X=10,Y=10)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_S'
begin object name="RealisticPrimaryFireParams_S" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryEffectParams_S'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AK490Knife'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=90.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="PreKnifeFire"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryEffectParams_Scope'
begin object name="RealisticSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams_Scope'
begin object name="RealisticRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.4000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=2800.0000000
	DeclineTime=1.6500000
	ViewBindFactor=0.1000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Carbine"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	WeaponName="AK-490U 7.62mm Battle Rifle"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams_Supp'
begin object name="RealisticParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_knife"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	WeaponName="AKM-490 7.62mm Battle Rifle (Sil)"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_S'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticParams_Scope'
begin object name="RealisticParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="4X Scope"
	LayoutTags="no_knife"
	WeaponPrice=1200
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
	MaxZoom=4.0000000
	WeaponName="AKM-490 7.62mm Battle Rifle (4X)"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticPrimaryFireParams_HB'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsRealistic.RealisticSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Black'
begin object name="AK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Desert'
begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Flecktarn'
begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Blood'
begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Blue'
begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_Red'
begin object name="AK_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsRealistic.AK_AU'
begin object name="AK_AU" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.GoldAK-Shine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=6
end object
