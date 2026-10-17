class A909WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A909WeaponParamsComp.UniversalParams'
	begin object name="UniversalParams" class=BCoreProV55.WeaponParams
		InventorySize=1
		DisplaceDurationMult=0.0000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.A909WeaponParamsComp.UniversalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A909WeaponParamsComp.UniversalAimParams'
		FireParams[0]=FireParams'BallisticProV55.A909WeaponParamsComp.ArenaPriFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A909WeaponParamsComp.ArenaSecFireParams'
	end object
	Layouts[0]=UniversalParams
	// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsComp.A909_Green'
	begin object name="A909_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=A909_Green
	// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsComp.A909_Blue'
	begin object name="A909_Blue" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=-1,pIndex=-1,AIndex=1)
		Index=1
	end object
	Camos[1]=A909_Blue
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeleeEffectParams'BallisticProV55.A909WeaponParamsComp.ArenaPriEffectParams'
begin object name="ArenaPriEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.0300000
	TraceRange=(Min=150.0000000,Max=150.0000000)
	Damage=55
	DamageType=Class'BallisticProV55.DTA909Blades'
	DamageTypeHead=Class'BallisticProV55.DTA909Head'
	DamageTypeArm=Class'BallisticProV55.DTA909Limb'
	MomentumTransfer=100
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.9900000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.A909WeaponParamsComp.ArenaPriFireParams'
begin object name="ArenaPriFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=0
	FireAnim="PrepHack"
	FireAnimRate=1.2000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.A909WeaponParamsComp.ArenaPriEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.A909WeaponParamsComp.ArenaSecEffectParams'
begin object name="ArenaSecEffectParams" class=BCoreProV55.MeleeEffectParams
	Fatigue=0.2000000
	TraceRange=(Min=150.0000000,Max=150.0000000)
	Damage=75
	DamageType=Class'BallisticProV55.DTA909Blades'
	DamageTypeHead=Class'BallisticProV55.DTA909Head'
	DamageTypeArm=Class'BallisticProV55.DTA909Limb'
	MomentumTransfer=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BotRefireRate=0.5000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.A909WeaponParamsComp.ArenaSecFireParams'
begin object name="ArenaSecFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	PreFireAnim="PrepBigHack3"
	FireAnim="BigHack3"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.A909WeaponParamsComp.ArenaSecEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.A909WeaponParamsComp.UniversalRecoilParams'
begin object name="UniversalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.0000000
	YawFactor=0.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.A909WeaponParamsComp.UniversalAimParams'
begin object name="UniversalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ChaosDeclineTime=0.3200000
end object
// Reference: WeaponParams'BallisticProV55.A909WeaponParamsComp.UniversalParams'
begin object name="UniversalParams" class=BCoreProV55.WeaponParams
	InventorySize=1
	DisplaceDurationMult=0.0000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.A909WeaponParamsComp.UniversalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A909WeaponParamsComp.UniversalAimParams'
	FireParams[0]=FireParams'BallisticProV55.A909WeaponParamsComp.ArenaPriFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A909WeaponParamsComp.ArenaSecFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsComp.A909_Green'
begin object name="A909_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsComp.A909_Blue'
begin object name="A909_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=-1,pIndex=-1,AIndex=1)
	Index=1
end object
