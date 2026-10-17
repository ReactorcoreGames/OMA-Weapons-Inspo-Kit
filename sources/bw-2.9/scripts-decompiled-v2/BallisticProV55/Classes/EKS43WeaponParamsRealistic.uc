class EKS43WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Perfect Steel"
		PlayerSpeedFactor=1.0500000
		InventorySize=2
		WeaponPrice=1000
		SightMoveSpeedFactor=0.5000000
		AllowedCamos[0]=0
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticParams_Hot'
	begin object name="RealisticParams_Hot" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Superheated"
		PlayerSpeedFactor=1.0500000
		InventorySize=2
		WeaponPrice=1000
		SightMoveSpeedFactor=0.5000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
		AllowedCamos[0]=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams_Hot
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsRealistic.EKS_Steel'
	begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Perfect Steel"
	end object
	Camos[0]=EKS_Steel
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsRealistic.EKS_Heated'
	begin object name="EKS_Heated" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Superheated"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=EKS_Heated
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: RecoilParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepHack1"
	FireAnim="Hack1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=120.0000000,Max=120.0000000)
	WaterTraceRange=5000.0000000
	Damage=87
	HeadMult=2.1839080
	LimbMult=0.4827580
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	HookStopFactor=1.3000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=120.0000000,Max=120.0000000)
	WaterTraceRange=5000.0000000
	Damage=175
	HeadMult=2.4971420
	LimbMult=0.4685710
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	HookStopFactor=1.7000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Perfect Steel"
	PlayerSpeedFactor=1.0500000
	InventorySize=2
	WeaponPrice=1000
	SightMoveSpeedFactor=0.5000000
	AllowedCamos[0]=0
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticParams_Hot'
begin object name="RealisticParams_Hot" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Superheated"
	PlayerSpeedFactor=1.0500000
	InventorySize=2
	WeaponPrice=1000
	SightMoveSpeedFactor=0.5000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	AllowedCamos[0]=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsRealistic.EKS_Steel'
begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Perfect Steel"
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsRealistic.EKS_Heated'
begin object name="EKS_Heated" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Superheated"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
