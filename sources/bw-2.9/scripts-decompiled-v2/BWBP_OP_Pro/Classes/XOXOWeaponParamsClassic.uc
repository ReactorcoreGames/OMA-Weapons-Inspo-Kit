class XOXOWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		InventorySize=7
		SightingTime=0.3000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=70
		WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
		WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombRecoilParams'
		RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustRecoilParams'
		RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastAimParams'
		AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombAimParams'
		AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustAimParams'
		AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukePrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsClassic.XOXO_Pink'
	begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Love"
	end object
	Camos[0]=XOXO_Pink
	// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsClassic.XOXO_Purple'
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
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastPrimaryEffectParams'
begin object name="ClassicFastPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOProjectile'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=5000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=30000.0000000
	Damage=15.0000000
	DamageRadius=48.0000000
	MomentumTransfer=-1000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=160.0000000
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastPrimaryFireParams'
begin object name="ClassicFastPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	AmmoPerFire=2
	FireAnim="Fire2"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombPrimaryEffectParams'
begin object name="ClassicBombPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.XOXOBomb'
	SpawnOffset=(X=40.0000000,Y=8.0000000,Z=-10.0000000)
	Speed=2500.0000000
	MaxSpeed=2500.0000000
	AccelSpeed=20000.0000000
	Damage=60.0000000
	DamageRadius=1028.0000000
	MomentumTransfer=-30000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-FireBig',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.7500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombPrimaryFireParams'
begin object name="ClassicBombPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=10
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustPrimaryEffectParams'
begin object name="ClassicLustPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Damage=120.0000000
	MomentumTransfer=4000.0000000
	HeadMult=1.5000000
	LimbMult=0.8000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0600000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustPrimaryFireParams'
begin object name="ClassicLustPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=10
	FireAnim="LustWave"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukePrimaryEffectParams'
begin object name="ClassicNukePrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukePrimaryFireParams'
begin object name="ClassicNukePrimaryFireParams" class=BCoreProV55.FireParams
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukePrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=7
	DamageType=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStream'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	FireAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastRecoilParams'
begin object name="ClassicFastRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombRecoilParams'
begin object name="ClassicBombRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustRecoilParams'
begin object name="ClassicLustRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=1.5000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.3500000
	bViewDecline=true
end object
// Reference: RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeRecoilParams'
begin object name="ClassicNukeRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0300000),(InVal=0.2000000,OutVal=0.0450000),(InVal=0.3000000,OutVal=0.1500000),(InVal=0.6000000,OutVal=0.2100000),(InVal=0.7000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0700000),(InVal=0.2000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.8000000
	YRandFactor=1.5000000
	DeclineTime=1.5000000
	DeclineDelay=0.8000000
	ViewBindFactor=0.3500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastAimParams'
begin object name="ClassicFastAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosDeclineTime=1.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombAimParams'
begin object name="ClassicBombAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosDeclineTime=1.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustAimParams'
begin object name="ClassicLustAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosDeclineTime=1.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeAimParams'
begin object name="ClassicNukeAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1024)
	SprintOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosDeclineTime=1.2500000
end object
// Reference: WeaponParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	InventorySize=7
	SightingTime=0.3000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=70
	WeaponModes[0]=(ModeName="Rapid Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Bomb",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=1,AimParamsIndex=1)
	WeaponModes[2]=(ModeName="Lust Shockwave",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Sexplosion",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombRecoilParams'
	RecoilParams[2]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustRecoilParams'
	RecoilParams[3]=RecoilParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastAimParams'
	AimParams[1]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombAimParams'
	AimParams[2]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustAimParams'
	AimParams[3]=AimParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukeAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicFastPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicBombPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicLustPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicNukePrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.XOXOWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsClassic.XOXO_Pink'
begin object name="XOXO_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Love"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.XOXOWeaponParamsClassic.XOXO_Purple'
begin object name="XOXO_Purple" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Lust"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XOXOCamos.XOXOPurpleCamo-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
