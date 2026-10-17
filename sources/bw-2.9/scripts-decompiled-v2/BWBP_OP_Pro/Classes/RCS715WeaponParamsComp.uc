class RCS715WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Shot"
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5500000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
		WeaponName="RCS-715 Tactical Buster"
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaParams_Frag'
	begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="12ga Frag"
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5500000
		SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
		WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
		WeaponName="RCS-715 Tactical Buster"
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Frag
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Red'
	begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=RCS_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Yellow'
	begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Yellow"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
		Index=1
	end object
	Camos[1]=RCS_Yellow
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Jungle'
	begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
		Index=2
	end object
	Camos[2]=RCS_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Arctic'
	begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
		Index=3
	end object
	Camos[3]=RCS_Arctic
	// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Clown'
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
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=0
	FireAnim="GLFire"
	FireAnimRate=1.2500000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.5000000,OutVal=0.2500000),(InVal=0.7500000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0500000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.4000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	ADSMultiplier=0.6000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_RCSShotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.3000000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_RCS715ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_RCS715Shotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.XMV-850.XMV-Fire-3',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	PushbackForce=150.0000000
	Chaos=0.5000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryEffectParams_Frag'
begin object name="ArenaPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=60.0000000
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=300000.0000000
	AccelSpeed=150000.0000000
	Damage=60.0000000
	DamageRadius=256.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.AssaultShotgun.RCS-FireFrag',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams_Frag'
begin object name="ArenaPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="Projectile"
	FireEndAnim="None"
	FireAnimRate=2.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryEffectParams_Frag'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RCS715Projectile'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=4200.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=3000.0000000
	Damage=60.0000000
	DamageRadius=256.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MK781FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.GL-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=650.0000000
	PushbackForce=180.0000000
	Chaos=0.4500000
	BotRefireRate=0.6000000
	WarnTargetPct=0.4000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Shot"
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=1.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="LadderSightHinge",Slot=8,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="LadderSight",Slot=9,Scale=0.0000000)
	WeaponName="RCS-715 Tactical Buster"
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaParams_Frag'
begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="12ga Frag"
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5500000
	SightOffset=(X=0.0000000,Y=0.0000000,Z=3.4000000)
	WeaponBoneScales[0]=(BoneName="None",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="RedDotSight",Slot=8,Scale=0.0000000)
	WeaponName="RCS-715 Tactical Buster"
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RCS715WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Red'
begin object name="RCS_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Yellow'
begin object name="RCS_Yellow" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Yellow"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainYellowShine",Index=1,pIndex=39,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Jungle'
begin object name="RCS_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainJungleShine",Index=1,pIndex=39,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Arctic'
begin object name="RCS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainArcticShine",Index=1,pIndex=39,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RCS715WeaponParamsComp.RCS_Clown'
begin object name="RCS_Clown" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Clown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BusterCamos.Blaster-MainClownShine",Index=1,pIndex=39,AIndex=0)
	Index=4
end object
