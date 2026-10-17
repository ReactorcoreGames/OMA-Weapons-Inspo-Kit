class CX61WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.3000000
		WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireHealParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaParams_Spike'
	begin object name="ArenaParams_Spike" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="Cryon Spikes"
		CockAnimRate=1.2500000
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.8000000
		SightingTime=0.3000000
		MagAmmo=16
		WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams_Spike'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireParams'
		AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireHealParams'
	end object
	Layouts[1]=ArenaParams_Spike
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Blue'
	begin object name="CX61_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=CX61_Blue
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Red'
	begin object name="CX61_Red" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainRedShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
		Index=1
	end object
	Camos[1]=CX61_Red
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_White'
	begin object name="CX61_White" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainWhiteShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=CX61_White
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Hex'
	begin object name="CX61_Hex" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Hex Blue"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainHexShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=CX61_Hex
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Stripes'
	begin object name="CX61_Stripes" class=BCoreProV55.WeaponCamo
		Weight=7
		CamoName="Limited"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainStripesShine",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=CX61_Stripes
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Meat'
	begin object name="CX61_Meat" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="MEAT"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainMeat",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
		Index=5
	end object
	Camos[5]=CX61_Meat
	// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Gold'
	begin object name="CX61_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainGold",Index=1,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=CX61_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-FlameLoopStart',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0500000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AmmoPerFire=0
	TargetState="Flamer"
	FireAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireHealParams'
begin object name="ArenaSecondaryFireHealParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	AmmoPerFire=0
	TargetState="HealGas"
	FireAnim="None"
	FireEffectParams[0]=FireEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.0300000),(InVal=0.4000000,OutVal=0.1100000),(InVal=0.5000000,OutVal=0.0500000),(InVal=0.6000000,OutVal=-0.0200000),(InVal=0.8000000,OutVal=0.0400000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.1900000),(InVal=0.4000000,OutVal=0.3600000),(InVal=0.6000000,OutVal=0.6200000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1350000
	ViewBindFactor=0.4000000
	HipMultiplier=1.2500000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=64,Max=512)
	AimAdjustTime=0.4000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	DecayRange=(Min=1250.0000000,Max=3750.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BWBP_OP_Pro.DT_CX61Chest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_CX61Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_CX61Chest'
	PenetrationEnergy=32.0000000
	PenetrateForce=180
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=1.6000000
	FireSound=(Sound=Sound'BWBP_OP_Sounds.CX61.CX61-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=150.0000000
	Chaos=0.0300000
	Inaccuracy=(X=48,Y=48)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryEffectParams_Spike'
begin object name="ArenaPrimaryEffectParams_Spike" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.CX61Flechette'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=15000.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=1000.0000000
	Damage=45.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.7000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX61.CX61-FireHeavy',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=256.0000000
	Chaos=-1.0000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams_Spike'
begin object name="ArenaPrimaryFireParams_Spike" class=BCoreProV55.FireParams
	FireInterval=0.3750000
	TargetState="Flechette"
	BurstFireRateFactor=0.4000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryEffectParams_Spike'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.3000000
	WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireHealParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaParams_Spike'
begin object name="ArenaParams_Spike" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="Cryon Spikes"
	CockAnimRate=1.2500000
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.8000000
	SightingTime=0.3000000
	MagAmmo=16
	WeaponModes[0]=(ModeName="Flamethrower",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Healing Gas",bUnavailable=false,ModeID="WM_BigBurst",Value=2.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaPrimaryFireParams_Spike'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireParams'
	AltFireParams[1]=FireParams'BWBP_OP_Pro.CX61WeaponParamsComp.ArenaSecondaryFireHealParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Blue'
begin object name="CX61_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Red'
begin object name="CX61_Red" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainRedShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_White'
begin object name="CX61_White" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainWhiteShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Hex'
begin object name="CX61_Hex" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Hex Blue"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainHexShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Stripes'
begin object name="CX61_Stripes" class=BCoreProV55.WeaponCamo
	Weight=7
	CamoName="Limited"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainStripesShine",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Meat'
begin object name="CX61_Meat" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="MEAT"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainMeat",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=TexOscillator'BW_Core_WeaponTex.A73RedLayout.A73BEnergyOsc',MaterialName="",Index=4,pIndex=2,AIndex=2)
	Index=5
end object
// Reference: WeaponCamo'BWBP_OP_Pro.CX61WeaponParamsComp.CX61_Gold'
begin object name="CX61_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.CX61Camos.CX61-MainGold",Index=1,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[2]=(Material=Shader'BWBP_OP_Tex.CX61.CX61-MagShine',MaterialName="",Index=2,pIndex=0,AIndex=0)
	Index=6
end object
