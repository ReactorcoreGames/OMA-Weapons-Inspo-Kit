class A73WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
		AllowedCamos[0]=0
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams_CQC'
	begin object name="ClassicParams_CQC" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
		AllowedCamos[0]=1
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Rapid'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Rapid'
	end object
	Layouts[1]=ClassicParams_CQC
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams_Elite'
	begin object name="ClassicParams_Elite" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
		AllowedCamos[0]=2
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Elite'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Elite'
	end object
	Layouts[2]=ClassicParams_Elite
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Blue'
	begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A73_Blue
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Pink'
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
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Orange'
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
// Reference: RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.2700000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.1700000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=650
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2500.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=60000.0000000
	Damage=27.0000000
	DamageRadius=64.0000000
	MomentumTransfer=100.0000000
	HeadMult=2.1000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=45.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1150000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams_Rapid'
begin object name="ClassicPrimaryEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileBal'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=50.0000000
	MaxSpeed=3000.0000000
	AccelSpeed=60000.0000000
	Damage=20.0000000
	DamageRadius=74.0000000
	MomentumTransfer=100.0000000
	LimbMult=0.4500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=40.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Rapid'
begin object name="ClassicPrimaryFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams_Elite'
begin object name="ClassicPrimaryEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileB'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=85.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=100000.0000000
	Damage=40.0000000
	DamageRadius=64.0000000
	MomentumTransfer=100.0000000
	HeadMult=2.5000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=102.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=9,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Elite'
begin object name="ClassicPrimaryFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.1575000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryEffectParams_Elite'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=7000.0000000
	AccelSpeed=8000.0000000
	Damage=70.0000000
	DamageRadius=100.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=960.0000000
	Chaos=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=8
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams_Rapid'
begin object name="ClassicSecondaryEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileBal'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=7000.0000000
	AccelSpeed=8000.0000000
	Damage=70.0000000
	DamageRadius=100.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=960.0000000
	Chaos=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Rapid'
begin object name="ClassicSecondaryFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=8
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams_Elite'
begin object name="ClassicSecondaryEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileB'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=1500.0000000
	MaxSpeed=2000.0000000
	Damage=90.0000000
	DamageRadius=270.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=241.0000000
	Chaos=0.0200000
	SplashDamage=true
	RecommendSplashDamage=true
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Elite'
begin object name="ClassicSecondaryFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=10
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryEffectParams_Elite'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
	AllowedCamos[0]=0
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams_CQC'
begin object name="ClassicParams_CQC" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
	AllowedCamos[0]=1
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Rapid'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Rapid'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsClassic.ClassicParams_Elite'
begin object name="ClassicParams_Elite" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ViewOffset=(X=3.0000000,Y=13.0000000,Z=-6.0000000)
	AllowedCamos[0]=2
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicPrimaryFireParams_Elite'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsClassic.ClassicSecondaryFireParams_Elite'
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Blue'
begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Pink'
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
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsClassic.A73_Orange'
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
