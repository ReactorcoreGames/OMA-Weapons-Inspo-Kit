class CoachWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Coach Gun"
		InventorySize=5
		CockAnimRate=0.7000000
		ReloadAnimRate=1.5000000
		SightingTime=0.2500000
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireShotParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireSlugParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireShotParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireSlugParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams_SawnOff'
	begin object name="ArenaParams_SawnOff" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Sawn Off"
		LayoutTags="quickload"
		InventorySize=5
		CockAnimRate=0.7000000
		ReloadAnimRate=1.5000000
		SightingTime=0.2500000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams_Sawn'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12Sawn'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12SawnSlug'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarFireParams_12Sawn'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12SawnSlug'
	end object
	Layouts[1]=ArenaParams_SawnOff
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams_Trench'
	begin object name="ArenaParams_Trench" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Trench Custom"
		LayoutTags="shield"
		InventorySize=5
		CockAnimRate=0.7000000
		ReloadAnimRate=1.5000000
		SightingTime=0.2500000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
		PickupDrawScale=1.5000000
		AllowedCamos[0]=5
		MagAmmo=2
		bNeedCock=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireShotParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireSlugParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_Shock'
		FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
		FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
		FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireShotParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireSlugParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_Shock'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
		AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
		AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	end object
	Layouts[2]=ArenaParams_Trench
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Black'
	begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blued"
	end object
	Camos[0]=Coach_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Hunter'
	begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hunter"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Coach_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Veteran'
	begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Coach_Veteran
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Silver'
	begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Nickel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Coach_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Gold'
	begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Coach_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Trench_Blue'
	begin object name="Trench_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Trench"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.TechWrench.TechWrenchShiny',MaterialName="",Index=1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.TechWrench.ExplodoShell',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.TechWrench.ShockShell',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Shader'BWBP_SKC_Tex.TechWrench.WrenchShiny',MaterialName="",Index=4,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.CYLO.ReflexShine',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[6]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-SightShader',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
		Index=5
	end object
	Camos[5]=Trench_Blue
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
begin object name="ArenaPrimaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunHE"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_HE'
end object
// Reference: AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireSlugParams'
begin object name="ArenaSecondaryFireSlugParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarySlugEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireShotParams'
begin object name="ArenaSecondaryFireShotParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryShotEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_Shock'
begin object name="ArenaPrimaryFireParams_Shock" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunZap"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_Shock'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12SawnSlug'
begin object name="ArenaPrimaryFireParams_12SawnSlug" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.8000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimarySlugEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireSlugParams'
begin object name="ArenaPrimaryFireSlugParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimarySlugEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimarySlugEffectParams'
begin object name="ArenaPrimarySlugEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1536.0000000,Max=4096.0000000)
	RangeAtten=0.2500000
	Damage=60
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSlug'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.SuperMagnum-DoubleFire',Volume=7.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=250.0000000
	Chaos=1.0000000
	Inaccuracy=(X=16,Y=0)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireShotParams'
begin object name="ArenaPrimaryFireShotParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryShotEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryShotEffectParams'
begin object name="ArenaPrimaryShotEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=13
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1000.0000000,Max=3000.0000000)
	RangeAtten=0.2500000
	Damage=12
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-FireDouble',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=400,Y=300)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_12Sawn'
begin object name="ArenaPrimaryEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=18
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=14
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1000.0000000,Max=2000.0000000)
	RangeAtten=0.2000000
	Damage=6
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-DFire',Volume=1.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1152.0000000
	Chaos=1.0000000
	Inaccuracy=(X=550,Y=550)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12Sawn'
begin object name="ArenaPrimaryFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_12Sawn'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_HE'
begin object name="ArenaPrimaryEffectParams_HE" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_IncendiaryBullet'
	MaxHits=14
	TraceRange=(Min=2048.0000000,Max=2560.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.2500000
	Damage=15
	DamageType=Class'BWBP_SKC_Pro.DT_CoachGunExplosive'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachGunExplosive'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachGunExplosive'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.TechGun.frost_shot',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=1024.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=220,Y=220)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryEffectParams_Shock'
begin object name="ArenaPrimaryEffectParams_Shock" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	TraceRange=(Min=4096.0000000,Max=5120.0000000)
	Damage=9
	DamageType=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.TechGun.electro_shot',Volume=1.0000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=150,Y=150)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryShotEffectParams'
begin object name="ArenaSecondaryShotEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=13
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1000.0000000,Max=3000.0000000)
	RangeAtten=0.2500000
	Damage=12
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Redwood-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=300,Y=300)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarySlugEffectParams'
begin object name="ArenaSecondarySlugEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1536.0000000,Max=4096.0000000)
	RangeAtten=0.2500000
	Damage=60
	HeadMult=1.5000000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSlug'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.SuperMagnum-Fire',Volume=7.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=250.0000000
	Chaos=1.0000000
	Inaccuracy=(X=16,Y=0)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarEffectParams_12Sawn'
begin object name="ArenaSecondarEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=18
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=14
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1000.0000000,Max=2000.0000000)
	RangeAtten=0.2000000
	Damage=6
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-Sfire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1152.0000000
	Chaos=1.0000000
	Inaccuracy=(X=350,Y=350)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarFireParams_12Sawn'
begin object name="ArenaSecondarFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarEffectParams_12Sawn'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams_Sawn'
begin object name="ArenaRecoilParams_Sawn" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3500000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Coach Gun"
	InventorySize=5
	CockAnimRate=0.7000000
	ReloadAnimRate=1.5000000
	SightingTime=0.2500000
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireShotParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireSlugParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireShotParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireSlugParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams_SawnOff'
begin object name="ArenaParams_SawnOff" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Sawn Off"
	LayoutTags="quickload"
	InventorySize=5
	CockAnimRate=0.7000000
	ReloadAnimRate=1.5000000
	SightingTime=0.2500000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams_Sawn'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12Sawn'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12SawnSlug'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondarFireParams_12Sawn'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_12SawnSlug'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaParams_Trench'
begin object name="ArenaParams_Trench" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Trench Custom"
	LayoutTags="shield"
	InventorySize=5
	CockAnimRate=0.7000000
	ReloadAnimRate=1.5000000
	SightingTime=0.2500000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
	PickupDrawScale=1.5000000
	AllowedCamos[0]=5
	MagAmmo=2
	bNeedCock=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireShotParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireSlugParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_Shock'
	FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireShotParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaSecondaryFireSlugParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_Shock'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
	AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsComp.ArenaPrimaryFireParams_HE'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Black'
begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blued"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Hunter'
begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hunter"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Veteran'
begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Silver'
begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Nickel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Coach_Gold'
begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsComp.Trench_Blue'
begin object name="Trench_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Trench"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.TechWrench.TechWrenchShiny',MaterialName="",Index=1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.TechWrench.ExplodoShell',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Texture'BWBP_SKC_Tex.TechWrench.ShockShell',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Shader'BWBP_SKC_Tex.TechWrench.WrenchShiny',MaterialName="",Index=4,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[5]=(Material=Shader'BWBP_SKC_Tex.CYLO.ReflexShine',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[6]=(Material=Shader'BWBP_SKC_Tex.CYLO.CYLO-SightShader',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
	Index=5
end object
