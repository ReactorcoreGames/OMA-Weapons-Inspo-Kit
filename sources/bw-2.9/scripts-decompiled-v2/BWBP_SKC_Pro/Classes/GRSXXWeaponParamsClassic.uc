class GRSXXWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		ViewOffset=(X=5.0000000,Y=12.0000000,Z=-11.0000000)
		MagAmmo=45
		bNeedCock=true
		bDualMixing=true
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsSemi'
		RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsAuto'
		RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsAuto'
		AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsSemi'
		FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsBurst'
		FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsAuto'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Gold'
	begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
		Weight=60
		CamoName="Gold"
	end object
	Camos[0]=Glock_Gold
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Black'
	begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Glock_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Brown'
	begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Brown"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Glock_Brown
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Green'
	begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Glock_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Silver'
	begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Glock_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_UTC'
	begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=Glock_UTC
	// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Butter'
	begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Butter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=Glock_Butter
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsAuto'
begin object name="ClassicRecoilParamsAuto" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsSemi'
begin object name="ClassicPrimaryEffectParamsSemi" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=16000.0000000)
	WaterTraceRange=12800.0000000
	RangeAtten=0.2000000
	Damage=45
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=64.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.0080000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsSemi'
begin object name="ClassicPrimaryFireParamsSemi" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsSemi'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsBurst'
begin object name="ClassicPrimaryEffectParamsBurst" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=16000.0000000)
	WaterTraceRange=12800.0000000
	RangeAtten=0.2000000
	Damage=45
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=64.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.0500000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsBurst'
begin object name="ClassicPrimaryFireParamsBurst" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=0.5000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsBurst'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsAuto'
begin object name="ClassicPrimaryEffectParamsAuto" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=5000.0000000,Max=16000.0000000)
	WaterTraceRange=12800.0000000
	RangeAtten=0.2000000
	Damage=45
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXPistolHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXPistol'
	PenetrationEnergy=64.0000000
	PenetrateForce=600
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.GRSXXFlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.GRSXX-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=96.0000000
	Chaos=0.0500000
	Inaccuracy=(X=2,Y=2)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsAuto'
begin object name="ClassicPrimaryFireParamsAuto" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryEffectParamsAuto'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=3500.0000000
	RangeAtten=0.3500000
	Damage=35
	LimbMult=0.5000000
	DamageType=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTGRSXXLaserHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTGRSXXLaser'
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Glock_Gold.G-Glk-LaserFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
end object
// Reference: FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Idle"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsSemi'
begin object name="ClassicRecoilParamsSemi" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	MaxRecoil=8192.0000000
	DeclineTime=0.3500000
	DeclineDelay=0.1000000
	ViewBindFactor=0.2000000
	ADSViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=8192)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.0500000
	FallingChaos=0.0500000
	SprintChaos=0.0500000
	AimDamageThreshold=480
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=11200
end object
// Reference: WeaponParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	ViewOffset=(X=5.0000000,Y=12.0000000,Z=-11.0000000)
	MagAmmo=45
	bNeedCock=true
	bDualMixing=true
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsSemi'
	RecoilParams[1]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsAuto'
	RecoilParams[2]=RecoilParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicRecoilParamsAuto'
	AimParams[0]=AimParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsSemi'
	FireParams[1]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsBurst'
	FireParams[2]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicPrimaryFireParamsAuto'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Gold'
begin object name="Glock_Gold" class=BCoreProV55.WeaponCamo
	Weight=60
	CamoName="Gold"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Black'
begin object name="Glock_Black" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Shader'BW_Core_WeaponTex.Glock.Glock_Shiny',MaterialName="",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Brown'
begin object name="Glock_Brown" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Brown"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockFullBrown_Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Green'
begin object name="Glock_Green" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRSCamos.GlockGreen_Shine",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Silver'
begin object name="Glock_Silver" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.GlockSilver_Shine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_UTC'
begin object name="Glock_UTC" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.UTCGlockShine",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.GRSXXWeaponParamsClassic.Glock_Butter'
begin object name="Glock_Butter" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Butter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.GRS9Camos.Glock_GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
