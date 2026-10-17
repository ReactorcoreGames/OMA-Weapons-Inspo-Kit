class HVPCMk5WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams_Triple'
	begin object name="RealisticParams_Triple" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="MK3 Tripleshot"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponName="HVM Experimental Plasma Cannon Mk5"
		AllowedCamos[0]=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams_Triple'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams_Green'
	end object
	Layouts[0]=RealisticParams_Triple
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="MK5 Supershot"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponName="HVM Experimental Plasma Cannon Mk3"
		AllowedCamos[0]=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[1]=RealisticParams
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams_Military'
	begin object name="RealisticParams_Military" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="E55 Plasma Cannon"
		LayoutTags="milspec"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=10
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		WeaponName="HVM E55 Plasma Cannon"
		AllowedCamos[0]=3
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[2]=RealisticParams_Military
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Proto'
	begin object name="HVPC_Proto" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Prototype"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MainProto",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MiscProto",Index=2,pIndex=2,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=3,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
	end object
	Camos[0]=HVPC_Proto
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_DeusEx'
	begin object name="HVPC_DeusEx" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green Core"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPCCamos.HVPC-Main",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPCCamos.HVPC-Misc",Index=2,pIndex=2,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=3,pIndex=3,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
		Index=1
	end object
	Camos[1]=HVPC_DeusEx
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Standard'
	begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red Core"
		Index=2
	end object
	Camos[2]=HVPC_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Black'
	begin object name="HVPC_Black" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Mil-Spec"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MainBlack",Index=1,pIndex=1,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MiscBlack",Index=2,pIndex=2,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=3,pIndex=3,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
		WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
		Index=3
	end object
	Camos[3]=HVPC_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=3072)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=1.6000000
	ChaosSpeedThreshold=375
end object
// Reference: RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.6000000,OutVal=0.2000000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.6000000,OutVal=0.4000000),(InVal=0.8000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=0.5000000)))
	YawFactor=0.2000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=2048.0000000
	DeclineTime=1.7500000
	ViewBindFactor=0.3500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7200000
	AmmoPerFire=5
	TargetState="SingleShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5Projectile'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-9.0000000)
	Speed=1350.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=90000.0000000
	Damage=160.0000000
	DamageRadius=512.0000000
	MomentumTransfer=65000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=270.0000000
	Chaos=0.1500000
	Heat=1.5000000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryEffectParams_Triple'
begin object name="RealisticPrimaryEffectParams_Triple" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileTriple'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-9.0000000)
	Speed=1350.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=90000.0000000
	Damage=85.0000000
	DamageRadius=278.0000000
	MomentumTransfer=65000.0000000
	LimbMult=0.5000000
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=270.0000000
	Chaos=0.1500000
	Heat=3.0000000
	Inaccuracy=(X=256,Y=256)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams_Triple'
begin object name="RealisticPrimaryFireParams_Triple" class=BCoreProV55.FireParams
	FireInterval=0.7200000
	AmmoPerFire=5
	TargetState="SpreadShot"
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryEffectParams_Triple'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-9.0000000)
	Speed=200.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=150000.0000000
	Damage=30.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	LimbMult=0.6500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=10.0000000
	Chaos=0.0500000
	Heat=0.3000000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryEffectParams_Green'
begin object name="RealisticSecondaryEffectParams_Green" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall_Green'
	SpawnOffset=(X=0.0000000,Y=0.0000000,Z=-9.0000000)
	Speed=200.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=150000.0000000
	Damage=30.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	LimbMult=0.6500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=1.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=10.0000000
	Chaos=0.0500000
	Heat=0.3000000
	Inaccuracy=(X=12,Y=12)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams_Green'
begin object name="RealisticSecondaryFireParams_Green" class=BCoreProV55.FireParams
	FireInterval=0.1850000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryEffectParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams_Triple'
begin object name="RealisticParams_Triple" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="MK3 Tripleshot"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponName="HVM Experimental Plasma Cannon Mk5"
	AllowedCamos[0]=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams_Triple'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="MK5 Supershot"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponName="HVM Experimental Plasma Cannon Mk3"
	AllowedCamos[0]=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticParams_Military'
begin object name="RealisticParams_Military" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="E55 Plasma Cannon"
	LayoutTags="milspec"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=10
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	WeaponName="HVM E55 Plasma Cannon"
	AllowedCamos[0]=3
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Proto'
begin object name="HVPC_Proto" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Prototype"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MainProto",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MiscProto",Index=2,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Texture'BW_Core_WeaponTex.Misc.Invisible',MaterialName="",Index=3,pIndex=3,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_DeusEx'
begin object name="HVPC_DeusEx" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green Core"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPCCamos.HVPC-Main",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPCCamos.HVPC-Misc",Index=2,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=3,pIndex=3,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Standard'
begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red Core"
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsRealistic.HVPC_Black'
begin object name="HVPC_Black" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Mil-Spec"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MainBlack",Index=1,pIndex=1,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_SKC_Tex.HVPC.HVPC-MiscBlack",Index=2,pIndex=2,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=Shader'BWBP_SKC_Tex.Eagle.Eagle-SightDot',MaterialName="",Index=3,pIndex=3,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BWBP_SKC_Tex.Stim.Stim-Glass',MaterialName="",Index=4,pIndex=4,AIndex=3)
	WeaponMaterialSwaps[5]=(Material=TexPanner'BWBP_SKC_Tex.X82.X82MeatPan',MaterialName="",Index=5,pIndex=5,AIndex=-1)
	Index=3
end object
