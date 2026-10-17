class E5WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightingTime=0.3000000
		SightOffset=(X=-10.0000000,Y=-0.8500000,Z=10.8500000)
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ViewOffset=(X=3.0000000,Y=6.0000000,Z=-8.5000000)
		WeaponName="E-5 'Asp' Particle Pistol"
		MagAmmo=60
		WeaponModes[0]=(ModeName="Series Pulse",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Multi Pulse",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Sniper Pulse",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSeriesFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticMultiFireParams'
		FireParams[2]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSniperFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticLaserFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Gray'
	begin object name="E5_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=E5_Gray
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Black'
	begin object name="E5_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYWeapon_Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYPadding_Shine",Index=4,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=E5_Black
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_SpecOps'
	begin object name="E5_SpecOps" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Spec Ops"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5-MainBlack",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5-MiscBlack",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYPadding_Shine",Index=4,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=2
	end object
	Camos[2]=E5_SpecOps
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Rust'
	begin object name="E5_Rust" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rust"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSWeapon_Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSPadding_Shine",Index=4,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=3
	end object
	Camos[3]=E5_Rust
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_UTC'
	begin object name="E5_UTC" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Main-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Main2-Shine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Padding-Shine",Index=4,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=4
	end object
	Camos[4]=E5_UTC
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Gold'
	begin object name="E5_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUWeapon_Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUPadding_Shine",Index=4,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
		Index=5
	end object
	Camos[5]=E5_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSeriesEffectParams'
begin object name="RealisticSeriesEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.E5Projectile_Std'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=27000.0000000
	AccelSpeed=100000.0000000
	Damage=35.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MVPR.MVPR-FireAlt',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=96.0000000
	Chaos=0.0600000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSeriesFireParams'
begin object name="RealisticSeriesFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=2
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSeriesEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticMultiEffectParams'
begin object name="RealisticMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.E5Projectile_SG'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=60000.0000000
	Damage=20.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MVPR.MVPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticMultiFireParams'
begin object name="RealisticMultiFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=2
	TargetState="Shotgun"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticMultiEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSniperEffectParams'
begin object name="RealisticSniperEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.E5Projectile_Snpr'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=50000.0000000
	AccelSpeed=100000.0000000
	Damage=50.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.3500000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSniperFireParams'
begin object name="RealisticSniperFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=20
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSniperEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticLaserEffectParams'
begin object name="RealisticLaserEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=11
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BWBP_APC_Pro.DTE5Laser'
	DamageTypeHead=Class'BWBP_APC_Pro.DTE5LaserHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTE5Laser'
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.VPR.VPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticLaserFireParams'
begin object name="RealisticLaserFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireAnim="None"
	FireLoopAnim="'"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticLaserEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.0500000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.1500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=500,Max=1150)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.0500000
	SprintChaos=0.4000000
	AimDamageThreshold=300
	ChaosDeclineTime=1.1500000
	ChaosSpeedThreshold=575
end object
// Reference: WeaponParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightingTime=0.3000000
	SightOffset=(X=-10.0000000,Y=-0.8500000,Z=10.8500000)
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ViewOffset=(X=3.0000000,Y=6.0000000,Z=-8.5000000)
	WeaponName="E-5 'Asp' Particle Pistol"
	MagAmmo=60
	WeaponModes[0]=(ModeName="Series Pulse",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Multi Pulse",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Sniper Pulse",bUnavailable=true,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSeriesFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticMultiFireParams'
	FireParams[2]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticSniperFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsRealistic.RealisticLaserFireParams'
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Gray'
begin object name="E5_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Black'
begin object name="E5_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYWeapon_Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYPadding_Shine",Index=4,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_SpecOps'
begin object name="E5_SpecOps" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Spec Ops"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5-MainBlack",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5-MiscBlack",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_BYPadding_Shine",Index=4,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Rust'
begin object name="E5_Rust" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rust"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSWeapon_Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_RSPadding_Shine",Index=4,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_UTC'
begin object name="E5_UTC" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Main-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Main2-Shine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.E5Camos.E5UTC-Padding-Shine",Index=4,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=4
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsRealistic.E5_Gold'
begin object name="E5_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUWeapon_Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUWeapon2_Shine",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_APC_Tex.MVPR.Shader',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.MVPRCamos.MVPR_AUPadding_Shine",Index=4,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.VPR.VPRGlass-Shiny',MaterialName="",Index=5,pIndex=-1,AIndex=-1)
	Index=5
end object
