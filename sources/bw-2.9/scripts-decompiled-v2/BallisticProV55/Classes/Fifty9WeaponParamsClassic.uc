class Fifty9WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Bladed"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		ReloadAnimRate=1.6000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
		MagAmmo=45
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams_Burst'
	begin object name="ClassicParams_Burst" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Burst"
		LayoutTags="laser,lock,open"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		ReloadAnimRate=1.6000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2500000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=45
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Burst'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[1]=ClassicParams_Burst
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams_Supp'
	begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="lock"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		ReloadAnimRate=1.6000000
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.2800000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
		ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		MagAmmo=45
		bNeedCock=true
		bDualMixing=true
		InitialWeaponMode=2
		WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
	end object
	Layouts[2]=ClassicParams_Supp
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Blue'
	begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=Fifty_Blue
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Red'
	begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Fifty_Red
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Orange'
	begin object name="Fifty_Orange" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.TigerUziSkin",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Fifty_Orange
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.2000000),(InVal=0.2000000,OutVal=0.5000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	MaxRecoil=8192.0000000
	DeclineTime=0.8000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=192,Max=1536)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.7000000
	JumpOffset=(Pitch=1000,Yaw=-500,Roll=0)
	ViewBindFactor=0.0500000
	JumpChaos=0.2000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=0.6000000
	ChaosSpeedThreshold=1200
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
begin object name="ClassicSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2000.0000000
	RangeAtten=0.6000000
	Damage=17
	HeadMult=3.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter_C'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Burst'
begin object name="ClassicPrimaryFireParams_Burst" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
begin object name="ClassicPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	WaterTraceRange=2000.0000000
	RangeAtten=0.6000000
	Damage=17
	HeadMult=3.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-FireSil',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=58.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=32,Y=32)
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
begin object name="ClassicPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryEffectParams_Supp'
end object
// Reference: MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.5000000
	LimbMult=0.5500000
	DamageType=Class'BallisticProV55.DTFifty9Blade'
	DamageTypeHead=Class'BallisticProV55.DTFifty9BladeHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9Blade'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryEffectParams_Scope'
begin object name="ClassicSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Bladed"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	ReloadAnimRate=1.6000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
	MagAmmo=45
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams_Burst'
begin object name="ClassicParams_Burst" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Burst"
	LayoutTags="laser,lock,open"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	ReloadAnimRate=1.6000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2500000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=45
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Burst'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicParams_Supp'
begin object name="ClassicParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="lock"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	ReloadAnimRate=1.6000000
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.2800000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
	ViewOffset=(X=10.0000000,Y=7.0000000,Z=-5.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	MagAmmo=45
	bNeedCock=true
	bDualMixing=true
	InitialWeaponMode=2
	WeaponModes[0]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Burst",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsClassic.ClassicSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Blue'
begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Red'
begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsClassic.Fifty_Orange'
begin object name="Fifty_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.TigerUziSkin",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
