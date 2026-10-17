class CoachWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Coach Gun"
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams_SawnOff'
	begin object name="TacticalParams_SawnOff" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Sawn Off"
		LayoutTags="quickload"
		InventorySize=5
		SightingTime=0.2000000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
		PickupDrawScale=0.1000000
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		AllowedCamos[4]=4
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12Sawn'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12SawnSlug'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams_12Sawn'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12SawnSlug'
	end object
	Layouts[1]=TacticalParams_SawnOff
	// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams_Trench'
	begin object name="TacticalParams_Trench" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Trench Custom"
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
		AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
		PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
		PickupDrawScale=1.5000000
		AllowedCamos[0]=5
		MagAmmo=2
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
		FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Shock'
		FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
		FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
		FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Shock'
		AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
		AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
		AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
	end object
	Layouts[2]=TacticalParams_Trench
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Black'
	begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blued"
	end object
	Camos[0]=Coach_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Hunter'
	begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hunter"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Coach_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Veteran'
	begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Coach_Veteran
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Silver'
	begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Nickel"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Coach_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Gold'
	begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Coach_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Trench_Blue'
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
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
begin object name="TacticalPrimaryFireParams_Slug" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Slug'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
begin object name="TacticalPrimaryFireParams_HE" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunHE"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_HE'
end object
// Reference: AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.4000000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
begin object name="TacticalPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Projectile"
	FireAnimRate=0.8000000
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Shock'
begin object name="TacticalPrimaryFireParams_Shock" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="ShotgunZap"
	FireAnimRate=0.8000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Shock'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12SawnSlug'
begin object name="TacticalPrimaryFireParams_12SawnSlug" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.7500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_12SawnSlug'
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=1.3500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=15
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.2500000
	Damage=17
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-DoubleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=400,Y=300)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Slug'
begin object name="TacticalPrimaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1050.0000000,Max=3150.0000000)
	RangeAtten=0.2500000
	Damage=60
	HeadMult=2.5000000
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
	Inaccuracy=(X=192,Y=192)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_12Sawn'
begin object name="TacticalPrimaryEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=15
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1050.0000000,Max=1600.0000000)
	RangeAtten=0.2500000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-DFire',Volume=1.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1580.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=600,Y=450)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12Sawn'
begin object name="TacticalPrimaryFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	FireAnimRate=0.7500000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_12Sawn'
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_12SawnSlug'
begin object name="TacticalPrimaryEffectParams_12SawnSlug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_X83AM'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBullet'
	TraceRange=(Min=9000.0000000,Max=9000.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.2500000
	Damage=60
	HeadMult=2.5000000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachSlug'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachSlug'
	PenetrateForce=500
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.0000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AR23.AR23-Fire',Volume=1.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1580.0000000
	PushbackForce=250.0000000
	Chaos=1.0000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_HE'
begin object name="TacticalPrimaryEffectParams_HE" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_IncendiaryBullet'
	MaxHits=13
	TraceRange=(Min=2048.0000000,Max=2560.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.2500000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
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
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Shock'
begin object name="TacticalPrimaryEffectParams_Shock" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	TraceRange=(Min=4096.0000000,Max=5120.0000000)
	Damage=5
	HeadMult=1.0000000
	LimbMult=1.0000000
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
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
begin object name="TacticalPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=90.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.CoachGunRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=75.0000000
	DamageRadius=512.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1462.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=20,Y=20)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=15
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1050.0000000,Max=2100.0000000)
	RangeAtten=0.2500000
	Damage=17
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Redwood.Coach-SingleShot',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=300,Y=300)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryEffectParams_12Sawn'
begin object name="TacticalSecondaryEffectParams_12Sawn" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=15
	TraceRange=(Min=2560.0000000,Max=3072.0000000)
	DecayRange=(Min=1050.0000000,Max=1600.0000000)
	RangeAtten=0.2500000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_CoachShot'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_CoachShot'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.SawnOff.SawnOff-Sfire',Volume=1.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1580.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	Inaccuracy=(X=600,Y=600)
	BotRefireRate=0.6000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams_12Sawn'
begin object name="TacticalSecondaryFireParams_12Sawn" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryEffectParams_12Sawn'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Coach Gun"
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams_SawnOff'
begin object name="TacticalParams_SawnOff" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Sawn Off"
	LayoutTags="quickload"
	InventorySize=5
	SightingTime=0.2000000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.SawnOff_FPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.SawnOff.SawnOffPickupLo'
	PickupDrawScale=0.1000000
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	AllowedCamos[4]=4
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12Sawn'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12SawnSlug'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams_12Sawn'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_12SawnSlug'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalParams_Trench'
begin object name="TacticalParams_Trench" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Trench Custom"
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_FPm'
	AttachmentMesh=SkeletalMesh'BWBP_SKC_Anim.Trenchgun_TPm'
	PickupMesh=StaticMesh'BWBP_SKC_Static.TechGun.TechGunPickupHi'
	PickupDrawScale=1.5000000
	AllowedCamos[0]=5
	MagAmmo=2
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Ammo: Shot",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Ammo: Slug",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Ammo: Electro",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Ammo: Dragon",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Ammo: Explosive",bUnavailable=true,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[5]=(ModeName="Ammo: FRAG-12",bUnavailable=false,ModeID="",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
	FireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Shock'
	FireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
	FireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
	FireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Slug'
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Shock'
	AltFireParams[3]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
	AltFireParams[4]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_HE'
	AltFireParams[5]=FireParams'BWBP_SKC_Pro.CoachWeaponParamsTactical.TacticalPrimaryFireParams_Frag'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Black'
begin object name="Coach_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blued"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Hunter'
begin object name="Coach_Hunter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hunter"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainHunter",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Veteran'
begin object name="Coach_Veteran" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainVet",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Silver'
begin object name="Coach_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Nickel"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainChromeShine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Coach_Gold'
begin object name="Coach_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CoachCamos.Coach-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.CoachWeaponParamsTactical.Trench_Blue'
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
