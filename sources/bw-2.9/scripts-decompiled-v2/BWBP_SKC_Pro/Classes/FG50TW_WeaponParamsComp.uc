class FG50TW_WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		DisplaceDurationMult=1.2500000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams_Controlled'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaParams_Bipod'
	begin object name="ArenaParams_Bipod" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.0100000
		WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams_Controlled'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Gold'
	begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=4
	end object
	Camos[4]=FG50_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Mount"
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams_Controlled'
begin object name="ArenaAimParams_Controlled" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	AimDamageThreshold=2000
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	AimDamageThreshold=2000
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0750000),(InVal=0.4000000,OutVal=0.1300000),(InVal=0.5500000,OutVal=0.1500000),(InVal=0.7000000,OutVal=0.2100000),(InVal=1.0000000,OutVal=0.2250000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.0500000
	XRandFactor=0.2000000
	YRandFactor=0.0500000
	MaxRecoil=1200.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledFireParams'
begin object name="ArenaPriControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardFireParams'
begin object name="ArenaPriStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2300000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardEffectParams'
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
	Recoil=300.0000000
	Chaos=0.2000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledEffectParams'
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
	Recoil=100.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	DisplaceDurationMult=1.2500000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams_Controlled'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaParams_Bipod'
begin object name="ArenaParams_Bipod" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.0100000
	WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaAimParams_Controlled'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsComp.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
