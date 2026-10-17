class RaygunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Rapid-Ray"
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		DisplaceDurationMult=0.7500000
		MagAmmo=24
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalParams_Blast'
	begin object name="TacticalParams_Blast" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Explo-Ray"
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightPivot=(Pitch=450,Yaw=0,Roll=0)
		DisplaceDurationMult=0.7500000
		MagAmmo=24
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams_Blast'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Blast
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Silver'
	begin object name="Raygun_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=Raygun_Silver
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Blue'
	begin object name="Raygun_Blue" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Blue_S",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Raygun_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Black'
	begin object name="Raygun_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Black_S",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Raygun_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Wood'
	begin object name="Raygun_Wood" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Wood"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Wooden_S",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Raygun_Wood
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Emerald'
	begin object name="Raygun_Emerald" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Emerald"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Emerald_S",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Raygun_Emerald
	// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Gold'
	begin object name="Raygun_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_GnB_S",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=Raygun_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=8
	MaxHoldTime=2.5000000
	FireAnim="ChargedFire"
	FireEndAnim="None"
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0500000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.3000000,OutVal=0.1400000),(InVal=0.6000000,OutVal=0.1200000),(InVal=0.7000000,OutVal=0.1200000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1500000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=0.3200000),(InVal=0.4500000,OutVal=0.4000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0600000
	DeclineTime=1.0000000
	DeclineDelay=0.1800000
	EscapeMultiplier=1.2000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: AimParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RaygunProjectile'
	SpawnOffset=(X=40.0000000,Y=3.0000000,Z=-15.0000000)
	Speed=4500.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=80000.0000000
	Damage=70.0000000
	MaxDamageGainFactor=0.5000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlashAlt'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Raygun.Raygun-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=260.0000000
	Chaos=0.0700000
	BotRefireRate=0.7000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1850000
	FireAnim="FireSmall"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryEffectParams_Blast'
begin object name="TacticalPrimaryEffectParams_Blast" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.RaygunBlastProjectile'
	SpawnOffset=(X=40.0000000,Y=3.0000000,Z=-15.0000000)
	Speed=2300.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=80000.0000000
	Damage=90.0000000
	DamageRadius=100.0000000
	MaxDamageGainFactor=0.5000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlashAlt'
	FlashScaleFactor=2.5000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Raygun.Raygun-BlastFireHeavy',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=260.0000000
	Chaos=0.0700000
	BotRefireRate=0.7000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams_Blast'
begin object name="TacticalPrimaryFireParams_Blast" class=BCoreProV55.FireParams
	FireInterval=0.3300000
	FireAnim="FireSmall"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryEffectParams_Blast'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DTRaygunCharged'
	DamageTypeHead=Class'BWBP_OP_Pro.DTRaygunCharged'
	DamageTypeArm=Class'BWBP_OP_Pro.DTRaygunCharged'
	MuzzleFlashClass=Class'BWBP_OP_Pro.RaygunMuzzleFlash'
	FlashScaleFactor=4.0000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Raygun.Raygun-FireBig',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=960.0000000
	Chaos=0.3200000
	BotRefireRate=0.2500000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Rapid-Ray"
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	DisplaceDurationMult=0.7500000
	MagAmmo=24
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalParams_Blast'
begin object name="TacticalParams_Blast" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Explo-Ray"
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightPivot=(Pitch=450,Yaw=0,Roll=0)
	DisplaceDurationMult=0.7500000
	MagAmmo=24
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalPrimaryFireParams_Blast'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.RaygunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Silver'
begin object name="Raygun_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Blue'
begin object name="Raygun_Blue" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Blue_S",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Black'
begin object name="Raygun_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Black_S",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Wood'
begin object name="Raygun_Wood" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Wood"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Wooden_S",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Emerald'
begin object name="Raygun_Emerald" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Emerald"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_Emerald_S",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.RaygunWeaponParamsTactical.Raygun_Gold'
begin object name="Raygun_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RaygunCamos.Raygun_GnB_S",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
