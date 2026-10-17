class A73WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		WeaponName="A77 Plasma Rifle"
		AllowedCamos[0]=0
		MagAmmo=48
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams_CQC'
	begin object name="RealisticParams_CQC" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		WeaponName="A77 Plasma Rifle"
		AllowedCamos[0]=1
		MagAmmo=48
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Rapid'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Rapid'
	end object
	Layouts[1]=RealisticParams_CQC
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams_Elite'
	begin object name="RealisticParams_Elite" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2100000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		WeaponName="A77 Plasma Rifle"
		AllowedCamos[0]=2
		MagAmmo=48
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Elite'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Elite'
	end object
	Layouts[2]=RealisticParams_Elite
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Blue'
	begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A73_Blue
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Pink'
	begin object name="A73_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73AmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73SkinB',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73.A73BladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=A73_Pink
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Orange'
	begin object name="A73_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BSkin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BSkin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BSkinB0',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BBladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
		Index=2
	end object
	Camos[2]=A73_Orange
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.5000000
	YawFactor=0.2000000
	XRandFactor=0.2700000
	YRandFactor=0.2700000
	MaxRecoil=1280.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=1792)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-4096,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.4000000
	ChaosSpeedThreshold=525
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73Projectile'
	SpawnOffset=(X=-5.0000000,Y=6.0000000,Z=-4.0000000)
	Speed=1350.0000000
	MaxSpeed=6000.0000000
	AccelSpeed=18000.0000000
	Damage=67.0000000
	DamageRadius=72.0000000
	MomentumTransfer=200.0000000
	LimbMult=0.6500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Inaccuracy=(X=72,Y=72)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.2500000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams_Rapid'
begin object name="RealisticPrimaryEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileBal'
	SpawnOffset=(X=-5.0000000,Y=6.0000000,Z=-4.0000000)
	Speed=850.0000000
	MaxSpeed=5000.0000000
	AccelSpeed=13000.0000000
	Damage=37.0000000
	DamageRadius=72.0000000
	MomentumTransfer=200.0000000
	LimbMult=0.6500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.3000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Inaccuracy=(X=72,Y=72)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Rapid'
begin object name="RealisticPrimaryFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams_Elite'
begin object name="RealisticPrimaryEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileB'
	SpawnOffset=(X=-5.0000000,Y=6.0000000,Z=-4.0000000)
	Speed=1850.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=18000.0000000
	Damage=87.0000000
	DamageRadius=72.0000000
	MomentumTransfer=200.0000000
	LimbMult=0.6500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Inaccuracy=(X=72,Y=72)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Elite'
begin object name="RealisticPrimaryFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.1350000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryEffectParams_Elite'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectile'
	SpawnOffset=(X=5.0000000,Y=6.0000000,Z=-4.0000000)
	Speed=400.0000000
	MaxSpeed=4200.0000000
	AccelSpeed=8000.0000000
	Damage=150.0000000
	DamageRadius=200.0000000
	MomentumTransfer=100000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.1000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=960.0000000
	Chaos=0.2500000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=6
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams_Rapid'
begin object name="RealisticSecondaryEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileBal'
	SpawnOffset=(X=5.0000000,Y=6.0000000,Z=-4.0000000)
	Speed=400.0000000
	MaxSpeed=4200.0000000
	AccelSpeed=8000.0000000
	Damage=150.0000000
	DamageRadius=200.0000000
	MomentumTransfer=100000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.1000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=960.0000000
	Chaos=0.2500000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Rapid'
begin object name="RealisticSecondaryFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=6
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams_Elite'
begin object name="RealisticSecondaryEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileB'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=1500.0000000
	MaxSpeed=2000.0000000
	Damage=165.0000000
	DamageRadius=280.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1460.0000000
	Chaos=0.0200000
	SplashDamage=true
	RecommendSplashDamage=true
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Elite'
begin object name="RealisticSecondaryFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=16
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryEffectParams_Elite'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	WeaponName="A77 Plasma Rifle"
	AllowedCamos[0]=0
	MagAmmo=48
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams_CQC'
begin object name="RealisticParams_CQC" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	WeaponName="A77 Plasma Rifle"
	AllowedCamos[0]=1
	MagAmmo=48
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Rapid'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Rapid'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsRealistic.RealisticParams_Elite'
begin object name="RealisticParams_Elite" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2100000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	WeaponName="A77 Plasma Rifle"
	AllowedCamos[0]=2
	MagAmmo=48
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticPrimaryFireParams_Elite'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsRealistic.RealisticSecondaryFireParams_Elite'
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Blue'
begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Pink'
begin object name="A73_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73AmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73SkinB',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73.A73BladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsRealistic.A73_Orange'
begin object name="A73_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BSkin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BSkin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BSkinB0',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73RedLayout.A73BBladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
	Index=2
end object
