class MX32WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		PlayerSpeedFactor=0.8700000
		PlayerJumpFactor=0.8700000
		InventorySize=7
		SightMoveSpeedFactor=0.7500000
		SightingTime=0.5500000
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-4.0000000)
		DisplaceDurationMult=1.4000000
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicFastRocketFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicGuidedRocketFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_White'
	begin object name="MX32_White" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="White"
	end object
	Camos[0]=MX32_White
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Desert'
	begin object name="MX32_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S2",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S2",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MX32_Desert
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Ruby'
	begin object name="MX32_Ruby" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Ruby"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S3",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S3",Index=2,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=MX32_Ruby
	// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Gold'
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
// Reference: InstantEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=12000.0000000)
	RangeAtten=0.9000000
	Damage=24
	HeadMult=3.1250000
	LimbMult=0.5000000
	DamageType=Class'BWBP_OP_Pro.DTMX32Primary'
	DamageTypeHead=Class'BWBP_OP_Pro.DTMX32PrimaryHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTMX32PrimaryLimb'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.MX32.MX32-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	Chaos=0.0300000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicFastRocketEffectParams'
begin object name="ClassicFastRocketEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.MX32Rocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=50.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.AIMS-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.0600000
	Inaccuracy=(X=96,Y=48)
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicFastRocketFireParams'
begin object name="ClassicFastRocketFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireAnim="RocketFire"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicFastRocketEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicGuidedRocketEffectParams'
begin object name="ClassicGuidedRocketEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.MX32SeekerRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=50.0000000
	DamageRadius=192.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.AIMS-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.0400000
	Inaccuracy=(X=80,Y=40)
	BotRefireRate=0.6000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicGuidedRocketFireParams'
begin object name="ClassicGuidedRocketFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireAnim="RocketFire"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicGuidedRocketEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0600000),(InVal=0.4000000,OutVal=0.2100000),(InVal=0.6500000,OutVal=0.2500000),(InVal=0.8000000,OutVal=0.0500000),(InVal=1.0000000,OutVal=0.1500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2100000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.8000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	DeclineTime=0.8000000
	DeclineDelay=0.5000000
	ViewBindFactor=0.2000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=3096)
	AimAdjustTime=0.5500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=1500,Roll=0)
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.4000000
	ChaosDeclineDelay=0.6000000
	ChaosSpeedThreshold=7000
end object
// Reference: WeaponParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	PlayerSpeedFactor=0.8700000
	PlayerJumpFactor=0.8700000
	InventorySize=7
	SightMoveSpeedFactor=0.7500000
	SightingTime=0.5500000
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-4.0000000)
	DisplaceDurationMult=1.4000000
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicFastRocketFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.MX32WeaponParamsClassic.ClassicGuidedRocketFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_White'
begin object name="MX32_White" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="White"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Desert'
begin object name="MX32_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S2",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Ruby'
begin object name="MX32_Ruby" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Ruby"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S3",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S3",Index=2,pIndex=1,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.MX32WeaponParamsClassic.MX32_Gold'
begin object name="MX32_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Weapon_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MX32Camos.MX32_Attach_S1",Index=2,pIndex=1,AIndex=1)
	Index=3
end object
