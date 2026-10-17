class A73WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		AllowedCamos[0]=0
		MagAmmo=32
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams_CQC'
	begin object name="TacticalParams_CQC" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		AllowedCamos[0]=1
		MagAmmo=32
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Rapid'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Rapid'
	end object
	Layouts[1]=TacticalParams_CQC
	// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams_Elite'
	begin object name="TacticalParams_Elite" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		AllowedCamos[0]=2
		MagAmmo=32
		RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Elite'
		AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Elite'
	end object
	Layouts[2]=TacticalParams_Elite
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Blue'
	begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A73_Blue
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Pink'
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
	// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Orange'
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
// Reference: RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.0700000),(InVal=0.6000000,OutVal=-0.0600000),(InVal=0.7000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.4500000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0500000
	DeclineTime=0.7500000
	DeclineDelay=0.1250000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	AimDamageThreshold=75
	ChaosDeclineTime=1.3500000
	ChaosDeclineDelay=0.3000000
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams'
begin object name="TacticalProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73Projectile'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=50.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.0200000
	Heat=0.6000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams'
begin object name="TacticalProjFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams_Rapid'
begin object name="TacticalProjEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileBal'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=30.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A73.A73Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=130.0000000
	Chaos=0.0200000
	Heat=0.4000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Rapid'
begin object name="TacticalProjFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams_Elite'
begin object name="TacticalProjEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73ProjectileB'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=7500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=150000.0000000
	Damage=70.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.7500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=270.0000000
	Chaos=0.0200000
	Heat=0.8000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Elite'
begin object name="TacticalProjFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	AmmoPerFire=2
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjEffectParams_Elite'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams'
begin object name="TacticalPowerEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectile'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=100.0000000
	DamageRadius=192.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1536.0000000
	Chaos=0.5000000
	Heat=3.4000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams'
begin object name="TacticalPowerFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=8
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams_Rapid'
begin object name="TacticalPowerEffectParams_Rapid" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileBal'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=100.0000000
	DamageRadius=192.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1536.0000000
	Chaos=0.5000000
	Heat=3.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Rapid'
begin object name="TacticalPowerFireParams_Rapid" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=8
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams_Rapid'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams_Elite'
begin object name="TacticalPowerEffectParams_Elite" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A73PowerProjectileB'
	SpawnOffset=(X=30.0000000,Y=5.0000000,Z=-8.0000000)
	Speed=1500.0000000
	MaxSpeed=2000.0000000
	Damage=110.0000000
	DamageRadius=220.0000000
	MomentumTransfer=2000.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Power',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1536.0000000
	Chaos=0.5000000
	Heat=8.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Elite'
begin object name="TacticalPowerFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=16
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerEffectParams_Elite'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	AllowedCamos[0]=0
	MagAmmo=32
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams_CQC'
begin object name="TacticalParams_CQC" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	AllowedCamos[0]=1
	MagAmmo=32
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Rapid'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Rapid'
end object
// Reference: WeaponParams'BallisticProV55.A73WeaponParamsTactical.TacticalParams_Elite'
begin object name="TacticalParams_Elite" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	AllowedCamos[0]=2
	MagAmmo=32
	RecoilParams[0]=RecoilParams'BallisticProV55.A73WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A73WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalProjFireParams_Elite'
	AltFireParams[0]=FireParams'BallisticProV55.A73WeaponParamsTactical.TacticalPowerFireParams_Elite'
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Blue'
begin object name="A73_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Pink'
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
// Reference: WeaponCamo'BallisticProV55.A73WeaponParamsTactical.A73_Orange'
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
