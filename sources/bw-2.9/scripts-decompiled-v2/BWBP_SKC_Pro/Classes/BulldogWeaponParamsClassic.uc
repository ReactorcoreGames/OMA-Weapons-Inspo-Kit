class BulldogWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		SightPivot=(Pitch=200,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
		MagAmmo=8
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsClassic.Bull_Red'
	begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=Bull_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsClassic.Bull_Wood'
	begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=Bull_Wood
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5500.0000000,Max=7000.0000000)
	WaterTraceRange=2100.0000000
	RangeAtten=0.4000000
	Damage=105
	HeadMult=1.5000000
	LimbMult=0.7000000
	DamageType=Class'BWBP_SKC_Pro.DTBulldog'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBulldogHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBulldog'
	PenetrationEnergy=4.0000000
	PenetrateForce=250
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Bulldog.Bulldog-Fire',Volume=7.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=9)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	bOverrideArming=true
	ArmingDelay=0.0300000
	DetonateDelay=0.0300000
	UnarmedDetonateOn=1
	ArmedDetonateOn=1
	UnarmedPlayerImpactType=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BWBP_SKC_Pro.BulldogRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=35000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-FireTest',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1048.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="SGFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.4500000
	XRandFactor=0.4500000
	YRandFactor=0.4500000
	DeclineTime=0.7000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.3000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=3824)
	AimAdjustTime=0.6000000
	OffsetAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=650
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	SightPivot=(Pitch=200,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
	MagAmmo=8
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsClassic.Bull_Red'
begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsClassic.Bull_Wood'
begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	Index=1
end object
