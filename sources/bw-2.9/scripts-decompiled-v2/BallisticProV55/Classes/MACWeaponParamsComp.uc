class MACWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MACWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5000000
		SightOffset=(X=-20.0000000,Y=-10.0000000,Z=-0.5000000)
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.MACWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MACWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MACWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MACWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Desert'
	begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MAC_Desert
	// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Jungle'
	begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=1)
		Index=1
	end object
	Camos[1]=MAC_Jungle
	// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Urban'
	begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=1)
		Index=2
	end object
	Camos[2]=MAC_Urban
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.MACWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MACShell'
	SpawnOffset=(X=18.0000000,Y=4.0000000,Z=0.0000000)
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	Damage=160.0000000
	DamageRadius=192.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Fire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=4096.0000000
	PushbackForce=1000.0000000
	Chaos=0.5500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MACWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.3500000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MACWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.MACWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BallisticProV55.MACWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	FireAnim="Deploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MACWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MACWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.6000000
	YRandFactor=0.9000000
	MinRandFactor=0.3500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=0.7500000
	DeclineDelay=0.2000000
end object
// Reference: AimParams'BallisticProV55.MACWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=2048)
	AimAdjustTime=0.7000000
	SprintOffset=(Pitch=-7000,Yaw=-3500,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MACWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5000000
	SightOffset=(X=-20.0000000,Y=-10.0000000,Z=-0.5000000)
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.MACWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MACWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MACWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MACWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Desert'
begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Jungle'
begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MACWeaponParamsComp.MAC_Urban'
begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=1)
	Index=2
end object
