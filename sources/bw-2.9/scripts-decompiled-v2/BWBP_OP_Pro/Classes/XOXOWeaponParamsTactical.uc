class XOXOWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=70
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastAimParams'
		AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombAimParams'
		AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustAimParams'
		AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsTactical.XOXO_Pink'
	begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Love"
	end object
	Camos[0]=XOXO_Pink
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsTactical.XOXO_Purple'
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
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastPrimaryEffectParams'
begin object name="TacticalFastPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=62.0000000
	DamageRadius=48.0000000
	MomentumTransfer=-1000.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastPrimaryFireParams'
begin object name="TacticalFastPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1700000
	AmmoPerFire=3
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombPrimaryEffectParams'
begin object name="TacticalBombPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	MaxSpeed=2500.0000000
	Damage=80.0000000
	DamageRadius=768.0000000
	MomentumTransfer=-30000.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-FireBig',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.2500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombPrimaryFireParams'
begin object name="TacticalBombPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	AmmoPerFire=35
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustPrimaryEffectParams'
begin object name="TacticalLustPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=120.0000000
	MomentumTransfer=4000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustPrimaryFireParams'
begin object name="TacticalLustPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=10
	FireAnim="LustWave"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukePrimaryEffectParams'
begin object name="TacticalNukePrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXONukeProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=100000.0000000
	Damage=350.0000000
	DamageRadius=2048.0000000
	MomentumTransfer=100.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Sexplosion-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukePrimaryFireParams'
begin object name="TacticalNukePrimaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukePrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=15
	HeadMult=2.5000000
	DamageType=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStream'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastRecoilParams'
begin object name="TacticalFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombRecoilParams'
begin object name="TacticalBombRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustRecoilParams'
begin object name="TacticalLustRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0600000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeRecoilParams'
begin object name="TacticalNukeRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	ClimbTime=0.0800000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastAimParams'
begin object name="TacticalFastAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombAimParams'
begin object name="TacticalBombAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustAimParams'
begin object name="TacticalLustAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeAimParams'
begin object name="TacticalNukeAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=70
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastAimParams'
	AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombAimParams'
	AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustAimParams'
	AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukeAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalFastPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalBombPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalLustPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalNukePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsTactical.XOXO_Pink'
begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Love"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsTactical.XOXO_Purple'
begin object name="XOXO_Purple" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Lust"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XOXOCamos.XOXOPurpleCamo-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
