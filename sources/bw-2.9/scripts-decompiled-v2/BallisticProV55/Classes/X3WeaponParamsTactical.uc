class X3WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.X3WeaponParamsTactical.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsTactical.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsTactical.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireProjParams'
		AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireProjParams'
	end object
	Layouts[0]=UniversalParams
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsTactical.X3_Silver'
	begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=X3_Silver
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsTactical.X3_Black'
	begin object name="X3_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=X3_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireProjParams'
begin object name="TacticalPrimaryFireProjParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.5000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryProjEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=55
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slice1"
	FireAnimRate=1.8000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryProjEffectParams'
begin object name="TacticalPrimaryProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	Damage=55.0000000
	HeadMult=2.5000000
	LimbMult=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifeThrow',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=75
	HeadMult=1.7500000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="BigBack1"
	FireAnim="BigStab1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.X3WeaponParamsTactical.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.X3WeaponParamsTactical.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.X3WeaponParamsTactical.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsTactical.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsTactical.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireProjParams'
	AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsTactical.TacticalPrimaryFireProjParams'
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsTactical.X3_Silver'
begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsTactical.X3_Black'
begin object name="X3_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
