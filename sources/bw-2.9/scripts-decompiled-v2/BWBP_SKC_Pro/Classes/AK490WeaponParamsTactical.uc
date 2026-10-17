class AK490WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Carbine"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3200000
		SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
		SightPivot=(Pitch=64,Yaw=0,Roll=0)
		WeaponName="AK-490U Battle Rifle"
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams_Supp'
	begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Suppressed"
		LayoutTags="no_knife"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=2.2000000)
		WeaponBoneScales[0]=(BoneName="Mount",Slot=50,Scale=0.0000000)
		WeaponName="AKM-490 Battle Rifle (Supp)"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_S'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[1]=TacticalParams_Supp
	// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams_Holo'
	begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Holosight"
		LayoutTags="no_knife"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
		WeaponName="AKM-490 Battle Rifle (Holo)"
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_HB'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_Holo
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Black'
	begin object name="AK_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=AK_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Desert'
	begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=1
	end object
	Camos[1]=AK_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Flecktarn'
	begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=2
	end object
	Camos[2]=AK_Flecktarn
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Blood'
	begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Bloodied"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=3
	end object
	Camos[3]=AK_Blood
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Blue'
	begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=4
	end object
	Camos[4]=AK_Blue
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Red'
	begin object name="AK_Red" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
		Index=5
	end object
	Camos[5]=AK_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_AU'
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
// Reference: RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.1700000),(InVal=0.6500000,OutVal=0.1000000),(InVal=0.7500000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.0800000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=6144.0000000
	ClimbTime=0.0400000
	DeclineTime=1.2500000
	DeclineDelay=0.1500000
	EscapeMultiplier=1.2500000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=45
	HeadMult=3.2500000
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
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1100000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams_HB'
begin object name="TacticalPrimaryEffectParams_HB" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=45
	HeadMult=3.2500000
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
	Inaccuracy=(X=24,Y=24)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_HB'
begin object name="TacticalPrimaryFireParams_HB" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams_HB'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams_S'
begin object name="TacticalPrimaryEffectParams_S" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=13000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=45
	HeadMult=3.2500000
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
	Inaccuracy=(X=20,Y=20)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_S'
begin object name="TacticalPrimaryFireParams_S" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryEffectParams_S'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.AK490Knife'
	SpawnOffset=(X=12.0000000,Y=10.0000000,Z=-15.0000000)
	Speed=8500.0000000
	MaxSpeed=8500.0000000
	Damage=75.0000000
	HeadMult=3.2500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AK47.AK47-KnifeFire',Volume=0.5000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	PreFireTime=0.4500000
	PreFireAnim="PreKnifeFire"
	FireAnim="KnifeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Carbine"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3200000
	SightOffset=(X=-6.5000000,Y=0.0200000,Z=2.5500000)
	SightPivot=(Pitch=64,Yaw=0,Roll=0)
	WeaponName="AK-490U Battle Rifle"
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams_Supp'
begin object name="TacticalParams_Supp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Suppressed"
	LayoutTags="no_knife"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=2.2000000)
	WeaponBoneScales[0]=(BoneName="Mount",Slot=50,Scale=0.0000000)
	WeaponName="AKM-490 Battle Rifle (Supp)"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorAK',BoneName="Muzzle",Scale=0.0750000,AugmentOffset=(X=0.0000000,Y=-0.5000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_S'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalParams_Holo'
begin object name="TacticalParams_Holo" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Holosight"
	LayoutTags="no_knife"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=-0.2700000,Z=5.8000000)
	WeaponName="AKM-490 Battle Rifle (Holo)"
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.AKM490_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexRU',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-30.0000000,Y=-3.8000000,Z=-0.2000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalPrimaryFireParams_HB'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.AK490WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Black'
begin object name="AK_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Desert'
begin object name="AK_Desert" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-C-CamoDesert",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Flecktarn'
begin object name="AK_Flecktarn" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoGerman",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Blood'
begin object name="AK_Blood" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Bloodied"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-UC-CamoBlood",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Blue'
begin object name="AK_Blue" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoBlue",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_Red'
begin object name="AK_Red" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.AK490-R-CamoRed",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.AK490WeaponParamsTactical.AK_AU'
begin object name="AK_AU" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AK490Camos.GoldAK-Shine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.AK490.AK490-Misc',MaterialName="",Index=-1,pIndex=-1,AIndex=0)
	Index=6
end object
