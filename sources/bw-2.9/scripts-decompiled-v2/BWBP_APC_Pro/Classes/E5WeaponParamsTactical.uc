class E5WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightingTime=0.3000000
		SightOffset=(X=2.0000000,Y=-0.8250000,Z=10.8465000)
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		ViewOffset=(X=5.0000000,Y=4.0000000,Z=-10.0000000)
		MagAmmo=60
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSeriesFireParams'
		FireParams[1]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalMultiFireParams'
		FireParams[2]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSniperFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalLaserFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Gray'
	begin object name="E5_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=E5_Gray
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Black'
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
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_SpecOps'
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
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Rust'
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
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_UTC'
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
	// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Gold'
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
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSeriesEffectParams'
begin object name="TacticalSeriesEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.E5Projectile_Std'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=14000.0000000
	AccelSpeed=100000.0000000
	Damage=42.0000000
	DamageRadius=16.0000000
	HeadMult=2.5000000
	MaxDamageGainFactor=0.6000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2500000
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MVPR.MVPR-FireAlt',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=140.0000000
	Chaos=0.0600000
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalMultiEffectParams'
begin object name="TacticalMultiEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.E5Projectile_SG'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=5500.0000000
	AccelSpeed=60000.0000000
	Damage=42.0000000
	DamageRadius=64.0000000
	MaxDamageGainFactor=0.2500000
	DamageGainEndTime=0.3000000
	MuzzleFlashClass=Class'BWBP_APC_Pro.E5FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MVPR.MVPR-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	Chaos=0.5000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSniperEffectParams'
begin object name="TacticalSniperEffectParams" class=BCoreProV55.ProjectileEffectParams
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
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSeriesFireParams'
begin object name="TacticalSeriesFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=2
	BurstFireRateFactor=0.5500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSeriesEffectParams'
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalMultiFireParams'
begin object name="TacticalMultiFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=4
	TargetState="Shotgun"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalMultiEffectParams'
end object
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSniperFireParams'
begin object name="TacticalSniperFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6500000
	AmmoPerFire=20
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSniperEffectParams'
end object
// Reference: InstantEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalLaserEffectParams'
begin object name="TacticalLaserEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=10000.0000000,Max=10000.0000000)
	WaterTraceRange=5000.0000000
	Damage=14
	HeadMult=2.5000000
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
// Reference: FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalLaserFireParams'
begin object name="TacticalLaserFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0850000
	FireAnim="None"
	FireLoopAnim="'"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalLaserEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0400000),(InVal=0.2000000,OutVal=0.1200000),(InVal=0.3500000,OutVal=0.1700000),(InVal=0.6000000,OutVal=0.2200000),(InVal=0.8000000,OutVal=0.3200000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.3800000),(InVal=0.6000000,OutVal=0.7500000),(InVal=0.7000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0400000
	DeclineTime=0.5000000
	DeclineDelay=0.2400000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimDamageThreshold=75
	ChaosDeclineTime=1.2500000
end object
// Reference: WeaponParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightingTime=0.3000000
	SightOffset=(X=2.0000000,Y=-0.8250000,Z=10.8465000)
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	ViewOffset=(X=5.0000000,Y=4.0000000,Z=-10.0000000)
	MagAmmo=60
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSeriesFireParams'
	FireParams[1]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalMultiFireParams'
	FireParams[2]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalSniperFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.E5WeaponParamsTactical.TacticalLaserFireParams'
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Gray'
begin object name="E5_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Black'
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
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_SpecOps'
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
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Rust'
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
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_UTC'
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
// Reference: WeaponCamo'BWBP_APC_Pro.E5WeaponParamsTactical.E5_Gold'
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
