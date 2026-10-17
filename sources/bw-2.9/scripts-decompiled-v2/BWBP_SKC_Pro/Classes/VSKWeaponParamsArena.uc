class VSKWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=7
		SightMoveSpeedFactor=0.6000000
		ZoomType=1
		MaxZoom=4.0000000
		MagAmmo=15
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireHeavyParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireStandardParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsArena.VSK_Gray'
	begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=VSK_Gray
	// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsArena.VSK_UTC'
	begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="UTC"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=VSK_UTC
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryEffectHeavyParams'
begin object name="ArenaPrimaryEffectHeavyParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	Damage=50
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.6000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-SuperShot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=128.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireHeavyParams'
begin object name="ArenaPrimaryFireHeavyParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	FireAnim="FireHeavy"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryEffectHeavyParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryEffectStandardParams'
begin object name="ArenaPrimaryEffectStandardParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	Damage=35
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-Shot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=88.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireStandardParams'
begin object name="ArenaPrimaryFireStandardParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryEffectStandardParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.3000000),(InVal=0.8000000,OutVal=-0.4000000),(InVal=1.0000000,OutVal=-0.2000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.4000000,OutVal=0.6500000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.2000000
	DeclineTime=0.6500000
	DeclineDelay=0.2500000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=24,Max=1024)
	SprintOffset=(Pitch=-4000,Yaw=-6000,Roll=0)
	ViewBindFactor=0.2000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=7
	SightMoveSpeedFactor=0.6000000
	ZoomType=1
	MaxZoom=4.0000000
	MagAmmo=15
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireHeavyParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.VSKWeaponParamsArena.ArenaPrimaryFireStandardParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.ThumperGrenadeLauncherWeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsArena.VSK_Gray'
begin object name="VSK_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.VSKWeaponParamsArena.VSK_UTC'
begin object name="VSK_UTC" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="UTC"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.VSKCamos.UTCVskShine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
