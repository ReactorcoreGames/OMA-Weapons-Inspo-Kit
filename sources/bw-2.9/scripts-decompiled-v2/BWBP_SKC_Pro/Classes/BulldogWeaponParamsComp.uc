class BulldogWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=5
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=8
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsComp.Bull_Red'
	begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=Bull_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsComp.Bull_Wood'
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
// Reference: InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=2363.0000000,Max=7000.0000000)
	RangeAtten=0.5000000
	Damage=140
	HeadMult=1.5000000
	LimbMult=0.9000000
	DamageType=Class'BWBP_SKC_Pro.DTBulldog'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTBulldogHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTBulldog'
	PenetrationEnergy=128.0000000
	PenetrateForce=250
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FlashScaleFactor=0.7500000
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.Bulldog.Bulldog-Fire',Volume=7.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2560.0000000
	PushbackForce=3000.0000000
	Chaos=1.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireEndAnim="None"
	FireAnimRate=2.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.BulldogRocket'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=100.0000000
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
// Reference: FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=0
	FireAnim="SGFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=6144.0000000
	ClimbTime=0.1000000
	DeclineTime=1.0000000
	DeclineDelay=0.2500000
	ViewBindFactor=0.2500000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=96,Max=1024)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=5
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=9,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=8
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.BulldogWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsComp.Bull_Red'
begin object name="Bull_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.BulldogWeaponParamsComp.Bull_Wood'
begin object name="Bull_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BulldogCamos.PugDog-Shine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BWBP_SKC_Tex.Bulldog.Bulldog-Scope',MaterialName="",Index=2,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_OP_Tex.M575.M575_RDS_SH1',MaterialName="",Index=3,pIndex=-1,AIndex=-1)
	Index=1
end object
