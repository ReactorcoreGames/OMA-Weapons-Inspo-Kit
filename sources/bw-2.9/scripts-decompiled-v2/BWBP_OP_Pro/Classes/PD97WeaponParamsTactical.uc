class PD97WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Shotgun"
		LayoutTags="shotgun"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		WeaponName="PD97 Shotgun Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams_Rocket'
	begin object name="TacticalParams_Rocket" class=BCoreProV55.WeaponParams
		Weight=15
		LayoutName="Missile"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		WeaponName="PD97 Missile Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		bDualBlocked=true
		InitialWeaponMode=2
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Rocket'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams_Tracker'
	end object
	Layouts[1]=TacticalParams_Rocket
	// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams_Dart'
	begin object name="TacticalParams_Dart" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Plague Dart"
		InventorySize=2
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		WeaponName="PD97 Dart Revolver"
		DisplaceDurationMult=0.5000000
		MagAmmo=5
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Dart'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[2]=TacticalParams_Dart
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Gray'
	begin object name="PUG_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=PUG_Gray
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Red'
	begin object name="PUG_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Military Red"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainRed",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=1
	end object
	Camos[1]=PUG_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Blue'
	begin object name="PUG_Blue" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Police Blue"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlue",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=2
	end object
	Camos[2]=PUG_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Black'
	begin object name="PUG_Black" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Riot Police"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlack",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=3
	end object
	Camos[3]=PUG_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Gold'
	begin object name="PUG_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainGold",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
		Index=4
	end object
	Camos[4]=PUG_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	DeclineDelay=0.5000000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	MaxMoveMultiplier=1.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=512)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.2000000
	ChaosDeclineTime=0.4500000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	RangeAtten=0.7500000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DTPD97Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DTPD97ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTPD97Shotgun'
	PenetrationEnergy=4.0000000
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AH104.AH104-Fire',Volume=1.1000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.5000000
	Inaccuracy=(X=400,Y=400)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams_Dart'
begin object name="TacticalPrimaryEffectParams_Dart" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97Dart'
	SpawnOffset=(X=15.0000000,Y=15.0000000,Z=-20.0000000)
	Speed=15000.0000000
	Damage=30.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=0.5000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.1500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Dart'
begin object name="TacticalPrimaryFireParams_Dart" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="Projectile"
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams_Dart'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams_Rocket'
begin object name="TacticalPrimaryEffectParams_Rocket" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97Rocket'
	SpawnOffset=(X=15.0000000,Y=15.0000000,Z=-20.0000000)
	Speed=4500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=2000.0000000
	Damage=70.0000000
	DamageRadius=192.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.PD97.PD97-RocketFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.1500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Rocket'
begin object name="TacticalPrimaryFireParams_Rocket" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="Projectile"
	PreFireAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryEffectParams_Rocket'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=100.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryEffectParams_Tracker'
begin object name="TacticalSecondaryEffectParams_Tracker" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.PD97TrackerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=10240.0000000
	Damage=25.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams_Tracker'
begin object name="TacticalSecondaryFireParams_Tracker" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	TargetState="Tracker"
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryEffectParams_Tracker'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Shotgun"
	LayoutTags="shotgun"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	WeaponName="PD97 Shotgun Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams_Rocket'
begin object name="TacticalParams_Rocket" class=BCoreProV55.WeaponParams
	Weight=15
	LayoutName="Missile"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	WeaponName="PD97 Missile Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	bDualBlocked=true
	InitialWeaponMode=2
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Rocket'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams_Tracker'
end object
// Reference: WeaponParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalParams_Dart'
begin object name="TacticalParams_Dart" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Plague Dart"
	InventorySize=2
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	WeaponName="PD97 Dart Revolver"
	DisplaceDurationMult=0.5000000
	MagAmmo=5
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalPrimaryFireParams_Dart'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.PD97WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Gray'
begin object name="PUG_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Red'
begin object name="PUG_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Military Red"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainRed",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Blue'
begin object name="PUG_Blue" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Police Blue"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlue",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Black'
begin object name="PUG_Black" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Riot Police"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainBlack",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.PD97WeaponParamsTactical.PUG_Gold'
begin object name="PUG_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MainGold",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.PD97Camos.PD97-MagDark",Index=2,pIndex=2,AIndex=1)
	Index=4
end object
