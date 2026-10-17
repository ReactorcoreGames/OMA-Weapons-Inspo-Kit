class A49WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponName="A49 Concussive Blaster"
		MagAmmo=40
		WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_Bomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams_Red'
	begin object name="RealisticParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="charge"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
		WeaponName="A49-E Concussive Blaster"
		MagAmmo=40
		WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_ChargeBomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
	end object
	Layouts[1]=RealisticParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams_Pink'
	begin object name="RealisticParams_Pink" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		InventorySize=5
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponName="A49-B Skrith Blaster"
		MagAmmo=40
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
	end object
	Layouts[2]=RealisticParams_Pink
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
begin object name="RealisticAltFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=10
	FireAnim="AltFire"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	CrouchMultiplier=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.7500000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	AimDamageThreshold=75
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=1000
	ChaosTurnThreshold=185000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams_Bomb'
begin object name="RealisticPrimaryEffectParams_Bomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=90.0000000
	DamageRadius=270.0000000
	MomentumTransfer=80000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=880.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_Bomb'
begin object name="RealisticPrimaryFireParams_Bomb" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams_Bomb'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams_ChargeBomb'
begin object name="RealisticPrimaryEffectParams_ChargeBomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectileRed'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=100.0000000
	DamageRadius=270.0000000
	DamageSpecial=60.0000000
	MomentumTransfer=80000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5700000
	Heat=6.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_ChargeBomb'
begin object name="RealisticPrimaryFireParams_ChargeBomb" class=BCoreProV55.FireParams
	FireInterval=1.8500000
	AmmoPerFire=10
	TargetState="ChargeFire"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams_ChargeBomb'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49Projectile'
	SpawnOffset=(X=25.0000000,Y=6.0000000,Z=-8.0000000)
	Speed=4000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=60000.0000000
	Damage=45.0000000
	DamageRadius=48.0000000
	HeadMult=2.5000000
	LimbMult=0.6700000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.1500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=108.0000000
	Chaos=0.0700000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1150000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltEffectParams'
begin object name="RealisticAltEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-ShockWave',Volume=2.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=2000.0000000
	Chaos=0.5000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponName="A49 Concussive Blaster"
	MagAmmo=40
	WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_Bomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams_Red'
begin object name="RealisticParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="charge"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
	WeaponName="A49-E Concussive Blaster"
	MagAmmo=40
	WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams_ChargeBomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticParams_Pink'
begin object name="RealisticParams_Pink" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	InventorySize=5
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponName="A49-B Skrith Blaster"
	MagAmmo=40
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsRealistic.RealisticAltFireParams'
end object
