class MACTW_WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.1000000
		ZoomType=2
		DisplaceDurationMult=1.2500000
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Desert'
	begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MAC_Desert
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Jungle'
	begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MAC_Jungle
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Urban'
	begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Urban"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MAC_Urban
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MACShell'
	SpawnOffset=(X=18.0000000,Y=4.0000000,Z=0.0000000)
	Speed=9000.0000000
	MaxSpeed=9000.0000000
	Damage=160.0000000
	DamageRadius=378.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Fire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.5500000
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	PitchFactor=0.1000000
	YawFactor=0.5000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MinRandFactor=0.3500000
	ClimbTime=0.1000000
	DeclineTime=0.7500000
	ViewBindFactor=0.0000000
end object
// Reference: AimParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=32)
	AimAdjustTime=0.7000000
	ViewBindFactor=1.0000000
	AimDamageThreshold=2000
	ChaosDeclineTime=1.2000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.1000000
	ZoomType=2
	DisplaceDurationMult=1.2500000
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Desert'
begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Jungle'
begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsTactical.MAC_Urban'
begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
