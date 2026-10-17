class M575MachinegunWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=7
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.5500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_RDS'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_Scope'
		AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Black'
	begin object name="M575_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M575_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Blacker'
	begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Midnight"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=M575_Blacker
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Jungle'
	begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=M575_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Oil'
	begin object name="M575_Oil" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Oil Slick"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH3",Index=3,pIndex=3,AIndex=3)
		Index=3
	end object
	Camos[3]=M575_Oil
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=55
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.M575.M575-FireHeavy',Volume=2.3000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=250.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=2625.0000000,Max=6300.0000000)
	RangeAtten=0.7500000
	Damage=65
	DamageType=Class'BWBP_OP_Pro.DTM575Freeze'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575Freeze'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575Freeze'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-FireFrost',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=250.0000000
	Chaos=0.0500000
end object
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1220000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_RDS'
begin object name="TacticalRecoilParams_RDS" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1800000,OutVal=-0.0200000),(InVal=0.3000000,OutVal=0.0400000),(InVal=0.5000000,OutVal=0.0300000),(InVal=0.6500000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0200000),(InVal=0.8500000,OutVal=0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=12288.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_Scope'
begin object name="TacticalRecoilParams_Scope" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1800000,OutVal=-0.0200000),(InVal=0.3000000,OutVal=0.0400000),(InVal=0.5000000,OutVal=0.0300000),(InVal=0.6500000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0200000),(InVal=0.8500000,OutVal=0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=12288.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.2500000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=7
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.5500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_RDS'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalRecoilParams_Scope'
	AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Black'
begin object name="M575_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Blacker'
begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Midnight"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Jungle'
begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsTactical.M575_Oil'
begin object name="M575_Oil" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Oil Slick"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH3",Index=3,pIndex=3,AIndex=3)
	Index=3
end object
