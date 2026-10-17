class BRINKAssaultRifleWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightOffset=(X=-20.0000000,Y=-0.4000000,Z=16.2000000)
		ViewOffset=(X=8.0000000,Y=5.5000000,Z=-11.5000000)
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Blue'
	begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=BRINK_Blue
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Jungle'
	begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=BRINK_Jungle
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Winter'
	begin object name="BRINK_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=BRINK_Winter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.8000000
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	WaterTraceRange=12000.0000000
	Damage=24
	HeadMult=3.5000000
	LimbMult=0.4500000
	DamageType=Class'BWBP_SWC_Pro.DTBRINKAssault'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTBRINKAssaultHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTBRINKAssault'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SWC_Pro.BRINKFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=140.0000000
	Chaos=0.0200000
	Inaccuracy=(X=32,Y=4)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=0.1000000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.BRINKRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=600.0000000
	MaxSpeed=14000.0000000
	Damage=100.0000000
	DamageRadius=500.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
end object
// Reference: RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.1500000),(InVal=0.4800000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.7500000,OutVal=0.0500000),(InVal=0.9000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=3048)
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-1000,Yaw=-3096,Roll=0)
	ViewBindFactor=0.3000000
	JumpChaos=0.4500000
	FallingChaos=0.4500000
	SprintChaos=0.4500000
	ChaosDeclineTime=1.5000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightOffset=(X=-20.0000000,Y=-0.4000000,Z=16.2000000)
	ViewOffset=(X=8.0000000,Y=5.5000000,Z=-11.5000000)
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Blue'
begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Jungle'
begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsClassic.BRINK_Winter'
begin object name="BRINK_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
