class XOXOWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.3000000
		SightOffset=(X=5.0000000,Y=0.6750000,Z=-0.1500000)
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=70
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukeRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.FastAimParams'
		AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.BombAimParams'
		AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.LustAimParams'
		AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.NukeAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsComp.XOXO_Pink'
	begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Love"
	end object
	Camos[0]=XOXO_Pink
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsComp.XOXO_Purple'
	begin object name="XOXO_Purple" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Lust"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XOXOCamos.XOXOPurpleCamo-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XOXO_Purple
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastPrimaryEffectParams'
begin object name="ArenaFastPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=48.0000000
	DamageRadius=48.0000000
	MomentumTransfer=-1000.0000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastPrimaryFireParams'
begin object name="ArenaFastPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	AmmoPerFire=3
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombPrimaryEffectParams'
begin object name="ArenaBombPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	AccelSpeed=100000.0000000
	Damage=100.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=-30000.0000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-FireBig',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombPrimaryFireParams'
begin object name="ArenaBombPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	AmmoPerFire=35
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustPrimaryEffectParams'
begin object name="ArenaLustPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=80.0000000
	MomentumTransfer=4000.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustPrimaryFireParams'
begin object name="ArenaLustPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=10
	FireAnim="LustWave"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukePrimaryEffectParams'
begin object name="ArenaNukePrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXONukeProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=100000.0000000
	Damage=250.0000000
	DamageRadius=2048.0000000
	MomentumTransfer=100.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Sexplosion-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukePrimaryFireParams'
begin object name="ArenaNukePrimaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukePrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=13
	DamageType=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStream'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastRecoilParams'
begin object name="ArenaFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombRecoilParams'
begin object name="ArenaBombRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
	HipMultiplier=1.5000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustRecoilParams'
begin object name="ArenaLustRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukeRecoilParams'
begin object name="ArenaNukeRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	ClimbTime=0.0800000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.FastAimParams'
begin object name="FastAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=378)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.BombAimParams'
begin object name="BombAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.LustAimParams'
begin object name="LustAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.NukeAimParams'
begin object name="NukeAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.3000000
	SightOffset=(X=5.0000000,Y=0.6750000,Z=-0.1500000)
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=70
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukeRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.FastAimParams'
	AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.BombAimParams'
	AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.LustAimParams'
	AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsComp.NukeAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaFastPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaBombPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaLustPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaNukePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsComp.XOXO_Pink'
begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Love"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsComp.XOXO_Purple'
begin object name="XOXO_Purple" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Lust"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XOXOCamos.XOXOPurpleCamo-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
