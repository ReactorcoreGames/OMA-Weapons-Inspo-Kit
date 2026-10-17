class FG50WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.6000000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecControlledFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecStandardFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaParams_Bipod'
	begin object name="ArenaParams_Bipod" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Bipod"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.6000000
		SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryFireParams_Mount'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryFireParams_Mount'
	end object
	Layouts[1]=ArenaParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Gold'
	begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=4
	end object
	Camos[4]=FG50_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardFireParams'
begin object name="ArenaPriStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2300000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledFireParams'
begin object name="ArenaPriControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryFireParams_Mount'
begin object name="ArenaSecondaryFireParams_Mount" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Mount"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryEffectParams_Mount'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0300000),(InVal=0.4000000,OutVal=-0.0900000),(InVal=0.5500000,OutVal=0.0500000),(InVal=0.7000000,OutVal=-0.0750000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	ViewBindFactor=0.1500000
	HipMultiplier=1.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaStandardAimParams'
begin object name="ArenaStandardAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=1536)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaControlledAimParams'
begin object name="ArenaControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardEffectParams'
begin object name="ArenaPriStandardEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=80
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	PushbackForce=250.0000000
	Chaos=0.2000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledEffectParams'
begin object name="ArenaPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=80
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	PushbackForce=64.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecStandardEffectParams'
begin object name="ArenaSecStandardEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=80
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=768.0000000
	PushbackForce=150.0000000
	Heat=1.5000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecStandardFireParams'
begin object name="ArenaSecStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1650000
	TargetState="RapidFire"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecStandardEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecControlledEffectParams'
begin object name="ArenaSecControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=80
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	PushbackForce=64.0000000
	Chaos=0.5000000
	Heat=1.5000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecControlledFireParams'
begin object name="ArenaSecControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="RapidFire"
	FireAnim="CFire"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecControlledEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryEffectParams_Mount'
begin object name="ArenaSecondaryEffectParams_Mount" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.6000000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecControlledFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecStandardFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaParams_Bipod'
begin object name="ArenaParams_Bipod" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Bipod"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.6000000
	SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryFireParams_Mount'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsComp.ArenaSecondaryFireParams_Mount'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsComp.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=4
end object
