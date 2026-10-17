class HVPCMk5WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams_Triple'
	begin object name="TacticalParams_Triple" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="MK3 Tripleshot"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=1
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams_Triple'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams_Green'
	end object
	Layouts[0]=TacticalParams_Triple
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="MK5 Supershot"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5500000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=2
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams
	// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams_Military'
	begin object name="TacticalParams_Military" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="E55 Plasma Cannon"
		LayoutTags="milspec"
		PlayerSpeedFactor=0.9500000
		PlayerJumpFactor=0.9500000
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5000000
		SightPivot=(Pitch=256,Yaw=0,Roll=0)
		AllowedCamos[0]=3
		MagAmmo=25
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[2]=TacticalParams_Military
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Proto'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_DeusEx'
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
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Standard'
	begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Red Core"
		Index=2
	end object
	Camos[2]=HVPC_Standard
	// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Black'
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
// Reference: AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.8000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-4000,Yaw=-3000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=1.2500000
	ChaosSpeedThreshold=300
end object
// Reference: RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.0500000),(InVal=0.3000000,OutVal=0.0700000),(InVal=0.6000000,OutVal=-0.0600000),(InVal=0.7000000,OutVal=-0.0600000),(InVal=1.0000000,OutVal=0.0000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=0.3000000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.4500000,OutVal=0.5500000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.1000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	ClimbTime=0.0500000
	DeclineTime=0.6000000
	ViewBindFactor=0.3000000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=5
	TargetState="SingleShot"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5Projectile'
	SpawnOffset=(X=25.0000000,Y=3.0000000,Z=-6.0000000)
	Speed=3000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=90000.0000000
	Damage=100.0000000
	DamageRadius=256.0000000
	MomentumTransfer=65000.0000000
	HeadMult=1.7500000
	LimbMult=0.8500000
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=700.0000000
	Chaos=0.4000000
	Heat=1.5000000
	Inaccuracy=(X=6,Y=6)
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryEffectParams_Triple'
begin object name="TacticalPrimaryEffectParams_Triple" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileTriple'
	SpawnOffset=(X=25.0000000,Y=3.0000000,Z=-6.0000000)
	Speed=3000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=90000.0000000
	Damage=70.0000000
	DamageRadius=200.0000000
	MomentumTransfer=65000.0000000
	HeadMult=1.7500000
	LimbMult=0.8500000
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-Fire',Volume=2.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=700.0000000
	Chaos=0.4000000
	Heat=3.0000000
	Inaccuracy=(X=256,Y=256)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams_Triple'
begin object name="TacticalPrimaryFireParams_Triple" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=5
	TargetState="SpreadShot"
	FireAnim="FireAlt"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryEffectParams_Triple'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall'
	SpawnOffset=(X=25.0000000,Y=3.0000000,Z=-6.0000000)
	Speed=6500.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=150000.0000000
	Damage=50.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	HeadMult=3.2500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.0250000
	Heat=0.3000000
	WarnTargetPct=0.2000000
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryEffectParams_Green'
begin object name="TacticalSecondaryEffectParams_Green" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.HVPCMk5ProjectileSmall_Green'
	SpawnOffset=(X=25.0000000,Y=3.0000000,Z=-6.0000000)
	Speed=6500.0000000
	MaxSpeed=20000.0000000
	AccelSpeed=150000.0000000
	Damage=50.0000000
	DamageRadius=122.0000000
	MomentumTransfer=12500.0000000
	HeadMult=3.2500000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.A48FlashEmitter'
	FlashScaleFactor=0.4000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.XavPlas.Xav-FireAlt',Volume=2.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.0250000
	Heat=0.3000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams_Green'
begin object name="TacticalSecondaryFireParams_Green" class=BCoreProV55.FireParams
	FireInterval=0.1800000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryEffectParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams_Triple'
begin object name="TacticalParams_Triple" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="MK3 Tripleshot"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=1
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams_Triple'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams_Green'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="MK5 Supershot"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5500000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=2
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalParams_Military'
begin object name="TacticalParams_Military" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="E55 Plasma Cannon"
	LayoutTags="milspec"
	PlayerSpeedFactor=0.9500000
	PlayerJumpFactor=0.9500000
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5000000
	SightPivot=(Pitch=256,Yaw=0,Roll=0)
	AllowedCamos[0]=3
	MagAmmo=25
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Proto'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_DeusEx'
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
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Standard'
begin object name="HVPC_Standard" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Red Core"
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.HVPCMk5WeaponParamsTactical.HVPC_Black'
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
