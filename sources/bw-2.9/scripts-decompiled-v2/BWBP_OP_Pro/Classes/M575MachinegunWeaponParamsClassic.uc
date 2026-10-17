class M575MachinegunWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		MagAmmo=50
		bNeedCock=true
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicRecoilParams'
		RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryIceFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Black'
	begin object name="M575_Black" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Black"
	end object
	Camos[0]=M575_Black
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Blacker'
	begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Midnight"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
		Index=1
	end object
	Camos[1]=M575_Blacker
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Jungle'
	begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=M575_Jungle
	// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Oil'
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
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1020000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0700000,OutVal=0.0500000),(InVal=0.1000000,OutVal=0.0850000),(InVal=0.1800000,OutVal=0.0600000),(InVal=0.3000000,OutVal=0.1000000),(InVal=0.5000000,OutVal=0.2000000),(InVal=0.6500000,OutVal=0.3000000),(InVal=0.7000000,OutVal=0.4500000),(InVal=0.8500000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.5500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.0500000,OutVal=0.0700000),(InVal=0.1000000,OutVal=0.1200000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5500000,OutVal=0.6500000),(InVal=0.6500000,OutVal=0.7500000),(InVal=0.8000000,OutVal=0.8200000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.3500000
	YRandFactor=0.3500000
	MaxRecoil=5000.0000000
	DeclineTime=1.0000000
	DeclineDelay=0.1500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.3500000
	Damage=30
	LimbMult=1.0000000
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.Fifty9FlashEmitter_C'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.M575.M575-Fire',Volume=1.4000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=16,Y=16)
	WarnTargetPct=0.2000000
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryIceEffectParams'
begin object name="ClassicPrimaryIceEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	WaterTraceRange=5000.0000000
	RangeAtten=0.2000000
	Damage=25
	LimbMult=1.0000000
	DamageType=Class'BWBP_OP_Pro.DTM575MG'
	DamageTypeHead=Class'BWBP_OP_Pro.DTM575MGHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTM575MG'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SX45CryoFlash'
	FlashScaleFactor=0.2500000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.M575.M575-FireFrost',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=70.0000000
	Chaos=0.0500000
	Inaccuracy=(X=16,Y=16)
end object
// Reference: FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryIceFireParams'
begin object name="ClassicPrimaryIceFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1080000
	BurstFireRateFactor=1.0000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryIceEffectParams'
end object
// Reference: AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=32,Max=2560)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=15000
end object
// Reference: WeaponParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	MagAmmo=50
	bNeedCock=true
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicRecoilParams'
	RecoilParams[1]=RecoilParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[2]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[3]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[4]=FireParams'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.ClassicPrimaryIceFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Black'
begin object name="M575_Black" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Black"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Blacker'
begin object name="M575_Blacker" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Midnight"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_CM2",Index=3,pIndex=3,AIndex=3)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Jungle'
begin object name="M575_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH2",Index=3,pIndex=3,AIndex=3)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.M575MachinegunWeaponParamsClassic.M575_Oil'
begin object name="M575_Oil" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Oil Slick"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.M575Camos.M575_body_SH3",Index=3,pIndex=3,AIndex=3)
	Index=3
end object
