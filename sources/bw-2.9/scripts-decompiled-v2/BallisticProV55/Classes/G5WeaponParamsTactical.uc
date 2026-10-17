class G5WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.G5WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5000000
		SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
		ZoomType=2
		ScopeScale=0.7000000
		MinZoom=2.0000000
		MaxZoom=4.0000000
		ZoomStages=1
		DisplaceDurationMult=1.2500000
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsTactical.G5_UTC'
	begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="UTC Jungle"
	end object
	Camos[0]=G5_UTC
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsTactical.G5_Pirate'
	begin object name="G5_Pirate" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Pirate Gray"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=-1,pIndex=-1,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAAScope",Index=2,pIndex=4,AIndex=5)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAARocket",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=G5_Pirate
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.G5WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.G5Rocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=150.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Fire1',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.G5WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.G5WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Detonate"
end object
// Reference: FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.G5WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.G5WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.G5WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.G5WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5000000
	SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
	ZoomType=2
	ScopeScale=0.7000000
	MinZoom=2.0000000
	MaxZoom=4.0000000
	ZoomStages=1
	DisplaceDurationMult=1.2500000
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.G5WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsTactical.G5_UTC'
begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="UTC Jungle"
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsTactical.G5_Pirate'
begin object name="G5_Pirate" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Pirate Gray"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAA-Shine",Index=-1,pIndex=-1,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAAScope",Index=2,pIndex=4,AIndex=5)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.G5Camos.SMAARocket",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
