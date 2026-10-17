class AK490WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Carbine"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="no_knife"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_S'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		LayoutTags="no_knife"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
		MaxZoom=3.0000000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_HB'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_Scope
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Black'
	begin object name="AK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Desert'
	begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=AK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Flecktarn'
	begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=AK_Flecktarn
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Blood'
	begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=AK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Blue'
	begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=AK_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Red'
	begin object name="AK_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=AK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_AU'
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
// Reference: RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=1.2500000
	DeclineDelay=0.1500000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1536.0000000,Max=4000.0000000)
	RangeAtten=0.7500000
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.AK490FlashEmitter'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK47-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=250.0000000
	Chaos=0.0400000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams_HB'
begin object name="ArenaPrimaryEffectParams_HB" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1536.0000000,Max=4000.0000000)
	RangeAtten=0.7000000
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=230.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_HB'
begin object name="ArenaPrimaryFireParams_HB" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams_HB'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams_S'
begin object name="ArenaPrimaryEffectParams_S" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1536.0000000,Max=4000.0000000)
	RangeAtten=0.7000000
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AK490BulletHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AK490Bullet'
	PenetrationEnergy=48.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AK47.AK490-SilFire',Volume=1.5000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=210.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_S'
begin object name="ArenaPrimaryFireParams_S" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryEffectParams_S'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AK490Knife'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=90.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=0.5000000,Radius=16.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="PreKnifeFire"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Carbine"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="no_knife"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_S'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	LayoutTags="no_knife"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	SightOffset=(X=3.0000000,Y=-0.1000000,Z=5.0000000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.VSKS.VSKScopeView'
	MaxZoom=3.0000000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_4XScope',BoneName="Muzzle",Scale=0.0700000,AugmentOffset=(X=-26.0000000,Y=-3.6000000,Z=-0.1000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaPrimaryFireParams_HB'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Black'
begin object name="AK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Desert'
begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Flecktarn'
begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Blood'
begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Blue'
begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_Red'
begin object name="AK_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsComp.AK_AU'
begin object name="AK_AU" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.GoldAK-Shine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=6
end object
