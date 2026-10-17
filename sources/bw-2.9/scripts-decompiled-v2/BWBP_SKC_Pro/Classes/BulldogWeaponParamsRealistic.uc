class BulldogWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=200,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
		WeaponName="R20 Bulldog .75 Assault Cannon"
		MagAmmo=8
		bMagPlusOne=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.Bull_Red'
	begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=Bull_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.Bull_Wood'
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
// Reference: InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5500.0000000,Max=7000.0000000)
	WaterTraceRange=2100.0000000
	RangeAtten=0.1000000
	Damage=195
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
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=2.1000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-HFire',Volume=7.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3096.0000000
	Chaos=0.1500000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.6500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.BulldogRocketFast'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=35000.0000000
	Damage=150.0000000
	DamageRadius=200.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-FireTest',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=800.0000000
	Chaos=0.1500000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="SGFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.4500000
	XRandFactor=0.4500000
	YRandFactor=0.4500000
	DeclineTime=1.7000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=720,Max=3824)
	AimAdjustTime=0.6000000
	OffsetAdjustTime=0.3500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=200,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
	WeaponName="R20 Bulldog .75 Assault Cannon"
	MagAmmo=8
	bMagPlusOne=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.Bull_Red'
begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsRealistic.Bull_Wood'
begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	Index=1
end object
