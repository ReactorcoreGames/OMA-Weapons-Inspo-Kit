class A42WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Standard"
		InventorySize=2
		SightingTime=0.2000000
		SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		AllowedCamos[0]=0
		DisplaceDurationMult=0.5000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.A42WeaponParamsComp.ArenaParams_Tri'
	begin object name="ArenaParams_Tri" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Elite"
		LayoutTags="elite"
		InventorySize=2
		SightingTime=0.2000000
		SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		AllowedCamos[0]=1
		DisplaceDurationMult=0.5000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams_Tri'
		AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamFireParams'
	end object
	Layouts[1]=ArenaParams_Tri
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsComp.A42_Blue'
	begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A42_Blue
	// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsComp.A42_Red'
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
// Reference: AimParams'BallisticProV55.A42WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=128)
	ADSMultiplier=2.0000000
	ChaosDeclineTime=0.4500000
end object
// Reference: RecoilParams'BallisticProV55.A42WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.4000000,OutVal=0.0800000),(InVal=0.6000000,OutVal=0.0200000),(InVal=0.7000000,OutVal=0.1000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.3500000),(InVal=0.5500000,OutVal=0.5500000),(InVal=0.7000000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0300000
	DeclineTime=0.7500000
	DeclineDelay=0.1950000
	ViewBindFactor=0.5000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamFireParams'
begin object name="ArenaBeamFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=7
	FireAnim="SecFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaProjEffectParams'
begin object name="ArenaProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=3000.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=60000.0000000
	Damage=38.0000000
	DamageRadius=48.0000000
	MaxDamageGainFactor=0.3500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	Chaos=0.1300000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams'
begin object name="ArenaProjFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaProjEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaProjEffectParams_Tri'
begin object name="ArenaProjEffectParams_Tri" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.A42ProjectileBal'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	Speed=3000.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=60000.0000000
	Damage=18.0000000
	DamageRadius=48.0000000
	MaxDamageGainFactor=0.3500000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitterBal'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Fire',Volume=0.7500000,Radius=512.0000000,Slot=0,Pitch=1.1000000,bAtten=false,bNoOverride=true)
	Recoil=280.0000000
	Chaos=0.1300000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams_Tri'
begin object name="ArenaProjFireParams_Tri" class=BCoreProV55.FireParams
	FireInterval=0.2400000
	TargetState="SpreadShot"
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaProjEffectParams_Tri'
end object
// Reference: InstantEffectParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamEffectParams'
begin object name="ArenaBeamEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	Damage=65
	DamageType=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeHead=Class'BallisticProV55.DTA42SkrithBeam'
	DamageTypeArm=Class'BallisticProV55.DTA42SkrithBeam'
	PenetrateForce=150
	MomentumTransfer=80000
	MuzzleFlashClass=Class'BallisticProV55.A42FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-SecFire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Standard"
	InventorySize=2
	SightingTime=0.2000000
	SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	AllowedCamos[0]=0
	DisplaceDurationMult=0.5000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamFireParams'
end object
// Reference: WeaponParams'BallisticProV55.A42WeaponParamsComp.ArenaParams_Tri'
begin object name="ArenaParams_Tri" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Elite"
	LayoutTags="elite"
	InventorySize=2
	SightingTime=0.2000000
	SightOffset=(X=-80.0000000,Y=-6.0000000,Z=18.2500000)
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	AllowedCamos[0]=1
	DisplaceDurationMult=0.5000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.A42WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A42WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaProjFireParams_Tri'
	AltFireParams[0]=FireParams'BallisticProV55.A42WeaponParamsComp.ArenaBeamFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsComp.A42_Blue'
begin object name="A42_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.A42WeaponParamsComp.A42_Red'
begin object name="A42_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.A42Layouts.A48Skin_SD',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
