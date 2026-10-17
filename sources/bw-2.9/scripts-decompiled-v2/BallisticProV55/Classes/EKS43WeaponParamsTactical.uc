class EKS43WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Perfect Steel"
		InventorySize=1
		AllowedCamos[0]=0
		DisplaceDurationMult=0.3300000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=UniversalParams
	// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalParams_Hot'
	begin object name="UniversalParams_Hot" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Superheated"
		InventorySize=1
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
		AllowedCamos[0]=1
		DisplaceDurationMult=0.3300000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=UniversalParams_Hot
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsTactical.EKS_Steel'
	begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Perfect Steel"
	end object
	Camos[0]=EKS_Steel
	// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsTactical.EKS_Heated'
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
// Reference: AimParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: RecoilParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	ViewBindFactor=0.0000000
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=0
	PreFireAnim="PrepHack1"
	FireAnim="Hack1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	FireAnim="Slash1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0600000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=75
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: MeleeEffectParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.2500000
	TraceRange=(Min=165.0000000,Max=165.0000000)
	Damage=75
	DamageType=Class'BallisticProV55.DTEKS43Katana'
	DamageTypeHead=Class'BallisticProV55.DTEKS43KatanaHead'
	DamageTypeArm=Class'BallisticProV55.DTEKS43KatanaLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.EKS43.EKS-Slash',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Perfect Steel"
	InventorySize=1
	AllowedCamos[0]=0
	DisplaceDurationMult=0.3300000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalParams_Hot'
begin object name="UniversalParams_Hot" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Superheated"
	InventorySize=1
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	AllowedCamos[0]=1
	DisplaceDurationMult=0.3300000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.EKS43WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.EKS43WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsTactical.EKS_Steel'
begin object name="EKS_Steel" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Perfect Steel"
end object
// Reference: WeaponCamo'BallisticProV55.EKS43WeaponParamsTactical.EKS_Heated'
begin object name="EKS_Heated" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Superheated"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.EKS43.Katana-KGlow",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
