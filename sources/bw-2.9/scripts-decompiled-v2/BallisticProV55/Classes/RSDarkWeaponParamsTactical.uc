class RSDarkWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		DisplaceDurationMult=0.7500000
		MagAmmo=24
		WeaponModes[0]=(ModeName="Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Flame",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Cone Immolation",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Fire Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltRecoilParams'
		RecoilParams[1]=RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltFireParams'
		FireParams[1]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastFireParams'
		FireParams[2]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFlameFireParams'
		FireParams[3]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalConeFireParams'
		FireParams[4]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBombFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_Crimson'
	begin object name="DS_Crimson" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Crimson"
	end object
	Camos[0]=DS_Crimson
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_Corrupt'
	begin object name="DS_Corrupt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Corrupt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S2",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=DS_Corrupt
	// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_BloodRed'
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
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltEffectParams'
begin object name="TacticalBoltEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=135.0000000
	DamageRadius=128.0000000
	MomentumTransfer=10000.0000000
	HeadMult=2.5000000
	MuzzleFlashClass=Class'BallisticProV55.RSDarkSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltFireParams'
begin object name="TacticalBoltFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	AmmoPerFire=5
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastEffectParams'
begin object name="TacticalFastEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFastProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=60.0000000
	MomentumTransfer=100.0000000
	HeadMult=2.5000000
	MuzzleFlashClass=Class'BallisticProV55.RSDarkFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastFireParams'
begin object name="TacticalFastFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1450000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFlameEffectParams'
begin object name="TacticalFlameEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFlameProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	Damage=12.0000000
	DamageRadius=192.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSDarkSlowMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFlameFireParams'
begin object name="TacticalFlameFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="DarkFlamer"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFlameEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalConeEffectParams'
begin object name="TacticalConeEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=50.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSDarkFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-AltFireStart',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=7.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalConeFireParams'
begin object name="TacticalConeFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Immolate"
	FireLoopAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalConeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBombEffectParams'
begin object name="TacticalBombEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.RSDarkFireBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=4000.0000000
	MaxSpeed=4000.0000000
	Damage=150.0000000
	DamageRadius=378.0000000
	MomentumTransfer=80000.0000000
	MuzzleFlashClass=Class'BallisticProV55.RSDarkFastMuzzleFlash'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-FireBall',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.1500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBombFireParams'
begin object name="TacticalBombFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=4
	TargetState="Fireball"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBombEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
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
// Reference: FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireAnim="SawStart"
	FireEndAnim="SawEnd"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltRecoilParams'
begin object name="TacticalBoltRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=0.8000000
	ClimbTime=0.0600000
	DeclineTime=0.7500000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
end object
// Reference: RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastRecoilParams'
begin object name="TacticalFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0600000),(InVal=0.2000000,OutVal=0.0800000),(InVal=0.3000000,OutVal=0.1800000),(InVal=0.6000000,OutVal=0.2400000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.3500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	DisplaceDurationMult=0.7500000
	MagAmmo=24
	WeaponModes[0]=(ModeName="Bolt",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Flame",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Cone Immolation",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Fire Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltRecoilParams'
	RecoilParams[1]=RecoilParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBoltFireParams'
	FireParams[1]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFastFireParams'
	FireParams[2]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalFlameFireParams'
	FireParams[3]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalConeFireParams'
	FireParams[4]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalBombFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RSDarkWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_Crimson'
begin object name="DS_Crimson" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Crimson"
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_Corrupt'
begin object name="DS_Corrupt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Corrupt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S2",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.RSDarkWeaponParamsTactical.DS_BloodRed'
begin object name="DS_BloodRed" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Archdemon"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.DSCamos.DS_Weapon_S1",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
