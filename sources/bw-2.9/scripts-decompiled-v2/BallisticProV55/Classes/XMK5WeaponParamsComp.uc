class XMK5WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dart + RDS"
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=1.0000000,Y=0.0100000,Z=1.8000000)
		WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=1.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=32
		RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsComp.ArenaParams_Supp'
	begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
		Weight=15
		LayoutName="Suppressed"
		InventorySize=4
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightingTime=0.2500000
		SightOffset=(X=1.0000000,Y=0.0100000,Z=-0.6000000)
		WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=0.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="Muzzle",Scale=0.0250000,AugmentOffset=(X=-60.0000000,Y=-0.3000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
		DisplaceDurationMult=0.7500000
		MagAmmo=32
		RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams_Supp'
		AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[1]=ArenaParams_Supp
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Tan'
	begin object name="XMK5_Tan" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brown"
	end object
	Camos[0]=XMK5_Tan
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Desert'
	begin object name="XMK5_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainDesert",Index=1,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=XMK5_Desert
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Jungle'
	begin object name="XMK5_Jungle" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainJungle",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=XMK5_Jungle
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Red'
	begin object name="XMK5_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGMain",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=XMK5_Red
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Blast'
	begin object name="XMK5_Blast" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Blast"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainOrk",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterOrk",Index=4,pIndex=3,AIndex=3)
		Index=4
	end object
	Camos[4]=XMK5_Blast
	// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Gold'
	begin object name="XMK5_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainGold",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MagDark",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterDark",Index=4,pIndex=3,AIndex=3)
		Index=5
	end object
	Camos[5]=XMK5_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.XMK5WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=378)
	AimAdjustTime=0.3500000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	AimDamageThreshold=190
	ChaosDeclineTime=0.8000000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BallisticProV55.XMK5WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1200000,OutVal=0.0000000),(InVal=0.3300000,OutVal=0.0400000),(InVal=0.4500000,OutVal=-0.0600000),(InVal=0.5800000,OutVal=0.0000000),(InVal=0.8000000,OutVal=-0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.2500000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.4500000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.3500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: InstantEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=23
	DamageType=Class'BallisticProV55.DTXMK5SubMachinegun'
	DamageTypeHead=Class'BallisticProV55.DTXMK5SubMachinegunHead'
	DamageTypeArm=Class'BallisticProV55.DTXMK5SubMachinegun'
	PenetrationEnergy=16.0000000
	PenetrateForce=175
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XMk5FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_Fire1',Volume=1.3500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=190.0000000
	Chaos=0.0350000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
begin object name="ArenaPrimaryEffectParams_Supp" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=4096.0000000,Max=4096.0000000)
	DecayRange=(Min=788.0000000,Max=1838.0000000)
	RangeAtten=0.5000000
	Damage=23
	DamageType=Class'BallisticProV55.DTXMK5SubMachinegun'
	DamageTypeHead=Class'BallisticProV55.DTXMK5SubMachinegunHead'
	DamageTypeArm=Class'BallisticProV55.DTXMK5SubMachinegun'
	PenetrationEnergy=16.0000000
	PenetrateForce=175
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.TEC.RSMP-SilenceFire',Volume=0.5000000,Radius=128.0000000,Slot=0,Pitch=0.8000000,bAtten=true,bNoOverride=true)
	Recoil=170.0000000
	Chaos=0.0350000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams_Supp'
begin object name="ArenaPrimaryFireParams_Supp" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryEffectParams_Supp'
end object
// Reference: ProjectileEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.XMK5Dart'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10000.0000000
	Damage=35.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=2.0000000
	PreFireAnim="None"
	FireAnim="Fire2"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dart + RDS"
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=1.0000000,Y=0.0100000,Z=1.8000000)
	WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=1.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=32
	RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.XMK5WeaponParamsComp.ArenaParams_Supp'
begin object name="ArenaParams_Supp" class=BCoreProV55.WeaponParams
	Weight=15
	LayoutName="Suppressed"
	InventorySize=4
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightingTime=0.2500000
	SightOffset=(X=1.0000000,Y=0.0100000,Z=-0.6000000)
	WeaponBoneScales[0]=(BoneName="SightFront",Slot=18,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Darter",Slot=19,Scale=0.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_SuppressorSOCOM',BoneName="Muzzle",Scale=0.0500000,AugmentOffset=(X=-50.0000000,Y=0.0000000,Z=0.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	GunAugments[1]=(GunAugmentClass=Class'BallisticProV55.Augment_ReflexCircle',BoneName="Muzzle",Scale=0.0250000,AugmentOffset=(X=-60.0000000,Y=-0.3000000,Z=7.0000000),AugmentRot=(Pitch=0,Yaw=-32768,Roll=0))
	DisplaceDurationMult=0.7500000
	MagAmmo=32
	RecoilParams[0]=RecoilParams'BallisticProV55.XMK5WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMK5WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaPrimaryFireParams_Supp'
	AltFireParams[0]=FireParams'BallisticProV55.XMK5WeaponParamsComp.ArenaSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Tan'
begin object name="XMK5_Tan" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brown"
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Desert'
begin object name="XMK5_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainDesert",Index=1,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Jungle'
begin object name="XMK5_Jungle" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainJungle",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Red'
begin object name="XMK5_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGMain",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Blast'
begin object name="XMK5_Blast" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Blast"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainOrk",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGShield",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.SMGClip",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterOrk",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.XMK5WeaponParamsComp.XMK5_Gold'
begin object name="XMK5_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MainGold",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-ShieldDark",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-MagDark",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.XMk5Camos.XMK5-DarterDark",Index=4,pIndex=3,AIndex=3)
	Index=5
end object
