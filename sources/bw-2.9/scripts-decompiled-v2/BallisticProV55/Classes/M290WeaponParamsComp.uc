class M290WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M290WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.5000000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.4000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Yellow'
	begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Yellow"
	end object
	Camos[0]=M290_Yellow
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Dark'
	begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Dark Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=M290_Dark
	// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Retro'
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
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=20
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=18
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=1250.0000000,Max=3000.0000000)
	RangeAtten=0.2500000
	Damage=15
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2560.0000000
	PushbackForce=1000.0000000
	Chaos=0.3000000
	Inaccuracy=(X=512,Y=378)
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=2
	bCockAfterFire=true
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BallisticProV55.M290WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=1250.0000000,Max=3000.0000000)
	RangeAtten=0.2500000
	Damage=15
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290SingleFire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	PushbackForce=600.0000000
	Chaos=0.2500000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.M290WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	bCockAfterFire=true
	FireAnim="FireRight"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.M290WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M290WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1200000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	ClimbTime=0.0750000
	DeclineTime=0.7500000
	DeclineDelay=0.5000000
	ViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.M290WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ADSMultiplier=0.7500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpChaos=1.0000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M290WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.5000000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.4000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BallisticProV55.M290WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M290WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M290WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.M290WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Yellow'
begin object name="M290_Yellow" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Yellow"
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Dark'
begin object name="M290_Dark" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Dark Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.MiniThorSkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M290WeaponParamsComp.M290_Retro'
begin object name="M290_Retro" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Retro Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M290Camos.M290_SH1",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
