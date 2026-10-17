class RCS715WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Shot"
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalParams_Frag'
	begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Frag"
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Frag
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Red'
	begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=RCS_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Yellow'
	begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
		Index=1
	end object
	Camos[1]=RCS_Yellow
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Jungle'
	begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
		Index=2
	end object
	Camos[2]=RCS_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Arctic'
	begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
		Index=3
	end object
	Camos[3]=RCS_Arctic
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Clown'
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
// Reference: AimParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=0
	FireAnim="GLFire"
	FireAnimRate=1.2500000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.2500000),(InVal=0.7500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0500000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_RCSShotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.3000000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_RCS715ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Single',Volume=1.1000000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=384.0000000
	PushbackForce=150.0000000
	Chaos=0.5000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
begin object name="TacticalPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=25.0000000
	bCombinedSplashImpact=true
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=500.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=800000.0000000
	Damage=75.0000000
	DamageRadius=200.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.AssaultShotgun.RCS-FireFrag',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
begin object name="TacticalPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="Projectile"
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Projectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=50.0000000
	DamageRadius=128.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=650.0000000
	PushbackForce=180.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Shot"
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalParams_Frag'
begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Frag"
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Red'
begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Yellow'
begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Jungle'
begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Arctic'
begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsTactical.RCS_Clown'
begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Clown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
	Index=4
end object
