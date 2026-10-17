class XOXOWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightingTime=0.3000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponName="Lustwave Staff"
		MagAmmo=66
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticBombPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticLustPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticNukePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsRealistic.XOXO_Pink'
	begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Love"
	end object
	Camos[0]=XOXO_Pink
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsRealistic.XOXO_Purple'
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
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastPrimaryEffectParams'
begin object name="RealisticFastPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=9000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=30000.0000000
	Damage=40.0000000
	DamageRadius=48.0000000
	MomentumTransfer=-1000.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Chaos=0.0100000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastPrimaryFireParams'
begin object name="RealisticFastPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1300000
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticBombPrimaryEffectParams'
begin object name="RealisticBombPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	MaxSpeed=2500.0000000
	AccelSpeed=20000.0000000
	Damage=80.0000000
	DamageRadius=1028.0000000
	MomentumTransfer=-30000.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-FireBig',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.0500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticBombPrimaryFireParams'
begin object name="RealisticBombPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	AmmoPerFire=10
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticBombPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticLustPrimaryEffectParams'
begin object name="RealisticLustPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=120.0000000
	MomentumTransfer=4000.0000000
	HeadMult=1.5000000
	LimbMult=0.8000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticLustPrimaryFireParams'
begin object name="RealisticLustPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=10
	FireAnim="LustWave"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticLustPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticNukePrimaryEffectParams'
begin object name="RealisticNukePrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXONukeProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=500.0000000
	MaxSpeed=4500.0000000
	AccelSpeed=100000.0000000
	Damage=500.0000000
	DamageRadius=4096.0000000
	MomentumTransfer=100.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Sexplosion-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticNukePrimaryFireParams'
begin object name="RealisticNukePrimaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticNukePrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=7
	DamageType=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStream'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastRecoilParams'
begin object name="RealisticFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=-0.1500000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=-1.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=0.7000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastAimParams'
begin object name="RealisticFastAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=768,Max=2048)
	AimAdjustTime=0.7000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ViewBindFactor=0.1000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightingTime=0.3000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponName="Lustwave Staff"
	MagAmmo=66
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticFastPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticBombPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticLustPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticNukePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsRealistic.XOXO_Pink'
begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Love"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsRealistic.XOXO_Purple'
begin object name="XOXO_Purple" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Lust"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XOXOCamos.XOXOPurpleCamo-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
