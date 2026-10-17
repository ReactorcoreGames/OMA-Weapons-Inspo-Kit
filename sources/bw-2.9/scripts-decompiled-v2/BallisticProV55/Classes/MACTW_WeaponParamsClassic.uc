class MACTW_WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.0000000
		ZoomType=2
		WeaponName="J2329-HAMR Assault Cannon"
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Desert'
	begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MAC_Desert
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Jungle'
	begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MAC_Jungle
	// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Urban'
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
// Reference: ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MACShell'
	SpawnOffset=(X=28.0000000,Y=10.0000000,Z=0.0000000)
	Speed=14000.0000000
	MaxSpeed=14000.0000000
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
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.5000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
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
// Reference: AimParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=2048)
	AimAdjustTime=1.0000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.0000000
	ZoomType=2
	WeaponName="J2329-HAMR Assault Cannon"
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MACTW_WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Desert'
begin object name="MAC_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Jungle'
begin object name="MAC_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MACTW_WeaponParamsClassic.MAC_Urban'
begin object name="MAC_Urban" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Urban"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MACCamos.Artillery-MainUrban",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
