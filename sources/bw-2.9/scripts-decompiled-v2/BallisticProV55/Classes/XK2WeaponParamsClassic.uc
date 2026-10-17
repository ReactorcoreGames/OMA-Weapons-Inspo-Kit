class XK2WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Suppressed"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
		ViewOffset=(X=12.0000000,Y=11.0000000,Z=-8.0000000)
		MagAmmo=50
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryIceFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsClassic.ClassicParams_RDS'
	begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="RDS"
		LayoutTags="no_muzzle"
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
		SightPivot=(Pitch=0,Yaw=1,Roll=0)
		ViewOffset=(X=12.0000000,Y=11.0000000,Z=-8.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=50
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=3
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams_RDS
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Black'
	begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=XK2_Black
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Jungle'
	begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=XK2_Jungle
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Desert'
	begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=XK2_Desert
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Winter'
	begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Winter"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=XK2_Winter
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Silver'
	begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=XK2_Silver
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Pink'
	begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Fabulous"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=XK2_Pink
	// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Gold'
	begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=XK2_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: AimParams'BallisticProV55.XK2WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=24,Max=2560)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.3000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=650
	ChaosTurnThreshold=140000
end object
// Reference: RecoilParams'BallisticProV55.XK2WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=-0.2000000),(InVal=0.6000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.3000000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.4000000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.2000000
	DeclineTime=1.0000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2500.0000000
	RangeAtten=0.5000000
	Damage=15
	HeadMult=4.0000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTXK2SMG'
	DamageTypeHead=Class'BallisticProV55.DTXK2SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTXK2SMG'
	PenetrationEnergy=24.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XK2.XK2-Fire',Volume=0.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=48.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=8,Y=8)
end object
// Reference: InstantEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryIceEffectParams'
begin object name="ClassicPrimaryIceEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	RangeAtten=0.2000000
	Damage=14
	HeadMult=1.4000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeHead=Class'BallisticProV55.DTXK2Freeze'
	DamageTypeArm=Class'BallisticProV55.DTXK2Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Impact',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=98.0000000
	Chaos=0.0500000
	Inaccuracy=(X=96,Y=96)
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryIceFireParams'
begin object name="ClassicPrimaryIceFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryIceEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Suppressed"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=7.2500000,Y=0.0200000,Z=3.7500000)
	ViewOffset=(X=12.0000000,Y=11.0000000,Z=-8.0000000)
	MagAmmo=50
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[2]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[3]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[4]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryIceFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.XK2WeaponParamsClassic.ClassicParams_RDS'
begin object name="ClassicParams_RDS" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="RDS"
	LayoutTags="no_muzzle"
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightOffset=(X=0.0000000,Y=0.0800000,Z=10.2000000)
	SightPivot=(Pitch=0,Yaw=1,Roll=0)
	ViewOffset=(X=12.0000000,Y=11.0000000,Z=-8.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_PistolRail',BoneName="Muzzle",Scale=0.1500000,AugmentOffset=(X=-180.0000000,Y=0.0000000,Z=-12.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="Muzzle",Scale=0.0900000,AugmentOffset=(X=-210.0000000,Y=0.0000000,Z=26.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=50
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=3
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst of Three",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Burst of Six",bUnavailable=false,ModeID="WM_BigBurst",Value=6.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[3]=(ModeName="Full Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[4]=(ModeName="Amp: Ice Full Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XK2WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XK2WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XK2WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Black'
begin object name="XK2_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Jungle'
begin object name="XK2_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Desert'
begin object name="XK2_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainDesert",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Winter'
begin object name="XK2_Winter" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Winter"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainWinter",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Silver'
begin object name="XK2_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK3-NickelShine",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Pink'
begin object name="XK2_Pink" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Fabulous"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-MainPink",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.XK2WeaponParamsClassic.XK2_Gold'
begin object name="XK2_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XK2Camos.XK2-GoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
