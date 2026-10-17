class D49WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Laser"
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
		SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
		bAdjustHands=true
		WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
		RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=6
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.D49WeaponParamsComp.ArenaParams_Scope'
	begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="3X Scope"
		InventorySize=3
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4000000
		SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
		ZoomType=1
		ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
		MaxZoom=3.0000000
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
		DisplaceDurationMult=0.5000000
		MagAmmo=6
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[1]=ArenaParams_Scope
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsComp.D49_Silver'
	begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=D49_Silver
	// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsComp.D49_Black'
	begin object name="D49_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=D49_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.D49WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=378)
	JumpChaos=0.7500000
	ChaosDeclineTime=0.4500000
end object
// Reference: RecoilParams'BallisticProV55.D49WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.5000000,OutVal=0.0300000),(InVal=1.0000000,OutVal=0.0700000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.6500000
	HipMultiplier=1.2500000
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireParams'
begin object name="ArenaAltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=2
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireEffectParams'
end object
// Reference: FireParams'BallisticProV55.D49WeaponParamsComp.ArenaFireParams'
begin object name="ArenaFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	FireAnim="FireSingle"
	FireEndAnim="None"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.D49WeaponParamsComp.ArenaFireEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsComp.ArenaFireEffectParams'
begin object name="ArenaFireEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=45
	HeadMult=3.0000000
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=16.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-FireSingle',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.4000000
	Inaccuracy=(X=48,Y=48)
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireEffectParams'
begin object name="ArenaAltFireEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=8000.0000000,Max=9000.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=90
	DamageType=Class'BallisticProV55.DTD49Revolver'
	DamageTypeHead=Class'BallisticProV55.DTD49RevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTD49Revolver'
	PenetrationEnergy=16.0000000
	PenetrateForce=200
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=1.2000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2560.0000000
	Chaos=0.8000000
	Inaccuracy=(X=48,Y=48)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Laser"
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightOffset=(X=-11.0000000,Y=-4.6000000,Z=25.5000000)
	SightPivot=(Pitch=350,Yaw=-48,Roll=-500)
	bAdjustHands=true
	WristAdjust=(Pitch=0,Yaw=-2500,Roll=0)
	RootAdjust=(Pitch=2000,Yaw=-375,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=6
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireParams'
end object
// Reference: WeaponParams'BallisticProV55.D49WeaponParamsComp.ArenaParams_Scope'
begin object name="ArenaParams_Scope" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="3X Scope"
	InventorySize=3
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4000000
	SightOffset=(X=50.0000000,Y=-0.5000000,Z=10.0000000)
	ZoomType=1
	ScopeViewTex=Texture'BWBP_SKC_Tex.Eagle.Eagle-ScopeView'
	MaxZoom=3.0000000
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="ShortBarrel",Slot=51,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=22.0000000,Z=-16.0000000)
	DisplaceDurationMult=0.5000000
	MagAmmo=6
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.D49WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.D49WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.D49WeaponParamsComp.ArenaAltFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsComp.D49_Silver'
begin object name="D49_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.D49WeaponParamsComp.D49_Black'
begin object name="D49_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.D49Camos.D49Black-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
