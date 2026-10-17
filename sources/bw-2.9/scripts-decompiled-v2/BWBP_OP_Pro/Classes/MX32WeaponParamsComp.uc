class MX32WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.5500000
		DisplaceDurationMult=1.4000000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaFastRocketFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaGuidedRocketFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_White'
	begin object name="MX32_White" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="White"
	end object
	Camos[0]=MX32_White
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Desert'
	begin object name="MX32_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S2",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S2",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MX32_Desert
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Ruby'
	begin object name="MX32_Ruby" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ruby"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S3",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S3",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=MX32_Ruby
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Gold'
	begin object name="MX32_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S1",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S1",Index=2,pIndex=1,AIndex=1)
		Index=3
	end object
	Camos[3]=MX32_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_OP_Pro.DTMX32Primary'
	DamageTypeHead=Class'BWBP_OP_Pro.DTMX32PrimaryHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTMX32PrimaryLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.M51.M51-Fire444',Volume=1.8000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0300000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1130000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaFastRocketEffectParams'
begin object name="ArenaFastRocketEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.MX32Rocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=500.0000000
	MaxSpeed=30000.0000000
	AccelSpeed=10000.0000000
	Damage=40.0000000
	DamageRadius=256.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.AIMS-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=192.0000000
	Chaos=0.0600000
	Inaccuracy=(X=96,Y=48)
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaFastRocketFireParams'
begin object name="ArenaFastRocketFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireAnim="RocketFire"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaFastRocketEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaGuidedRocketEffectParams'
begin object name="ArenaGuidedRocketEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.MX32SeekerRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=500.0000000
	MaxSpeed=30000.0000000
	AccelSpeed=10000.0000000
	Damage=40.0000000
	DamageRadius=256.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.AIMS-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	Chaos=0.0400000
	Inaccuracy=(X=80,Y=40)
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaGuidedRocketFireParams'
begin object name="ArenaGuidedRocketFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireAnim="RocketFire"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaGuidedRocketEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0400000),(InVal=0.2000000,OutVal=-0.0200000),(InVal=0.3000000,OutVal=-0.0400000),(InVal=0.4000000,OutVal=0.0600000),(InVal=0.6000000,OutVal=0.0800000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=-0.0200000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2100000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	DeclineDelay=0.1600000
	ViewBindFactor=0.2000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1024)
	AimAdjustTime=0.5500000
	CrouchMultiplier=0.7500000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=1500,Roll=0)
	ChaosDeclineTime=0.8000000
	ChaosDeclineDelay=0.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.5500000
	DisplaceDurationMult=1.4000000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaFastRocketFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.MX32WeaponParamsComp.ArenaGuidedRocketFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_White'
begin object name="MX32_White" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="White"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Desert'
begin object name="MX32_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S2",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Ruby'
begin object name="MX32_Ruby" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ruby"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S3",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S3",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsComp.MX32_Gold'
begin object name="MX32_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S1",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
