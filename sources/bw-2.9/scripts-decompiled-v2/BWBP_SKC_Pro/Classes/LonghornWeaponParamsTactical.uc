class LonghornWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=4
		SightMoveSpeedFactor=0.6000000
		SightPivot=(Pitch=150,Yaw=0,Roll=0)
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Brass'
	begin object name="Long_Brass" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brass"
	end object
	Camos[0]=Long_Brass
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Black'
	begin object name="Long_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainBlack",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=Long_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Green'
	begin object name="Long_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Reserve"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMil",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=Long_Green
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Silver'
	begin object name="Long_Silver" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Silver"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainSilver",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=Long_Silver
	// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Meat'
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
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=150.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.LonghornGrenade'
	SpawnOffset=(X=20.0000000,Y=4.0000000,Z=-6.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=150.0000000
	DamageRadius=450.0000000
	MomentumTransfer=100000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=300.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.6000000
	bCockAfterFire=true
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=45.0000000
	ProjectileClass=Class'BWBP_SKC_Pro.LonghornMicroClusterAlt'
	SpawnOffset=(X=20.0000000,Y=4.0000000,Z=-6.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=45.0000000
	DamageRadius=256.0000000
	MomentumTransfer=25000.0000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Longhorn.Longhorn-FireAlt',Volume=1.7000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	PushbackForce=800.0000000
	Chaos=1.0000000
	Inaccuracy=(X=256,Y=256)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	bCockAfterFire=true
	FireAnimRate=1.5000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XRandFactor=0.3500000
	YRandFactor=0.2000000
	MinRandFactor=0.2000000
	ClimbTime=0.0800000
	DeclineDelay=0.2500000
	HipMultiplier=1.5000000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.2000000
	FallingChaos=0.2000000
	SprintChaos=0.2000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=4
	SightMoveSpeedFactor=0.6000000
	SightPivot=(Pitch=150,Yaw=0,Roll=0)
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.LonghornWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Brass'
begin object name="Long_Brass" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brass"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Black'
begin object name="Long_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainBlack",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Green'
begin object name="Long_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Reserve"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMil",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Silver'
begin object name="Long_Silver" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Silver"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainSilver",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.LonghornWeaponParamsTactical.Long_Meat'
begin object name="Long_Meat" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Meat"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.LonghornCamos.Longhorn-MainMeat",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
