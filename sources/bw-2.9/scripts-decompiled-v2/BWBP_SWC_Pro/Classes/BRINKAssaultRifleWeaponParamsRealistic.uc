class BRINKAssaultRifleWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		CockAnimRate=0.9500000
		ReloadAnimRate=0.9500000
		SightOffset=(X=-20.0000000,Y=-0.4000000,Z=16.2000000)
		ViewOffset=(X=10.0000000,Y=4.5000000,Z=-11.5000000)
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Blue'
	begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=BRINK_Blue
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Jungle'
	begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=BRINK_Jungle
	// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Winter'
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
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.8000000
	PreFireTime=0.4500000
	PreFireAnim="GrenadePrep"
	FireAnim="GrenadeFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.3500000
	Damage=18
	DamageType=Class'BWBP_SWC_Pro.DTBRINKAssault'
	DamageTypeHead=Class'BWBP_SWC_Pro.DTBRINKAssaultHead'
	DamageTypeArm=Class'BWBP_SWC_Pro.DTBRINKAssault'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SWC_Pro.BRINKFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.BR1NK.BR1NK-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=140.0000000
	Chaos=0.0200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=0.1000000
	FireEndAnim="None"
	FireAnimRate=0.8500000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.1500000),(InVal=0.4800000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.7500000,OutVal=0.0500000),(InVal=0.9000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-3000,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=-1000,Yaw=-3096,Roll=0)
	ChaosDeclineTime=0.5000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	CockAnimRate=0.9500000
	ReloadAnimRate=0.9500000
	SightOffset=(X=-20.0000000,Y=-0.4000000,Z=16.2000000)
	ViewOffset=(X=10.0000000,Y=4.5000000,Z=-11.5000000)
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Blue'
begin object name="BRINK_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Jungle'
begin object name="BRINK_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.BrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.BRINKAssaultRifleWeaponParamsRealistic.BRINK_Winter'
begin object name="BRINK_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat1Shine",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.BRINKCamos.SnowBrinkMat2Shine",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
