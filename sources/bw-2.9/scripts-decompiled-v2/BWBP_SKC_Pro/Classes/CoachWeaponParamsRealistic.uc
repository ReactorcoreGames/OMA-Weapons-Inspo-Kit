class CoachWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Coach Gun"
		PlayerSpeedFactor=1.1000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2300000
		WeaponName="Super-10 10ga Coach Gun"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireSlugParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireSlugParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams_SawnOff'
	begin object name="RealisticParams_SawnOff" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Sawn Off"
		LayoutTags="quickload"
		PlayerSpeedFactor=1.1000000
		SightingTime=0.2000000
		WeaponName="Super-10 12ga Sawn Off"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams_Sawn'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12Sawn'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12SawnSlug'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams_12Sawn'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12SawnSlug'
	end object
	Layouts[1]=RealisticParams_SawnOff
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams_Trench'
	begin object name="RealisticParams_Trench" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Trench Custom"
		LayoutTags="shield"
		SightingTime=0.2500000
		WeaponName="BR-112 12g Customized Trenchgun"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
		PickupDrawScale=1.5000000
		AllowedCamos[0]=5
		MagAmmo=2
		InitialWeaponMode=5
		WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireSlugParams'
		FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Shock'
		FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
		FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireSlugParams'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Shock'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
		AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	end object
	Layouts[2]=RealisticParams_Trench
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Black'
	begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blued"
	end object
	Camos[0]=Coach_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Hunter'
	begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hunter"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Coach_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Veteran'
	begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Coach_Veteran
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Silver'
	begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Nickel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Coach_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Gold'
	begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Coach_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Trench_Blue'
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
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
begin object name="RealisticPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Projectile"
	FireAnimRate=0.8000000
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.8000000),(InVal=0.8500000,OutVal=-0.5000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YawFactor=0.2500000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=3762.0000000
	DeclineTime=0.4000000
	DeclineDelay=0.1650000
	ViewBindFactor=0.7000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1400)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.8000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=600
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireSlugParams'
begin object name="RealisticSecondaryFireSlugParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondarySlugEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
begin object name="RealisticPrimaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunIncendiary"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Flame'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Shock'
begin object name="RealisticPrimaryFireParams_Shock" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunZap"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Shock'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12SawnSlug'
begin object name="RealisticPrimaryFireParams_12SawnSlug" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.7500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_12SawnSlug'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireSlugParams'
begin object name="RealisticPrimaryFireSlugParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimarySlugEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=13
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=500.0000000,Max=2700.0000000)
	WaterTraceRange=5000.0000000
	Damage=15
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-DoubleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2548.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=700,Y=650)
	BotRefireRate=0.1000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimarySlugEffectParams'
begin object name="RealisticPrimarySlugEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=6000.0000000,Max=6500.0000000)
	RangeAtten=0.3500000
	Damage=115
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSlug'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-DoubleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	Chaos=1.0000000
	Inaccuracy=(X=48,Y=48)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_12Sawn'
begin object name="RealisticPrimaryEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=500.0000000,Max=2500.0000000)
	Damage=20
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-DFire',Volume=1.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=1.0000000
	Inaccuracy=(X=1500,Y=1000)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12Sawn'
begin object name="RealisticPrimaryFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.7500000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_12Sawn'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_12SawnSlug'
begin object name="RealisticPrimaryEffectParams_12SawnSlug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	RangeAtten=0.1500000
	Damage=80
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-Fire',Volume=1.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	Chaos=100.0000000
	Inaccuracy=(X=1024,Y=1024)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Shock'
begin object name="RealisticPrimaryEffectParams_Shock" class=BCoreProV55.ShotgunEffectParams
	TraceCount=5
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	TraceRange=(Min=2500.0000000,Max=4500.0000000)
	Damage=60
	DamageType=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachGunElectro'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.TechGun.electro_shot',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=462.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=400,Y=350)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Flame'
begin object name="RealisticPrimaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunFlame'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2500.0000000,Max=2500.0000000)
	RangeAtten=0.2000000
	Damage=5
	DamageType=Class'BWBP_SKC_Pro.DT_CoachFire'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachFireHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachFire'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.TechGun.fire_shot',Volume=1.5000000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1462.0000000
	PushbackForce=1200.0000000
	Chaos=1.0000000
	Inaccuracy=(X=400,Y=350)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
begin object name="RealisticPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.CoachGunRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=35000.0000000
	Damage=150.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1462.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=20,Y=20)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=13
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=500.0000000,Max=2700.0000000)
	WaterTraceRange=5000.0000000
	Damage=15
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	PenetrateForce=10
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-SingleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1592.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=650,Y=650)
	BotRefireRate=0.1000000
	WarnTargetPct=0.1000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondarySlugEffectParams'
begin object name="RealisticSecondarySlugEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=6000.0000000,Max=6500.0000000)
	RangeAtten=0.3500000
	Damage=135
	HeadMult=2.2000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSlug'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-SingleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1792.0000000
	Chaos=1.0000000
	Inaccuracy=(X=24,Y=24)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryEffectParams_12Sawn'
begin object name="RealisticSecondaryEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=500.0000000,Max=2500.0000000)
	Damage=20
	HeadMult=2.1500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSawnOff'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-Sfire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=1.0000000
	Inaccuracy=(X=1000,Y=1000)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams_12Sawn'
begin object name="RealisticSecondaryFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryEffectParams_12Sawn'
end object
// Reference: AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams_Sawn'
begin object name="RealisticAimParams_Sawn" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1024)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.9000000
	ADSMultiplier=0.9000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Coach Gun"
	PlayerSpeedFactor=1.1000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2300000
	WeaponName="Super-10 10ga Coach Gun"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireSlugParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireSlugParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams_SawnOff'
begin object name="RealisticParams_SawnOff" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Sawn Off"
	LayoutTags="quickload"
	PlayerSpeedFactor=1.1000000
	SightingTime=0.2000000
	WeaponName="Super-10 12ga Sawn Off"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams_Sawn'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12Sawn'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12SawnSlug'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams_12Sawn'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_12SawnSlug'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticParams_Trench'
begin object name="RealisticParams_Trench" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Trench Custom"
	LayoutTags="shield"
	SightingTime=0.2500000
	WeaponName="BR-112 12g Customized Trenchgun"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
	PickupDrawScale=1.5000000
	AllowedCamos[0]=5
	MagAmmo=2
	InitialWeaponMode=5
	WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireSlugParams'
	FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Shock'
	FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
	FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticSecondaryFireSlugParams'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Shock'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Flame'
	AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Black'
begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blued"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Hunter'
begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hunter"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Veteran'
begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Silver'
begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Nickel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Coach_Gold'
begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsRealistic.Trench_Blue'
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
