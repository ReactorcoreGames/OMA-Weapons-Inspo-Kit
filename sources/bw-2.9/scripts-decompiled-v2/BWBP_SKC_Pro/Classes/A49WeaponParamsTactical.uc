class A49WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_Bomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams_Red'
	begin object name="TacticalParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="charge"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_ChargeBomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[1]=TacticalParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams_Pink'
	begin object name="TacticalParams_Pink" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalProjFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[2]=TacticalParams_Pink
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
begin object name="TacticalAltFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	AmmoPerFire=8
	FireAnim="AltFire"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.0500000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.0700000),(InVal=0.7000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.4000000),(InVal=0.5400000,OutVal=0.6500000),(InVal=0.7000000,OutVal=0.7200000),(InVal=1.0000000,OutVal=0.3000000)))
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1700000
	ViewBindFactor=0.4000000
	ADSViewBindFactor=0.7000000
	MaxMoveMultiplier=2.0000000
end object
// Reference: AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalProjEffectParams'
begin object name="TacticalProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49Projectile'
	SpawnOffset=(X=25.0000000,Y=6.0000000,Z=-8.0000000)
	Speed=4000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=60000.0000000
	Damage=45.0000000
	DamageRadius=48.0000000
	HeadMult=2.5000000
	LimbMult=0.6700000
	MaxDamageGainFactor=0.3500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.1500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=108.0000000
	Chaos=0.0700000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalProjFireParams'
begin object name="TacticalProjFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1150000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalProjEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryEffectParams_Bomb'
begin object name="TacticalPrimaryEffectParams_Bomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=100.0000000
	DamageRadius=160.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=880.0000000
	Chaos=0.3700000
	Heat=5.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_Bomb'
begin object name="TacticalPrimaryFireParams_Bomb" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=8
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryEffectParams_Bomb'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryEffectParams_ChargeBomb'
begin object name="TacticalPrimaryEffectParams_ChargeBomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectileRed'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=100.0000000
	DamageRadius=200.0000000
	DamageSpecial=60.0000000
	MaxDamageGainFactor=1.0000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.7000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5700000
	Heat=6.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_ChargeBomb'
begin object name="TacticalPrimaryFireParams_ChargeBomb" class=BCoreProV55.FireParams
	FireInterval=1.8500000
	AmmoPerFire=8
	TargetState="ChargeFire"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryEffectParams_ChargeBomb'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltEffectParams'
begin object name="TacticalAltEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-ShockWave',Volume=2.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=1500.0000000
	Chaos=0.5000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_Bomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams_Red'
begin object name="TacticalParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="charge"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalPrimaryFireParams_ChargeBomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalParams_Pink'
begin object name="TacticalParams_Pink" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalProjFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsTactical.TacticalAltFireParams'
end object
