class LonghornWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Brass'
	begin object name="Long_Brass" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brass"
	end object
	Camos[0]=Long_Brass
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Black'
	begin object name="Long_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainBlack",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Long_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Green'
	begin object name="Long_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Reserve"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMil",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Long_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Silver'
	begin object name="Long_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainSilver",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Long_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Meat'
	begin object name="Long_Meat" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Meat"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMeat",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=Long_Meat
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LonghornGrenade'
	Speed=3500.0000000
	MaxSpeed=3500.0000000
	Damage=200.0000000
	DamageRadius=450.0000000
	MomentumTransfer=20000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	PushbackForce=300.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=150,Y=300)
	BotRefireRate=0.9000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4000000
	TargetState="TimedCharge"
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.LonghornMicroClusterAltImpact'
	Speed=3800.0000000
	Damage=25.0000000
	DamageRadius=250.0000000
	MomentumTransfer=15000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter_C'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-FireAlt',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	PushbackForce=800.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=500,Y=500)
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	bCockAfterFire=true
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=3072.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.1000000
	ViewBindFactor=0.3000000
	CrouchMultiplier=0.3000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=8,Max=2560)
	CrouchMultiplier=0.3000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=0,Roll=0)
	ViewBindFactor=0.2000000
	SprintChaos=0.2000000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=800
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Brass'
begin object name="Long_Brass" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brass"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Black'
begin object name="Long_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainBlack",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Green'
begin object name="Long_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Reserve"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMil",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Silver'
begin object name="Long_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainSilver",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsRealistic.Long_Meat'
begin object name="Long_Meat" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMeat",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
