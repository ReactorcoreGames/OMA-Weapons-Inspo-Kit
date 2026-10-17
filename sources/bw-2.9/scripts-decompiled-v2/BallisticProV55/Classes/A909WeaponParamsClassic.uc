class A909WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.A909WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.2000000
		InventorySize=2
		SightMoveSpeedFactor=0.5000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.A909WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.A909WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsClassic.A909_Green'
	begin object name="A909_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=A909_Green
	// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsClassic.A909_Blue'
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
// Reference: MeleeEffectParams'BallisticProV55.A909WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=100.0000000,Max=100.0000000)
	WaterTraceRange=5000.0000000
	Damage=22
	HeadMult=3.0000000
	LimbMult=0.5500000
	DamageType=Class'BallisticProV55.DTA909Blades'
	DamageTypeHead=Class'BallisticProV55.DTA909Head'
	DamageTypeArm=Class'BallisticProV55.DTA909Limb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="PrepHack"
	FireAnimRate=1.3000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.A909WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.A909WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=120.0000000,Max=120.0000000)
	WaterTraceRange=5000.0000000
	Damage=75
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTA909Blades'
	DamageTypeHead=Class'BallisticProV55.DTA909Head'
	DamageTypeArm=Class'BallisticProV55.DTA909Limb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.A909.A909Slash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="PrepBigHack3"
	FireAnim="BigHack3"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.A909WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.A909WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.A909WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.A909WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.2000000
	InventorySize=2
	SightMoveSpeedFactor=0.5000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.A909WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.A909WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.A909WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsClassic.A909_Green'
begin object name="A909_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.A909WeaponParamsClassic.A909_Blue'
begin object name="A909_Blue" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.A909Camos.EnergyWristBladeShine",Index=-1,pIndex=-1,AIndex=1)
	Index=1
end object
