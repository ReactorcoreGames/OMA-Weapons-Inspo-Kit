class EKS43WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Fold Steel"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		AllowedCamos[0]=0
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicParams-Flamer'
	begin object name="ClassicParams-Flamer" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Superheated Alloy"
		PlayerSpeedFactor=1.1000000
		InventorySize=3
		SightMoveSpeedFactor=0.5000000
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
		AllowedCamos[0]=1
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams-Flamer
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsClassic.EKS_Steel'
	begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Fold Steel"
	end object
	Camos[0]=EKS_Steel
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsClassic.EKS_Heated'
	begin object name="EKS_Heated" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Superheated Alloy"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=EKS_Heated
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: RecoilParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepHack1"
	FireAnim="Hack1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	Damage=45
	HeadMult=2.2222220
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=128.0000000,Max=128.0000000)
	WaterTraceRange=5000.0000000
	Damage=80
	HeadMult=1.4375000
	LimbMult=0.4375000
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Fold Steel"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	AllowedCamos[0]=0
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicParams-Flamer'
begin object name="ClassicParams-Flamer" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Superheated Alloy"
	PlayerSpeedFactor=1.1000000
	InventorySize=3
	SightMoveSpeedFactor=0.5000000
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	AllowedCamos[0]=1
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsClassic.EKS_Steel'
begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Fold Steel"
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsClassic.EKS_Heated'
begin object name="EKS_Heated" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Superheated Alloy"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
