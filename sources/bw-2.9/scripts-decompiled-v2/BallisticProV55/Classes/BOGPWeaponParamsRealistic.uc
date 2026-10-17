class BOGPWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=300,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
		ViewOffset=(X=3.0000000,Y=5.0000000,Z=-3.5000000)
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticGrenadeFireParams'
		FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticFlareFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_Red'
	begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=BORT_Red
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_White'
	begin object name="BORT_White" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=BORT_White
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_Flame'
	begin object name="BORT_Flame" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Radical"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.FGP",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=BORT_Flame
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticGrenadeEffectParams'
begin object name="RealisticGrenadeEffectParams" class=BCoreProV55.GrenadeEffectParams
	bOverrideArming=true
	ArmingDelay=0.2500000
	UnarmedDetonateOn=4
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	ProjectileClass=Class'BallisticProV55.BOGPGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2400.0000000
	Damage=180.0000000
	DamageRadius=400.0000000
	MomentumTransfer=30000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.BOGP.BOGP_Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticGrenadeFireParams'
begin object name="RealisticGrenadeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticGrenadeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticFlareEffectParams'
begin object name="RealisticFlareEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.BOGPFlare'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=7500.0000000
	AccelSpeed=100000.0000000
	Damage=50.0000000
	DamageRadius=64.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareFire',Volume=2.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=0.7000000
	Inaccuracy=(X=64,Y=64)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticFlareFireParams'
begin object name="RealisticFlareFireParams" class=BCoreProV55.FireParams
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticFlareEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Switch grenade"
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1280.0000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.9000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=600,Max=1024)
	CrouchMultiplier=0.9000000
	ADSMultiplier=0.9000000
	SprintOffset=(Pitch=-4608,Yaw=-512,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=300,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
	ViewOffset=(X=3.0000000,Y=5.0000000,Z=-3.5000000)
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticGrenadeFireParams'
	FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticFlareFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_Red'
begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_White'
begin object name="BORT_White" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsRealistic.BORT_Flame'
begin object name="BORT_Flame" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Radical"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.FGP",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
