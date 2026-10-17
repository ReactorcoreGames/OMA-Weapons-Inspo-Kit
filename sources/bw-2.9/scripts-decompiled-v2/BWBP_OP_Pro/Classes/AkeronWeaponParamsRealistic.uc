class AkeronWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.5000000
		SightOffset=(X=20.0000000,Y=-17.0000000,Z=-1.5000000)
		ZoomType=2
		WeaponName="AN-56 Akeron 60mm Guided Missile Launcher"
		DisplaceDurationMult=1.2500000
		MagAmmo=3
		WeaponModes[0]=(ModeName="Mode: Barrage",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Mode: High Velocity",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="Mode: Barrage",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryBarrageFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Brown'
	begin object name="AN56_Brown" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brown"
	end object
	Camos[0]=AN56_Brown
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Blue'
	begin object name="AN56_Blue" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontBlue",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackBlue",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=AN56_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Red'
	begin object name="AN56_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontRed",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackRed",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=2
	end object
	Camos[2]=AN56_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_White'
	begin object name="AN56_White" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontWhite",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackWhite",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=3
	end object
	Camos[3]=AN56_White
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Stripes'
	begin object name="AN56_Stripes" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="MLN Labs"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontStripes",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackStripes",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=4
	end object
	Camos[4]=AN56_Stripes
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Meat'
	begin object name="AN56_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="MEAT"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontMeat",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackMeat",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=5
	end object
	Camos[5]=AN56_Meat
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Gold'
	begin object name="AN56_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontGold",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackGold",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
		Index=6
	end object
	Camos[6]=AN56_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocketHE'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=15000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=100000.0000000
	Damage=200.0000000
	DamageRadius=150.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=386.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2500000
end object
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryBarrageEffectParams'
begin object name="RealisticPrimaryBarrageEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocketHE'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=800.0000000
	MaxSpeed=4000.0000000
	AccelSpeed=8000.0000000
	Damage=200.0000000
	DamageRadius=150.0000000
	MomentumTransfer=70000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-FireDumb',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=512.0000000
	Chaos=0.5000000
	Inaccuracy=(X=100,Y=100)
	BotRefireRate=0.5000000
	WarnTargetPct=0.2500000
end object
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryBarrageFireParams'
begin object name="RealisticPrimaryBarrageFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryBarrageEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	SpawnOffset=(X=50.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=4000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=100000.0000000
	Damage=105.0000000
	DamageRadius=300.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	DeclineTime=1.0000000
	ViewBindFactor=0.7500000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.6500000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=300
	ChaosDeclineTime=2.8000000
	ChaosSpeedThreshold=440
end object
// Reference: WeaponParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.5000000
	SightOffset=(X=20.0000000,Y=-17.0000000,Z=-1.5000000)
	ZoomType=2
	WeaponName="AN-56 Akeron 60mm Guided Missile Launcher"
	DisplaceDurationMult=1.2500000
	MagAmmo=3
	WeaponModes[0]=(ModeName="Mode: Barrage",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Mode: High Velocity",bUnavailable=false,ModeID="WM_SemiAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="Mode: Barrage",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryBarrageFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Brown'
begin object name="AN56_Brown" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brown"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Blue'
begin object name="AN56_Blue" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontBlue",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackBlue",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Red'
begin object name="AN56_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontRed",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackRed",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_White'
begin object name="AN56_White" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontWhite",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackWhite",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Stripes'
begin object name="AN56_Stripes" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="MLN Labs"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontStripes",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackStripes",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Meat'
begin object name="AN56_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MEAT"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontMeat",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackMeat",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsRealistic.AN56_Gold'
begin object name="AN56_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackGold",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=6
end object
