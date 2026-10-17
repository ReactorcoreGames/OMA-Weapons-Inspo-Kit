class M925TW_WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicPrimaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Gray'
	begin object name="M925_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M925_Gray
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Jungle'
	begin object name="M925_Jungle" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainJungle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M925.M925Small",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=M925_Jungle
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Desert'
	begin object name="M925_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainDesert",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M925.M925Small',MaterialName="",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M925.M925HeatShield',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=M925_Desert
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Rust'
	begin object name="M925_Rust" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rust"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainRust",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscRust",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoRust",Index=4,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=M925_Rust
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Ember'
	begin object name="M925_Ember" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ember"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainEmber",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldEmber",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=4
	end object
	Camos[4]=M925_Ember
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Biohazard'
	begin object name="M925_Biohazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Biohazard"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainBiohazardShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=5
	end object
	Camos[5]=M925_Biohazard
	// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Gold'
	begin object name="M925_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainGoldShine",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldBlack",Index=3,pIndex=0,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoGoldShine",Index=4,pIndex=3,AIndex=3)
		Index=6
	end object
	Camos[6]=M925_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=12000.0000000
	Damage=50
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTM925MG'
	DamageTypeHead=Class'BallisticProV55.DTM925MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM925MG'
	PenetrationEnergy=48.0000000
	PenetrateForce=300
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.M925.M925-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=160.0000000
	Inaccuracy=(X=2,Y=2)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.4000000)))
	YawFactor=0.0000000
	XRandFactor=0.3500000
	YRandFactor=0.1000000
	MaxRecoil=800.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.0000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2048)
	AimAdjustTime=0.8000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	SprintChaos=0.4000000
	AimDamageThreshold=2000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=850
end object
// Reference: WeaponParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.M925TW_WeaponParamsClassic.ClassicPrimaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Gray'
begin object name="M925_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Jungle'
begin object name="M925_Jungle" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainJungle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BW_Core_WeaponTex.M925.M925Small",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Desert'
begin object name="M925_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainDesert",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M925.M925Small',MaterialName="",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M925.M925HeatShield',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Rust'
begin object name="M925_Rust" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rust"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainRust",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscRust",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoRust",Index=4,pIndex=3,AIndex=3)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Ember'
begin object name="M925_Ember" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ember"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainEmber",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldEmber",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Biohazard'
begin object name="M925_Biohazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Biohazard"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainBiohazardShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.M925TW_WeaponParamsClassic.M925_Gold'
begin object name="M925_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainGoldShine",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldBlack",Index=3,pIndex=0,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoGoldShine",Index=4,pIndex=3,AIndex=3)
	Index=6
end object
