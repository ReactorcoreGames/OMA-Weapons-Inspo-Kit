class A42WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-40.0000000,Y=-6.7000000,Z=17.5000000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=-768)
		ViewOffset=(X=20.0000000,Y=25.0000000,Z=-15.0000000)
		AllowedCamos[0]=0
		MagAmmo=60
		bDualMixing=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsClassic.ClassicParams_R'
	begin object name="ClassicParams_R" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="elite"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=-40.0000000,Y=-6.0000000,Z=18.2500000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		ViewOffset=(X=20.0000000,Y=25.0000000,Z=-15.0000000)
		AllowedCamos[0]=1
		MagAmmo=72
		bDualMixing=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams-Red'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_R
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsClassic.A42_Blue'
	begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A42_Blue
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsClassic.A42_Red'
	begin object name="A42_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.A42Layouts.A48Skin_SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=A42_Red
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.A42WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=2048)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=1300
end object
// Reference: RecoilParams'BallisticProV55.A42WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=-0.5000000),(InVal=0.7000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.2000000),(InVal=0.7000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=512.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.1000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=8
	BurstFireRateFactor=1.0000000
	FireAnim="SecFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=50.0000000
	MaxSpeed=8000.0000000
	AccelSpeed=60000.0000000
	Damage=22.0000000
	DamageRadius=48.0000000
	MomentumTransfer=100.0000000
	LimbMult=0.5500000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=24.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.3000000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryEffectParams-Red'
begin object name="ClassicPrimaryEffectParams-Red" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42ProjectileBal'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=50.0000000
	MaxSpeed=8000.0000000
	AccelSpeed=60000.0000000
	Damage=15.0000000
	DamageRadius=48.0000000
	MomentumTransfer=100.0000000
	LimbMult=0.5500000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=4)
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams-Red'
begin object name="ClassicPrimaryFireParams-Red" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	TargetState="SpreadShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryEffectParams-Red'
end object
// Reference: InstantEffectParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	WaterTraceRange=5000.0000000
	Damage=65
	HeadMult=1.6000000
	LimbMult=0.4000000
	DamageType=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeHead=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeArm=Class'BallisticProV55.DTA42SkrithBeam'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-SecFire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-40.0000000,Y=-6.7000000,Z=17.5000000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=-768)
	ViewOffset=(X=20.0000000,Y=25.0000000,Z=-15.0000000)
	AllowedCamos[0]=0
	MagAmmo=60
	bDualMixing=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsClassic.ClassicParams_R'
begin object name="ClassicParams_R" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="elite"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=-40.0000000,Y=-6.0000000,Z=18.2500000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	ViewOffset=(X=20.0000000,Y=25.0000000,Z=-15.0000000)
	AllowedCamos[0]=1
	MagAmmo=72
	bDualMixing=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicPrimaryFireParams-Red'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsClassic.A42_Blue'
begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsClassic.A42_Red'
begin object name="A42_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.A42Layouts.A48Skin_SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
