class RS04WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Tac Light"
		LayoutTags="flash,light"
		InventorySize=2
		ReloadAnimRate=1.2000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.0700000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-256)
		ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Blind'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_TacKnife'
	begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Tac Knife"
		LayoutTags="tacknife,light"
		InventorySize=2
		ReloadAnimRate=1.2000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-3.5000000,Y=-0.0300000,Z=1.0700000)
		ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
		LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.RS04Melee_FPm'
		MagAmmo=8
		bNeedCock=true
		bDualBlocked=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
	end object
	Layouts[1]=ClassicParams_TacKnife
	// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="RDS"
		InventorySize=2
		ReloadAnimRate=1.2000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.9000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-256)
		WeaponBoneScales[0]=(BoneName="LightModule",Slot=4,Scale=0.0000000)
		ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0750000,AugmentOffset=(X=1.4000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_RDS
	// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_Sensor'
	begin object name="ClassicParams_Sensor" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Sensor"
		LayoutTags="sensor"
		InventorySize=2
		ReloadAnimRate=1.2000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.0700000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-256)
		WeaponBoneScales[0]=(BoneName="LightModule",Slot=4,Scale=0.0000000)
		ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Tazer',BoneName="Muzzle",Scale=0.0300000,AugmentOffset=(X=-2.5000000,Y=1.5000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
		MagAmmo=8
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
	end object
	Layouts[3]=ClassicParams_Sensor
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Tan'
	begin object name="RS04_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Tan"
	end object
	Camos[0]=RS04_Tan
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Black'
	begin object name="RS04_Black" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-MainShineX1",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RS04_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_TwoTone'
	begin object name="RS04_TwoTone" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Two-Tone"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-MainShineX2",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=RS04_TwoTone
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Jungle'
	begin object name="RS04_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-UC-CamoJungle",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=RS04_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Hunter'
	begin object name="RS04_Hunter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Hunter"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-R-CamoHunter",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=RS04_Hunter
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Autumn'
	begin object name="RS04_Autumn" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Autumn"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-R-CamoAutumn",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=RS04_Autumn
	// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_RedTiger'
	begin object name="RS04_RedTiger" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Red Tiger"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-X-CamoTiger",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=RS04_RedTiger
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=36,Max=2048)
	AimAdjustTime=0.5500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.0500000
	FallingChaos=0.0500000
	SprintChaos=0.0500000
	ChaosDeclineTime=0.5000000
	ChaosSpeedThreshold=1200
end object
// Reference: RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=2048.0000000
	DeclineTime=0.6000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.3000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3300.0000000
	RangeAtten=0.8000000
	Damage=32
	HeadMult=2.6500000
	LimbMult=0.3750000
	DamageType=Class'BWBP_SKC_Pro.DTRS04Pistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTRS04PistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTRS04Pistol'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M1911.M1911-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=840.0000000
	Chaos=0.0500000
	Inaccuracy=(X=16,Y=16)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Blind'
begin object name="ClassicSecondaryEffectParams_Blind" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BallisticProV55.AM67FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.AM67.AM67-SecFire',Volume=0.6000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Blinding flash"
end object
// Reference: FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Blind'
begin object name="ClassicSecondaryFireParams_Blind" class=BCoreProV55.FireParams
	FireInterval=4.0000000
	AmmoPerFire=0
	TargetState="FlashbangLight"
	BurstFireRateFactor=1.0000000
	FireAnim="SecFire"
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Blind'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
begin object name="ClassicSecondaryEffectParams_Sensor" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.RS04Projectile_Sensor'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2240.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=8000.0000000
	Damage=35.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
begin object name="ClassicSecondaryFireParams_Sensor" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	TargetState="Projectile"
	PreFireAnim="None"
	FireAnim="FlashLightToggle"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Sensor'
end object
// Reference: MeleeEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
begin object name="ClassicSecondaryEffectParams_TacKnife" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTRS04Stab'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTRS04Stab'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTRS04Stab'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
begin object name="ClassicSecondaryFireParams_TacKnife" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Stab"
	FireEffectParams[0]=MeleeEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_TacKnife'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Tac Light"
	LayoutTags="flash,light"
	InventorySize=2
	ReloadAnimRate=1.2000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.0700000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-256)
	ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Blind'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="RDS"
	InventorySize=2
	ReloadAnimRate=1.2000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.9000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-256)
	WeaponBoneScales[0]=(BoneName="LightModule",Slot=4,Scale=0.0000000)
	ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="Slide",Scale=0.0750000,AugmentOffset=(X=1.4000000,Y=-1.0000000,Z=0.0000000),AugmentRot=(Pitch=32768,Yaw=0,Roll=-16384))
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_TacKnife'
begin object name="ClassicParams_TacKnife" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Tac Knife"
	LayoutTags="tacknife,light"
	InventorySize=2
	ReloadAnimRate=1.2000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-3.5000000,Y=-0.0300000,Z=1.0700000)
	ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
	LayoutMesh=SkeletalMesh'BWBP_SKC_Anim.RS04Melee_FPm'
	MagAmmo=8
	bNeedCock=true
	bDualBlocked=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_TacKnife'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicParams_Sensor'
begin object name="ClassicParams_Sensor" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Sensor"
	LayoutTags="sensor"
	InventorySize=2
	ReloadAnimRate=1.2000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightOffset=(X=-3.5000000,Y=0.2000000,Z=1.0700000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-256)
	WeaponBoneScales[0]=(BoneName="LightModule",Slot=4,Scale=0.0000000)
	ViewOffset=(X=0.0000000,Y=6.0000000,Z=-3.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Tazer',BoneName="Muzzle",Scale=0.0300000,AugmentOffset=(X=-2.5000000,Y=1.5000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=0,Roll=-16384))
	MagAmmo=8
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.RS04WeaponParamsClassic.ClassicSecondaryFireParams_Sensor'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Tan'
begin object name="RS04_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Tan"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Black'
begin object name="RS04_Black" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-MainShineX1",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_TwoTone'
begin object name="RS04_TwoTone" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Two-Tone"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-MainShineX2",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Jungle'
begin object name="RS04_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-UC-CamoJungle",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Hunter'
begin object name="RS04_Hunter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Hunter"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-R-CamoHunter",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_Autumn'
begin object name="RS04_Autumn" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Autumn"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-R-CamoAutumn",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.RS04WeaponParamsClassic.RS04_RedTiger'
begin object name="RS04_RedTiger" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Red Tiger"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RS04Camos.RS04-X-CamoTiger",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
