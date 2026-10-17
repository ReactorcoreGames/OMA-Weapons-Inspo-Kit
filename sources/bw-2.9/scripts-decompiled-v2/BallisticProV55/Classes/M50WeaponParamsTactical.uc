class M50WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 0.0000000;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=-8.0000000,Y=0.0800000,Z=2.7000000)
		SightPivot=(Pitch=200,Yaw=0,Roll=0)
		WeaponName="M50 Assault Rifle"
		AllowedCamos[0]=0
		AllowedCamos[1]=1
		AllowedCamos[2]=2
		AllowedCamos[3]=3
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams_AdvSupp'
	begin object name="TacticalParams_AdvSupp" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="A3 Suppressed"
		LayoutTags="no_grenade, suppressed"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		SightPivot=(Pitch=80,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Sights",Slot=0,Scale=0.0000000)
		WeaponName="M50A3 Assault Rifle (Sil)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_S'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[1]=TacticalParams_AdvSupp
	// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams_AdvHolo'
	begin object name="TacticalParams_AdvHolo" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="A3 Holo"
		LayoutTags="no_grenade, lam"
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.3500000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
		WeaponName="M50A3 Assault Rifle (Holo)"
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
		AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-39.0000000,Y=-1.4000000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0400000,AugmentOffset=(X=-20.0000000,Y=0.0000000,Z=-1.5000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
		AllowedCamos[0]=4
		AllowedCamos[1]=5
		AllowedCamos[2]=6
		RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_HB'
		AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_AdvHolo
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Silver'
	begin object name="M50_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=M50_Silver
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Black'
	begin object name="M50_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50.M50Laser',MaterialName="",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50Gren-D',MaterialName="",Index=5,pIndex=3,AIndex=4)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50.M900Grenade',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=M50_Black
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Jungle'
	begin object name="M50_Jungle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SATiger",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SBTiger",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=M50_Jungle
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Gold'
	begin object name="M50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main1_S1",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main2_S1",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Laser_S1",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main3_S1",Index=5,pIndex=3,AIndex=4)
		Index=3
	end object
	Camos[3]=M50_Gold
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Black'
	begin object name="M50A3_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-CoverBlack',MaterialName="",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=4
	end object
	Camos[4]=M50A3_Black
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Desert'
	begin object name="M50A3_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverTan",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-MainTan",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=5
	end object
	Camos[5]=M50A3_Desert
	// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Red'
	begin object name="M50A3_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverRed",Index=3,pIndex=-1,AIndex=4)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
		WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
		Index=6
	end object
	Camos[6]=M50A3_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0200000),(InVal=0.1700000,OutVal=-0.0100000),(InVal=0.2500000,OutVal=0.0400000),(InVal=0.4000000,OutVal=0.0100000),(InVal=0.6000000,OutVal=-0.0400000),(InVal=0.8000000,OutVal=0.0700000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2100000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1500000
	YRandFactor=0.1500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1200000
	EscapeMultiplier=1.4500000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.6000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Fire2',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0825000
	FireAnim="AimedFire"
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams_HB'
begin object name="TacticalPrimaryEffectParams_HB" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50Fire3',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	Chaos=0.0100000
	Inaccuracy=(X=20,Y=20)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_HB'
begin object name="TacticalPrimaryFireParams_HB" class=BCoreProV55.FireParams
	FireInterval=0.0855000
	FireAnim="SightFire"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams_HB'
end object
// Reference: InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams_S'
begin object name="TacticalPrimaryEffectParams_S" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BallisticProV55.DTM50Assault'
	DamageTypeHead=Class'BallisticProV55.DTM50AssaultHead'
	DamageTypeArm=Class'BallisticProV55.DTM50AssaultLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=1.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50FireSil',Volume=1.1000000,Radius=192.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=160.0000000
	Chaos=0.0200000
	Inaccuracy=(X=20,Y=20)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_S'
begin object name="TacticalPrimaryFireParams_S" class=BCoreProV55.FireParams
	FireInterval=0.0855000
	FireAnim="SightFire"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryEffectParams_S'
end object
// Reference: GrenadeEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=50.0000000
	bOverrideArming=true
	DetonateDelay=3.0000000
	ProjectileClass=Class'BallisticProV55.M50Grenade'
	SpawnOffset=(X=35.0000000,Y=5.0000000,Z=-15.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M50.M50GrenFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrepFire"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=-8.0000000,Y=0.0800000,Z=2.7000000)
	SightPivot=(Pitch=200,Yaw=0,Roll=0)
	WeaponName="M50 Assault Rifle"
	AllowedCamos[0]=0
	AllowedCamos[1]=1
	AllowedCamos[2]=2
	AllowedCamos[3]=3
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams_AdvSupp'
begin object name="TacticalParams_AdvSupp" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="A3 Suppressed"
	LayoutTags="no_grenade, suppressed"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	SightPivot=(Pitch=80,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Sights",Slot=0,Scale=0.0000000)
	WeaponName="M50A3 Assault Rifle (Sil)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Suppressor',BoneName="tip",Scale=0.2000000,AugmentOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_S'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.M50WeaponParamsTactical.TacticalParams_AdvHolo'
begin object name="TacticalParams_AdvHolo" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="A3 Holo"
	LayoutTags="no_grenade, lam"
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.3500000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	WeaponBoneScales[0]=(BoneName="Irons",Slot=0,Scale=0.0000000)
	WeaponName="M50A3 Assault Rifle (Holo)"
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_FPm'
	AttachmentMesh=SkeletalMesh'BW_Core_WeaponAnim.M50A3_TPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Holo',BoneName="tip",Scale=0.0600000,AugmentOffset=(X=-39.0000000,Y=-1.4000000,Z=-0.1250000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_LAM',BoneName="tip",Scale=0.0400000,AugmentOffset=(X=-20.0000000,Y=0.0000000,Z=-1.5000000),AugmentRot=(Pitch=0,Yaw=0,Roll=32768))
	AllowedCamos[0]=4
	AllowedCamos[1]=5
	AllowedCamos[2]=6
	RecoilParams[0]=RecoilParams'BallisticProV55.M50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M50WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalPrimaryFireParams_HB'
	AltFireParams[0]=FireParams'BallisticProV55.M50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Silver'
begin object name="M50_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Black'
begin object name="M50_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50.M50Laser',MaterialName="",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50Gren-D',MaterialName="",Index=5,pIndex=3,AIndex=4)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50.M900Grenade',MaterialName="",Index=6,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Jungle'
begin object name="M50_Jungle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SATiger",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M30A2-SBTiger",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50_Gold'
begin object name="M50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main1_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main2_S1",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Laser_S1",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50Camos.M50_Main3_S1",Index=5,pIndex=3,AIndex=4)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Black'
begin object name="M50A3_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-CoverBlack',MaterialName="",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Desert'
begin object name="M50A3_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverTan",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-MainTan",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.M50WeaponParamsTactical.M50A3_Red'
begin object name="M50A3_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinA-D',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50SkinB-D',MaterialName="",Index=2,pIndex=-1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.M50A3.M50A3-CoverRed",Index=3,pIndex=-1,AIndex=4)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-MainBlack',MaterialName="",Index=4,pIndex=-1,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Barrel',MaterialName="",Index=5,pIndex=-1,AIndex=5)
	WeaponMaterialSwaps[6]=(Material=Texture'BW_Core_WeaponTex.M50A3.M50A3-Misc',MaterialName="",Index=6,pIndex=-1,AIndex=3)
	Index=6
end object
