class FG50TW_WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.0100000
		DisplaceDurationMult=1.2500000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalParams_Bipod'
	begin object name="TacticalParams_Bipod" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.0100000
		WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		DisplaceDurationMult=1.2500000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Bipod
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Gold'
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
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	TargetState="Mount"
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0700000,OutVal=-0.0500000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.1800000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.5000000,OutVal=0.0000000),(InVal=0.6500000,OutVal=-0.1000000),(InVal=0.7000000,OutVal=-0.1500000),(InVal=0.8500000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	PitchFactor=0.0500000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=7000.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.6000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriStandardEffectParams'
begin object name="TacticalPriStandardEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=100
	HeadMult=3.2500000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=252.0000000
	Chaos=0.2000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriStandardFireParams'
begin object name="TacticalPriStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriStandardEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriControlledEffectParams'
begin object name="TacticalPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=100
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
	Recoil=156.0000000
	PushbackForce=125.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriControlledFireParams'
begin object name="TacticalPriControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriControlledEffectParams'
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalStandardAimParams'
begin object name="TacticalStandardAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=2)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	AimDamageThreshold=2000
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalControlledAimParams'
begin object name="TacticalControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=1)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.4000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.0100000
	DisplaceDurationMult=1.2500000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.CYLOWeaponParamsTactical.TacticalAimParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalParams_Bipod'
begin object name="TacticalParams_Bipod" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.0100000
	WeaponBoneScales[0]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	DisplaceDurationMult=1.2500000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50TW_WeaponParamsTactical.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=1)
	Index=4
end object
