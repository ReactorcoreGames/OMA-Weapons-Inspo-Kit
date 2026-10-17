class BulldogWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsTactical.Bull_Red'
	begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=Bull_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsTactical.Bull_Wood'
	begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
		Index=1
	end object
	Camos[1]=Bull_Wood
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2363.0000000,Max=7000.0000000)
	RangeAtten=0.7500000
	Damage=140
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DTBulldog'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBulldogHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBulldog'
	PenetrationEnergy=192.0000000
	PenetrateForce=250
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=1.1000000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Bulldog.Bulldog-Fire',Volume=7.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2560.0000000
	PushbackForce=3000.0000000
	Chaos=1.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=90.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.BulldogRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=75.0000000
	DamageRadius=512.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Bulldog.Bulldog-FireTest',Volume=2.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	FireAnim="SGFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsTactical.Bull_Red'
begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsTactical.Bull_Wood'
begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	Index=1
end object
