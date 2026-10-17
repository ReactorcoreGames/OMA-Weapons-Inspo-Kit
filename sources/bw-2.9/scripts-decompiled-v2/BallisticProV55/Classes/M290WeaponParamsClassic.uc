class M290WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M290WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		MagAmmo=10
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Yellow'
	begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Yellow"
	end object
	Camos[0]=M290_Yellow
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Dark'
	begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Dark Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M290_Dark
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Retro'
	begin object name="M290_Retro" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Retro Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.M290_SH1",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=M290_Retro
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=24
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=1500.0000000,Max=3500.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=20
	LimbMult=0.2400000
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	PushbackForce=1000.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=1400,Y=800)
	SpreadMode=2
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=12
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	HipSpreadFactor=1.0000000
	TraceRange=(Min=1500.0000000,Max=3500.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=20
	LimbMult=0.2400000
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	PenetrationEnergy=16.0000000
	PenetrateForce=100
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=3.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290SingleFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	PushbackForce=600.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=900,Y=700)
	SpreadMode=2
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M290WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=1024.0000000
	DeclineTime=0.9000000
	ViewBindFactor=0.9000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M290WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=2000,Yaw=-5000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=1.0000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.M290WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	MagAmmo=10
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Yellow'
begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Yellow"
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Dark'
begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Dark Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsClassic.M290_Retro'
begin object name="M290_Retro" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Retro Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.M290_SH1",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
