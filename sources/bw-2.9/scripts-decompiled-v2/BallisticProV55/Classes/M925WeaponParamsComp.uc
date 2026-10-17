class M925WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.M925WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.5500000
		WeaponBoneScales[0]=(BoneName="M925RearIronSides",Slot=5,Scale=0.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=50
		WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.M925WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.M925WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.M925WeaponParamsComp.ArenaPrimaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Gray'
	begin object name="M925_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=M925_Gray
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Jungle'
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
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Desert'
	begin object name="M925_Desert" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M925.M925Small',MaterialName="",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M925.M925HeatShield',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=M925_Desert
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Rust'
	begin object name="M925_Rust" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Rust"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainRust",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscRust",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoRust",Index=4,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=M925_Rust
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Ember'
	begin object name="M925_Ember" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Ember"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainEmber",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldEmber",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=4
	end object
	Camos[4]=M925_Ember
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Biohazard'
	begin object name="M925_Biohazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Biohazard"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainBiohazardShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=5
	end object
	Camos[5]=M925_Biohazard
	// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Gold'
	begin object name="M925_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldBlack",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoGoldShine",Index=4,pIndex=3,AIndex=3)
		Index=6
	end object
	Camos[6]=M925_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.M925WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=3000.0000000,Max=7000.0000000)
	RangeAtten=0.7500000
	Damage=62
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTM925MG'
	DamageTypeHead=Class'BallisticProV55.DTM925MGHead'
	DamageTypeArm=Class'BallisticProV55.DTM925MG'
	PenetrationEnergy=96.0000000
	PenetrateForce=300
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.M925.M925-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	PushbackForce=128.0000000
	Chaos=0.1500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.M925WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	FireEndAnim="None"
	AimedFireAnim="AimedFire"
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.M925WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.M925WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0400000),(InVal=0.3000000,OutVal=0.0500000),(InVal=0.5000000,OutVal=0.0300000),(InVal=0.7000000,OutVal=0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.5000000,OutVal=0.5500000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0700000
	YRandFactor=0.0700000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	DeclineTime=1.2500000
	DeclineDelay=0.3500000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BallisticProV55.M925WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1280)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.7500000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-4000,Roll=0)
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.M925WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.5500000
	WeaponBoneScales[0]=(BoneName="M925RearIronSides",Slot=5,Scale=0.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=50
	WeaponModes[0]=(ModeName="Auto",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Semi",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.M925WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.M925WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.M925WeaponParamsComp.ArenaPrimaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Gray'
begin object name="M925_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Jungle'
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
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Desert'
begin object name="M925_Desert" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.M925.M925Small',MaterialName="",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.M925.M925HeatShield',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Rust'
begin object name="M925_Rust" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Rust"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainRust",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscRust",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoRust",Index=4,pIndex=3,AIndex=3)
	Index=3
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Ember'
begin object name="M925_Ember" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Ember"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainEmber",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldEmber",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=4
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Biohazard'
begin object name="M925_Biohazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Biohazard"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainBiohazardShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.M925.M925AmmoBox',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=5
end object
// Reference: WeaponCamo'BallisticProV55.M925WeaponParamsComp.M925_Gold'
begin object name="M925_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-MiscDark",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-ShieldBlack",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=none,MaterialName="BWBP_Camos_Tex.M925Camos.M925-AmmoGoldShine",Index=4,pIndex=3,AIndex=3)
	Index=6
end object
