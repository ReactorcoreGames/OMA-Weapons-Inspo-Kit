class Fifty9WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Bladed"
		InventorySize=3
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		DisplaceDurationMult=0.5000000
		MagAmmo=25
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAutoRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.AutoFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.MeleeFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams_Burst'
	begin object name="ArenaParams_Burst" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Burst"
		LayoutTags="laser,lock,open"
		InventorySize=3
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		DisplaceDurationMult=0.5000000
		MagAmmo=25
		bDualBlocked=true
		WeaponModes[0]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.BurstFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[1]=ArenaParams_Burst
	// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Suppressed"
		LayoutTags="lock"
		InventorySize=3
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
		LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
		DisplaceDurationMult=0.5000000
		MagAmmo=25
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaBurstRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.SuppFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	end object
	Layouts[2]=ArenaParams_Supp
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Blue'
	begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=Fifty_Blue
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Red'
	begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Fifty_Red
	// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Orange'
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
// Reference: AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=256)
	AimAdjustTime=0.4500000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaBurstRecoilParams'
begin object name="ArenaBurstRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=-0.1000000),(InVal=0.8000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=6144.0000000
	ClimbTime=0.0400000
	DeclineTime=1.1000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.2000000
	HipMultiplier=1.5000000
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.AutoFireEffect'
begin object name="AutoFireEffect" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=260.0000000
	Inaccuracy=(X=72,Y=72)
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.BurstFireEffect'
begin object name="BurstFireEffect" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-Fire',Volume=0.9000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=210.0000000
	Inaccuracy=(X=72,Y=72)
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.SuppFireEffect'
begin object name="SuppFireEffect" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	DecayRange=(Min=525.0000000,Max=1225.0000000)
	RangeAtten=0.5000000
	Damage=19
	DamageType=Class'BallisticProV55.DTFifty9SMG'
	DamageTypeHead=Class'BallisticProV55.DTFifty9SMGHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9SMG'
	PenetrationEnergy=16.0000000
	PenetrateForce=135
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.UZI.UZI-FireSil',Volume=0.8000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Recoil=210.0000000
	Inaccuracy=(X=72,Y=72)
	BotRefireRate=0.9900000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsComp.BurstFireParams'
begin object name="BurstFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0600000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.BurstFireEffect'
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsComp.AutoFireParams'
begin object name="AutoFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0720000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.AutoFireEffect'
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsComp.SuppFireParams'
begin object name="SuppFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.Fifty9WeaponParamsComp.SuppFireEffect'
end object
// Reference: MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsComp.MeleeSwipeEffect'
begin object name="MeleeSwipeEffect" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0900000
	TraceRange=(Min=150.0000000,Max=150.0000000)
	Damage=55
	DamageType=Class'BallisticProV55.DTFifty9Blade'
	DamageTypeHead=Class'BallisticProV55.DTFifty9BladeHead'
	DamageTypeArm=Class'BallisticProV55.DTFifty9Blade'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.UZI.Melee',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.Fifty9WeaponParamsComp.MeleeFireParams'
begin object name="MeleeFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	FireAnim="Melee1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.Fifty9WeaponParamsComp.MeleeSwipeEffect'
end object
// Reference: FireEffectParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAutoRecoilParams'
begin object name="ArenaAutoRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0000000),(InVal=0.4000000,OutVal=0.1000000),(InVal=0.6000000,OutVal=-0.1000000),(InVal=0.8000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6500000),(InVal=0.8000000,OutVal=0.8000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=6144.0000000
	ClimbTime=0.0300000
	DeclineTime=1.1000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.2000000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Bladed"
	InventorySize=3
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	DisplaceDurationMult=0.5000000
	MagAmmo=25
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAutoRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.AutoFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.MeleeFireParams'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams_Burst'
begin object name="ArenaParams_Burst" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Burst"
	LayoutTags="laser,lock,open"
	InventorySize=3
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Suppressor",Slot=0,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Irons",Slot=1,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Laser',BoneName="tip",Scale=0.0800000,AugmentOffset=(X=-40.0000000,Y=0.0000000,Z=-10.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_RMR',BoneName="tip",Scale=0.0850000,AugmentOffset=(X=-85.0000000,Y=0.0000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	DisplaceDurationMult=0.5000000
	MagAmmo=25
	bDualBlocked=true
	WeaponModes[0]=(ModeName="Burst",bUnavailable=false,ModeID="WM_Burst",Value=5.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Auto",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.BurstFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Suppressed"
	LayoutTags="lock"
	InventorySize=3
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="StockWire",Slot=2,Scale=0.0000000)
	LayoutMesh=SkeletalMesh'BW_Core_WeaponAnim.Fifty9Tac_FPm'
	DisplaceDurationMult=0.5000000
	MagAmmo=25
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaBurstRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.SuppFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.Fifty9WeaponParamsComp.ArenaSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Blue'
begin object name="Fifty_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Red'
begin object name="Fifty_Red" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.Fifty7Skin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.Fifty9WeaponParamsComp.Fifty_Orange'
begin object name="Fifty_Orange" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Fifty9Camos.TigerUziSkin",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
