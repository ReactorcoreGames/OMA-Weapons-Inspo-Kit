class G5WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.G5WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5000000
		SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=2
		RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.G5WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsComp.G5_UTC'
	begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="UTC Jungle"
	end object
	Camos[0]=G5_UTC
	// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsComp.G5_Pirate'
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
// Reference: ProjectileEffectParams'BallisticProV55.G5WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.G5Rocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=2000.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=5000.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MomentumTransfer=75000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.G5.G5-Fire1',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.8000000
end object
// Reference: FireParams'BallisticProV55.G5WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	bCockAfterFire=true
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.G5WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.G5WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Detonate"
end object
// Reference: FireParams'BallisticProV55.G5WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.G5WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.G5WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	DeclineTime=1.0000000
end object
// Reference: AimParams'BallisticProV55.G5WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=1536)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.2500000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.G5WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5000000
	SightOffset=(X=-3.0000000,Y=-5.5000000,Z=4.7500000)
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=2
	RecoilParams[0]=RecoilParams'BallisticProV55.G5WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.G5WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.G5WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.G5WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsComp.G5_UTC'
begin object name="G5_UTC" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="UTC Jungle"
end object
// Reference: WeaponCamo'BallisticProV55.G5WeaponParamsComp.G5_Pirate'
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
