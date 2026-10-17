class RSDarkWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		LayoutName="Standard"
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=1400,Yaw=0,Roll=0)
		MagAmmo=66
		RecoilParams[0]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[2]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[3]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[4]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
		AimParams[1]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
		AimParams[2]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
		AimParams[3]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
		AimParams[4]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBoltFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFlameFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicConeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBombFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_Crimson'
	begin object name="DS_Crimson" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Crimson"
	end object
	Camos[0]=DS_Crimson
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_Corrupt'
	begin object name="DS_Corrupt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Corrupt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=DS_Corrupt
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_BloodRed'
	begin object name="DS_BloodRed" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Archdemon"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S1",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=DS_BloodRed
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=2048)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=-5000,Yaw=-1000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=1600
	ChaosTurnThreshold=150000
end object
// Reference: RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=-0.1500000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=-1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBoltEffectParams'
begin object name="ClassicBoltEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=500.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=16000.0000000
	Damage=80.0000000
	DamageRadius=192.0000000
	MomentumTransfer=80000.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.RSDarkSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.0200000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBoltFireParams'
begin object name="ClassicBoltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=3
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBoltEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFastEffectParams'
begin object name="ClassicFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFastProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=50.0000000
	MaxSpeed=7000.0000000
	AccelSpeed=30000.0000000
	Damage=18.0000000
	DamageRadius=48.0000000
	MomentumTransfer=100.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.RSDarkFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=14.0000000
	Chaos=0.0050000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFastFireParams'
begin object name="ClassicFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFlameEffectParams'
begin object name="ClassicFlameEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFlameProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=1300.0000000
	MaxSpeed=1300.0000000
	Damage=12.0000000
	DamageRadius=192.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0150000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFlameFireParams'
begin object name="ClassicFlameFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="DarkFlamer"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFlameEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicConeEffectParams'
begin object name="ClassicConeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=50.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicConeFireParams'
begin object name="ClassicConeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Immolate"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicConeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBombEffectParams'
begin object name="ClassicBombEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFireBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=50.0000000
	MaxSpeed=1500.0000000
	Damage=120.0000000
	DamageRadius=384.0000000
	MomentumTransfer=80000.0000000
	HeadMult=1.3750000
	LimbMult=0.6250000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-FireBall',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=60.0000000
	Chaos=0.0200000
	Inaccuracy=(X=8,Y=8)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBombFireParams'
begin object name="ClassicBombFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=3
	TargetState="Fireball"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBombEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=180.0000000,Max=180.0000000)
	WaterTraceRange=5000.0000000
	DamageType=Class'BallisticProV55.DT_RSDarkStab'
	DamageTypeHead=Class'BallisticProV55.DT_RSDarkStabHead'
	DamageTypeArm=Class'BallisticProV55.DT_RSDarkStab'
	HookStopFactor=1.0000000
	HookPullForce=100.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-SawOpen',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	AmmoPerFire=0
	FireAnim="SawStart"
	FireEndAnim="SawEnd"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: WeaponParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	LayoutName="Standard"
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=1400,Yaw=0,Roll=0)
	MagAmmo=66
	RecoilParams[0]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[2]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[3]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[4]=RecoilParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
	AimParams[1]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
	AimParams[2]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
	AimParams[3]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
	AimParams[4]=AimParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBoltFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicFlameFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicConeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicBombFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_Crimson'
begin object name="DS_Crimson" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Crimson"
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_Corrupt'
begin object name="DS_Corrupt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Corrupt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsClassic.DS_BloodRed'
begin object name="DS_BloodRed" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Archdemon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S1",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
