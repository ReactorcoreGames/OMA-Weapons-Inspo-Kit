class HVPCMk5WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_Proto'
	begin object name="ClassicParams_Proto" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="MK1 Testbed"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightPivot=(Pitch=1024,Yaw=0,Roll=0)
		AllowedCamos[0]=0
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParams_Triple'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams_Green'
	end object
	Layouts[0]=ClassicParams_Proto
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_DX'
	begin object name="ClassicParams_DX" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="MK3 Tripleshot"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=1
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParams_Triple'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams_Green'
	end object
	Layouts[1]=ClassicParams_DX
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="MK5 Focused"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=2
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParamsSingle'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_Military'
	begin object name="ClassicParams_Military" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="E55 Plasma Cannon"
		LayoutTags="milspec"
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.5500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=3
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParamsSingle'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[3]=ClassicParams_Military
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Proto'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_DeusEx'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Standard'
	begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red Core"
		Index=2
	end object
	Camos[2]=HVPC_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Black'
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
// Reference: AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=150,Max=1900)
	AimAdjustTime=0.4000000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3000,Yaw=-5000,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.4000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=380
end object
// Reference: RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.3000000
	YRandFactor=0.3000000
	MaxRecoil=256.0000000
	DeclineTime=0.7500000
	ViewBindFactor=0.4500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParams_Triple'
begin object name="ClassicPrimaryFireParams_Triple" class=BCoreProV55.FireParams
	FireInterval=0.7200000
	AmmoPerFire=5
	TargetState="SpreadShot"
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryEffectParams_Triple'
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParamsSingle'
begin object name="ClassicPrimaryFireParamsSingle" class=BCoreProV55.FireParams
	FireInterval=0.7200000
	AmmoPerFire=5
	TargetState="SingleShot"
	BurstFireRateFactor=1.0000000
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1600000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams_Green'
begin object name="ClassicSecondaryFireParams_Green" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryEffectParams_Green'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryEffectParams_Triple'
begin object name="ClassicPrimaryEffectParams_Triple" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileTriple'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=50.0000000
	MaxSpeed=8000.0000000
	AccelSpeed=90000.0000000
	Damage=65.0000000
	DamageRadius=200.0000000
	MomentumTransfer=65000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=270.0000000
	Chaos=0.1500000
	Heat=3.0000000
	Inaccuracy=(X=256,Y=256)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5Projectile'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=50.0000000
	MaxSpeed=8000.0000000
	AccelSpeed=90000.0000000
	Damage=75.0000000
	DamageRadius=265.0000000
	MomentumTransfer=65000.0000000
	LimbMult=0.5000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=270.0000000
	Chaos=0.1500000
	Heat=1.5000000
	Inaccuracy=(X=6,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=200.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=150000.0000000
	Damage=30.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	LimbMult=0.6500000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0500000
	Heat=0.3000000
	Inaccuracy=(X=12,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryEffectParams_Green'
begin object name="ClassicSecondaryEffectParams_Green" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall_Green'
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=200.0000000
	MaxSpeed=2000000.0000000
	AccelSpeed=150000.0000000
	Damage=30.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	LimbMult=0.6500000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=100.0000000
	Chaos=0.0500000
	Heat=0.3000000
	Inaccuracy=(X=12,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_Proto'
begin object name="ClassicParams_Proto" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="MK1 Testbed"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightPivot=(Pitch=1024,Yaw=0,Roll=0)
	AllowedCamos[0]=0
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParams_Triple'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_DX'
begin object name="ClassicParams_DX" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="MK3 Tripleshot"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=1
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParams_Triple'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="MK5 Focused"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=2
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParamsSingle'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicParams_Military'
begin object name="ClassicParams_Military" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="E55 Plasma Cannon"
	LayoutTags="milspec"
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.5500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=3
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicPrimaryFireParamsSingle'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Proto'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_DeusEx'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Standard'
begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red Core"
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsClassic.HVPC_Black'
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
