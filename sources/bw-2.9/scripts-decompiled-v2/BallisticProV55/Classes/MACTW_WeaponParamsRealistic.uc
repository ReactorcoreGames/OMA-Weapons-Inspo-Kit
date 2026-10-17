class MACTW_WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.0000000
		ZoomType=2
		WeaponName="J2329-HAMR Assault Cannon"
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Desert'
	begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MAC_Desert
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Jungle'
	begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MAC_Jungle
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Urban'
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
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MACShell'
	SpawnOffset=(X=28.0000000,Y=10.0000000,Z=0.0000000)
	Speed=15000.0000000
	MaxSpeed=15000.0000000
	Damage=350.0000000
	DamageRadius=192.0000000
	MomentumTransfer=80000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=8000.0000000
	Chaos=0.8000000
	Inaccuracy=(X=4,Y=4)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: RecoilParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.1000000
	YawFactor=0.0000000
	XRandFactor=0.3000000
	YRandFactor=0.2000000
	MaxRecoil=1000.0000000
	DeclineTime=1.5000000
	ViewBindFactor=0.0000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=2048)
	AimAdjustTime=1.0000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.0000000
	ZoomType=2
	WeaponName="J2329-HAMR Assault Cannon"
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Desert'
begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Jungle'
begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsRealistic.MAC_Urban'
begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
