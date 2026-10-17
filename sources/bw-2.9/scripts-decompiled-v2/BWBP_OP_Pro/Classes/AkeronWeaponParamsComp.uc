class AkeronWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.4500000
		SightOffset=(X=20.0000000,Y=-17.0000000,Z=-1.5000000)
		ZoomType=2
		ScopeScale=0.7000000
		DisplaceDurationMult=1.2500000
		MagAmmo=9
		InitialWeaponMode=1
		WeaponModes[0]=(ModeName="Barrage",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="High Velocity",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="N/A",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryBarrageFireParams'
		FireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Brown'
	begin object name="AN56_Brown" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Brown"
	end object
	Camos[0]=AN56_Brown
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Blue'
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
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Red'
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
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_White'
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
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Stripes'
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
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Meat'
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
	// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Gold'
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
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=4000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=100000.0000000
	Damage=90.0000000
	DamageRadius=400.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=128.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2500000
end object
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryBarrageEffectParams'
begin object name="ArenaPrimaryBarrageEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=3000.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=100000.0000000
	Damage=90.0000000
	DamageRadius=400.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.Misc.M202-FireDumb',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.8000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.2500000
end object
// Reference: FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryBarrageFireParams'
begin object name="ArenaPrimaryBarrageFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=0.3000000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryBarrageEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	SpawnOffset=(X=50.0000000,Y=10.0000000,Z=-3.0000000)
	Speed=4000.0000000
	MaxSpeed=35000.0000000
	AccelSpeed=100000.0000000
	Damage=90.0000000
	DamageRadius=400.0000000
	MomentumTransfer=70000.0000000
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=64.0000000
	Chaos=0.5000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	ClimbTime=0.0400000
	DeclineTime=1.0000000
	ViewBindFactor=0.7500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=768)
	AimAdjustTime=1.0000000
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.4500000
	SightOffset=(X=20.0000000,Y=-17.0000000,Z=-1.5000000)
	ZoomType=2
	ScopeScale=0.7000000
	DisplaceDurationMult=1.2500000
	MagAmmo=9
	InitialWeaponMode=1
	WeaponModes[0]=(ModeName="Barrage",bUnavailable=false,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="High Velocity",bUnavailable=false,ModeID="WM_FullAuto",Value=1.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="N/A",bUnavailable=true,ModeID="WM_BigBurst",Value=3.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryBarrageFireParams'
	FireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.AkeronWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Brown'
begin object name="AN56_Brown" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Brown"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Blue'
begin object name="AN56_Blue" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontBlue",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackBlue",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Red'
begin object name="AN56_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontRed",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackRed",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_White'
begin object name="AN56_White" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontWhite",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackWhite",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Stripes'
begin object name="AN56_Stripes" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="MLN Labs"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontStripes",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackStripes",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Meat'
begin object name="AN56_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MEAT"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontMeat",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackMeat",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_OP_Pro.AkeronWeaponParamsComp.AN56_Gold'
begin object name="AN56_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-FrontGold",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-BackGold",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.AkeronCamos.Akeron-GripBlack",Index=3,pIndex=2,AIndex=2)
	Index=6
end object
