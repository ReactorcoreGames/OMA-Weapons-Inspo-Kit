class X3WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.X3WeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		DisplaceDurationMult=0.2500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireProjParams'
		AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireProjParams'
	end object
	Layouts[0]=UniversalParams
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsComp.X3_Silver'
	begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=X3_Silver
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsComp.X3_Black'
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
// Reference: FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireProjParams'
begin object name="ArenaPrimaryFireProjParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.5000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryProjEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=45
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slice1"
	FireAnimRate=1.8000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryProjEffectParams'
begin object name="ArenaPrimaryProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	Damage=50.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifeThrow',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=130.0000000,Max=130.0000000)
	Damage=65
	HeadMult=1.5000000
	LimbMult=0.7500000
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
// Reference: FireParams'BallisticProV55.X3WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="BigBack1"
	FireAnim="BigStab1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.X3WeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.X3WeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.X3WeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	DisplaceDurationMult=0.2500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireProjParams'
	AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsComp.ArenaPrimaryFireProjParams'
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsComp.X3_Silver'
begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsComp.X3_Black'
begin object name="X3_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
