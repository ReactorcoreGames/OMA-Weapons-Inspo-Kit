class A49WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
		MagAmmo=40
		WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_Bomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams_Red'
	begin object name="ClassicParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="charge"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
		MagAmmo=40
		WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_ChargeBomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
	end object
	Layouts[1]=ClassicParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams_Pink'
	begin object name="ClassicParams_Pink" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		LayoutTags="mod_rof"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.3000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
		MagAmmo=40
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
	end object
	Layouts[2]=ClassicParams_Pink
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
begin object name="ClassicAltFireParams" class=BCoreProV55.FireParams
	FireInterval=1.7000000
	AmmoPerFire=10
	FireAnim="AltFire"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1500000,OutVal=0.1000000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=-0.2500000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0900000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.0500000),(InVal=500000.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=1024.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.6000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
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
	ChaosSpeedThreshold=900
	ChaosTurnThreshold=185000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=40.0000000
	MaxSpeed=8000.0000000
	AccelSpeed=60000.0000000
	Damage=15.0000000
	DamageRadius=48.0000000
	MomentumTransfer=100.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=24.0000000
	Chaos=-1.0000000
	Heat=0.5000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams_Bomb'
begin object name="ClassicPrimaryEffectParams_Bomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=80.0000000
	DamageRadius=340.0000000
	MomentumTransfer=80000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=880.0000000
	Chaos=-1.0000000
	Heat=5.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_Bomb'
begin object name="ClassicPrimaryFireParams_Bomb" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=10
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams_Bomb'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams_ChargeBomb'
begin object name="ClassicPrimaryEffectParams_ChargeBomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectileRed'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=80.0000000
	DamageRadius=340.0000000
	DamageSpecial=40.0000000
	MomentumTransfer=80000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=-1.0000000
	Heat=6.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_ChargeBomb'
begin object name="ClassicPrimaryFireParams_ChargeBomb" class=BCoreProV55.FireParams
	FireInterval=1.8500000
	AmmoPerFire=10
	TargetState="ChargeFire"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryEffectParams_ChargeBomb'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltEffectParams'
begin object name="ClassicAltEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-ShockWave',Volume=2.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=2000.0000000
	Chaos=0.5000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
	MagAmmo=40
	WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_Bomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams_Red'
begin object name="ClassicParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="charge"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
	MagAmmo=40
	WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams_ChargeBomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicParams_Pink'
begin object name="ClassicParams_Pink" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	LayoutTags="mod_rof"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.3000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	ViewOffset=(X=8.0000000,Y=8.0000000,Z=-5.0000000)
	MagAmmo=40
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsClassic.ClassicAltFireParams'
end object
