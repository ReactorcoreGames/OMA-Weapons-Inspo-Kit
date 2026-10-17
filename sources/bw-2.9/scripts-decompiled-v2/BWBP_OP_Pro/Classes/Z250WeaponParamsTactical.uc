class Z250WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9500000
		InventorySize=7
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.4500000
		DisplaceDurationMult=1.2500000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BWBP_OP_Pro.Z250WeaponParamsTactical.Z250_Green'
	begin object name="Z250_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=Z250_Green
	// Reference: WeaponCamo'BWBP_OP_Pro.Z250WeaponParamsTactical.Z250_Gold'
	begin object name="Z250_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Z250Camos.Z250_body_SH2",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.Z250Camos.Z250_Sight_SH2",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=Z250_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	Damage=60
	HeadMult=3.0000000
	DamageType=Class'BWBP_OP_Pro.DTZ250Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTZ250Bullet'
	DamageTypeArm=Class'BWBP_OP_Pro.DTZ250Bullet'
	DamageSpecial=20
	PenetrateForce=150
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.Z250.Z250-DFire',Volume=5.7500000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=180.0000000
	PushbackForce=150.0000000
	Chaos=0.1200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.Z250Grenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	Damage=50.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BWBP_OP_Pro.Z250GrenadeFlashEmitter'
	FireSound=(Sound=Sound'BWBP_OP_Sounds.Z250.Z250-GrenadeFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	PreFireAnim="None"
	FireAnim="GLFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.0700000),(InVal=0.3000000,OutVal=0.0900000),(InVal=0.4500000,OutVal=0.2300000),(InVal=0.6000000,OutVal=0.2500000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1700000),(InVal=0.3500000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0700000
	YRandFactor=0.0700000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	DeclineDelay=0.2000000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=0.7000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-3072,Yaw=-3072,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9500000
	InventorySize=7
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.4500000
	DisplaceDurationMult=1.2500000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.Z250WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_OP_Pro.Z250WeaponParamsTactical.Z250_Green'
begin object name="Z250_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BWBP_OP_Pro.Z250WeaponParamsTactical.Z250_Gold'
begin object name="Z250_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.Z250Camos.Z250_body_SH2",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.Z250Camos.Z250_Sight_SH2",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
