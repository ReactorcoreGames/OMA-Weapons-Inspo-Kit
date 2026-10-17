class M575MachinegunWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.5500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
		FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Black'
	begin object name="M575_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M575_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Blacker'
	begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Midnight"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=M575_Blacker
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Jungle'
	begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=M575_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Oil'
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
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.1800000,OutVal=-0.0200000),(InVal=0.3000000,OutVal=0.0400000),(InVal=0.5000000,OutVal=0.0300000),(InVal=0.6500000,OutVal=0.0000000),(InVal=0.7000000,OutVal=-0.0200000),(InVal=0.8500000,OutVal=0.0100000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=12288.0000000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1300000
	ViewBindFactor=0.4500000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DecayRange=(Min=2363.0000000,Max=5000.0000000)
	RangeAtten=0.6700000
	Damage=45
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.M575.M575-Fire',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=true)
	Recoil=250.0000000
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	DecayRange=(Min=2363.0000000,Max=5000.0000000)
	RangeAtten=0.2000000
	Damage=45
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
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1200000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=88,Max=768)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.2000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.5500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaPrimaryFireParams'
	FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Black'
begin object name="M575_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Blacker'
begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Midnight"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Jungle'
begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsComp.M575_Oil'
begin object name="M575_Oil" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Oil Slick"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH3",Index=3,pIndex=3,AIndex=3)
	Index=3
end object
