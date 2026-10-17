class A49WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		PlayerJumpFactor=1.0500000
		InventorySize=4
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_Bomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams_Red'
	begin object name="ArenaParams_Red" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="charge"
		PlayerJumpFactor=1.0500000
		InventorySize=4
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_ChargeBomb'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[1]=ArenaParams_Red
	// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams_Pink'
	begin object name="ArenaParams_Pink" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="CQC"
		PlayerJumpFactor=1.0500000
		InventorySize=4
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		DisplaceDurationMult=0.5000000
		MagAmmo=32
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaProjFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[2]=ArenaParams_Pink
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
begin object name="ArenaAltFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2500000
	AmmoPerFire=8
	FireAnim="AltFire"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.0500000),(InVal=0.4000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=0.0700000),(InVal=0.7000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.4000000),(InVal=0.5400000,OutVal=0.6500000),(InVal=0.7000000,OutVal=0.7200000),(InVal=1.0000000,OutVal=0.3000000)))
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1700000
	ViewBindFactor=0.4000000
end object
// Reference: AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=512)
	AimAdjustTime=0.3500000
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=7500
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaProjEffectParams'
begin object name="ArenaProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49Projectile'
	SpawnOffset=(X=25.0000000,Y=6.0000000,Z=-8.0000000)
	Speed=5500.0000000
	MaxSpeed=8500.0000000
	AccelSpeed=100000.0000000
	Damage=40.0000000
	DamageRadius=48.0000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.2000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.2000000,bAtten=false,bNoOverride=true)
	Recoil=108.0000000
	Chaos=0.0700000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaProjFireParams'
begin object name="ArenaProjFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaProjEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryEffectParams_Bomb'
begin object name="ArenaPrimaryEffectParams_Bomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=80.0000000
	DamageRadius=100.0000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=880.0000000
	Chaos=0.3700000
	Heat=5.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_Bomb'
begin object name="ArenaPrimaryFireParams_Bomb" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	AmmoPerFire=8
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryEffectParams_Bomb'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryEffectParams_ChargeBomb'
begin object name="ArenaPrimaryEffectParams_ChargeBomb" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.A49LobProjectileRed'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=3000.0000000
	MaxSpeed=15000.0000000
	AccelSpeed=4000.0000000
	Damage=100.0000000
	DamageRadius=200.0000000
	DamageSpecial=60.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Autolaser.AutoLaser-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.3700000
	Heat=6.0000000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_ChargeBomb'
begin object name="ArenaPrimaryFireParams_ChargeBomb" class=BCoreProV55.FireParams
	FireInterval=1.4500000
	AmmoPerFire=8
	TargetState="ChargeFire"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryEffectParams_ChargeBomb'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltEffectParams'
begin object name="ArenaAltEffectParams" class=BCoreProV55.FireEffectParams
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A49FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A49.A49-ShockWave',Volume=2.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=1500.0000000
	Chaos=0.5000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	PlayerJumpFactor=1.0500000
	InventorySize=4
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	WeaponModes[0]=(ModeName="Concussive Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_Bomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams_Red'
begin object name="ArenaParams_Red" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="charge"
	PlayerJumpFactor=1.0500000
	InventorySize=4
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BWBP_SKC_Tex.A6Red.A49-RedFull',MaterialName="",Index=1,pIndex=0,AIndex=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	WeaponModes[0]=(ModeName="Charge Fire",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaPrimaryFireParams_ChargeBomb'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaParams_Pink'
begin object name="ArenaParams_Pink" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="CQC"
	PlayerJumpFactor=1.0500000
	InventorySize=4
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	DisplaceDurationMult=0.5000000
	MagAmmo=32
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Burst",bUnavailable=true,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaProjFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.A49WeaponParamsComp.ArenaAltFireParams'
end object
