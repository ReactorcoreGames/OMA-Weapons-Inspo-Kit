class RCS715WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Shot"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
		WeaponName="RCS-715 12ga Auto-Shotgun"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticParams_Frag'
	begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Frag"
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5000000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
		WeaponName="RCS-715 12ga Auto-Shotgun (FRAG)"
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Frag
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Red'
	begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=RCS_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Yellow'
	begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
		Index=1
	end object
	Camos[1]=RCS_Yellow
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Jungle'
	begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
		Index=2
	end object
	Camos[2]=RCS_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Arctic'
	begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
		Index=3
	end object
	Camos[3]=RCS_Arctic
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Clown'
	begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Clown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
		Index=4
	end object
	Camos[4]=RCS_Clown
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=0
	FireAnim="GLFire"
	FireAnimRate=1.2500000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.4500000,OutVal=0.3500000),(InVal=0.6500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3500000),(InVal=0.7500000,OutVal=0.4500000),(InVal=1.0000000,OutVal=0.4000000)))
	YawFactor=0.2000000
	XRandFactor=0.2800000
	YRandFactor=0.2800000
	MaxRecoil=3600.0000000
	DeclineTime=0.9000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.0600000
	ADSViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1280)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ViewBindFactor=0.0600000
	JumpChaos=1.0000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=1.4000000
	ChaosSpeedThreshold=565
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=600.0000000,Max=3000.0000000)
	WaterTraceRange=5000.0000000
	Damage=16
	HeadMult=2.0500000
	LimbMult=0.6000000
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_RCS715ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	PenetrationEnergy=5.0000000
	PenetrateForce=8
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M763FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Single',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=900.0000000
	Chaos=0.1500000
	Inaccuracy=(X=700,Y=700)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
begin object name="RealisticPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=90.0000000
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=550000.0000000
	AccelSpeed=550000.0000000
	Damage=125.0000000
	DamageRadius=200.0000000
	MomentumTransfer=30000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.RCS715FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.AssaultShotgun.RCS-FireFrag',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1400.0000000
	Chaos=0.2500000
	Inaccuracy=(X=64,Y=64)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
begin object name="RealisticPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.2200000
	TargetState="Projectile"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	FireEffectParams[0]=GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryEffectParams_Frag'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Projectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=4000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=50.0000000
	DamageRadius=128.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=650.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Shot"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
	WeaponName="RCS-715 12ga Auto-Shotgun"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticParams_Frag'
begin object name="RealisticParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Frag"
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5000000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
	WeaponName="RCS-715 12ga Auto-Shotgun (FRAG)"
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Red'
begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Yellow'
begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Jungle'
begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Arctic'
begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsRealistic.RCS_Clown'
begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Clown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
	Index=4
end object
