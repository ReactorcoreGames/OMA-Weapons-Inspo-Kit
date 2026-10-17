class FG50WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Holosight"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.3000000
		SightingTime=0.6500000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecControlledFireParams'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecStandardFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams_Mount'
	begin object name="TacticalParams_Mount" class=BCoreProV55.WeaponParams
		Weight=20
		LayoutName="Bipod"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.3000000
		SightingTime=0.6500000
		SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Mount'
	end object
	Layouts[1]=TacticalParams_Mount
	// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams_AP'
	begin object name="TacticalParams_AP" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="AP Rounds"
		LayoutTags="AP"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.3000000
		SightingTime=0.6500000
		SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
		WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
		WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
		WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
		WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
		DisplaceDurationMult=1.4000000
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
		AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams_AP'
		FireParams[1]=none
		FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams_AP'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
		AltFireParams[1]=none
		AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	end object
	Layouts[2]=TacticalParams_AP
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Black'
	begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=FG50_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Wood'
	begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
		Weight=20
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=1
	end object
	Camos[1]=FG50_Wood
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Desert'
	begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Desert"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=2
	end object
	Camos[2]=FG50_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Dazzle'
	begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Dazzle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
		Index=3
	end object
	Camos[3]=FG50_Dazzle
	// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Gold'
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
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
begin object name="TacticalControlledAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
begin object name="TacticalStandardAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2560)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.7500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.0300000),(InVal=0.4000000,OutVal=-0.0900000),(InVal=0.5500000,OutVal=0.0500000),(InVal=0.7000000,OutVal=-0.0750000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.1000000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams'
begin object name="TacticalPriStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams'
begin object name="TacticalPriControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="HEAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
begin object name="TacticalSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardEffectParams'
begin object name="TacticalPriStandardEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=90
	HeadMult=3.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.AS50.FG50-Fire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	PushbackForce=150.0000000
	Chaos=0.2000000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledEffectParams'
begin object name="TacticalPriControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=90
	HeadMult=3.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrateForce=150
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire2',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1536.0000000
	PushbackForce=125.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardEffectParams_AP'
begin object name="TacticalPriStandardEffectParams_AP" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=95
	HeadMult=3.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrationEnergy=128.0000000
	PenetrateForce=450
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.FG50-HeavyFire',Volume=7.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2048.0000000
	PushbackForce=150.0000000
	Chaos=0.2000000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams_AP'
begin object name="TacticalPriStandardFireParams_AP" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	TargetState="APAmmo"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardEffectParams_AP'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledEffectParams_AP'
begin object name="TacticalPriControlledEffectParams_AP" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=95
	HeadMult=3.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_FG50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_FG50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_FG50Limb'
	PenetrationEnergy=128.0000000
	PenetrateForce=450
	PDamageFactor=0.8000000
	WallPDamageFactor=0.8000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.FG50FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.FG50-HeavyFire',Volume=6.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1536.0000000
	Chaos=0.0700000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams_AP'
begin object name="TacticalPriControlledFireParams_AP" class=BCoreProV55.FireParams
	FireInterval=1.0000000
	TargetState="APAmmo"
	FireEndAnim="None"
	FireAnimRate=1.8000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledEffectParams_AP'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecStandardEffectParams'
begin object name="TacticalSecStandardEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=90
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
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecStandardFireParams'
begin object name="TacticalSecStandardFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1650000
	TargetState="RapidFire"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecStandardEffectParams'
end object
// Reference: InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecControlledEffectParams'
begin object name="TacticalSecControlledEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	Damage=90
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
	PushbackForce=125.0000000
	Chaos=0.5000000
	Heat=1.5000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecControlledFireParams'
begin object name="TacticalSecControlledFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	TargetState="RapidFire"
	FireAnim="CFire"
	FireEndAnim="None"
	FireAnimRate=2.4000000
	AimedFireAnim="SGCFireAimed"
	FireEffectParams[0]=InstantEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecControlledEffectParams'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryEffectParams_Mount'
begin object name="TacticalSecondaryEffectParams_Mount" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Mount'
begin object name="TacticalSecondaryFireParams_Mount" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Mount"
	FireEffectParams[0]=FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryEffectParams_Mount'
end object
// Reference: FireEffectParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryEffectParams_Scope'
begin object name="TacticalSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Holosight"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.3000000
	SightingTime=0.6500000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecControlledFireParams'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecStandardFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams_Mount'
begin object name="TacticalParams_Mount" class=BCoreProV55.WeaponParams
	Weight=20
	LayoutName="Bipod"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.3000000
	SightingTime=0.6500000
	SightOffset=(X=0.0000000,Y=0.0500000,Z=2.0000000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=0.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=0.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=1.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=1.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=1.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Mount'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalParams_AP'
begin object name="TacticalParams_AP" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="AP Rounds"
	LayoutTags="AP"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.3000000
	SightingTime=0.6500000
	SightOffset=(X=3.0000000,Y=0.0000000,Z=3.2500000)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=50,Scale=1.0000000)
	WeaponBoneScales[1]=(BoneName="Holosight",Slot=51,Scale=1.0000000)
	WeaponBoneScales[2]=(BoneName="Support",Slot=52,Scale=0.0000000)
	WeaponBoneScales[3]=(BoneName="LegLeft",Slot=53,Scale=0.0000000)
	WeaponBoneScales[4]=(BoneName="LegRight",Slot=54,Scale=0.0000000)
	DisplaceDurationMult=1.4000000
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalStandardAimParams'
	AimParams[1]=AimParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalControlledAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriControlledFireParams_AP'
	FireParams[1]=none
	FireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalPriStandardFireParams_AP'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
	AltFireParams[1]=none
	AltFireParams[2]=FireParams'BWBP_SKC_Pro.FG50WeaponParamsTactical.TacticalSecondaryFireParams_Scope'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Black'
begin object name="FG50_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Wood'
begin object name="FG50_Wood" class=BCoreProV55.WeaponCamo
	Weight=20
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainWood",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Desert'
begin object name="FG50_Desert" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Desert"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDesert",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Dazzle'
begin object name="FG50_Dazzle" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Dazzle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainDazzle",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.FG50WeaponParamsTactical.FG50_Gold'
begin object name="FG50_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MainGold",Index=1,pIndex=0,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.FG50Camos.FG50-MiscDark",Index=2,pIndex=3,AIndex=2)
	Index=4
end object
