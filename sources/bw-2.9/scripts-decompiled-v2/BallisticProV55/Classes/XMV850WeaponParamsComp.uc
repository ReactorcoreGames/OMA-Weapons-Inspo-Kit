class XMV850WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Default"
		PlayerSpeedFactor=0.9000000
		PlayerJumpFactor=0.9000000
		InventorySize=7
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.7000000
		SightingTime=0.6000000
		SightPivot=(Pitch=700,Yaw=0,Roll=2048)
		DisplaceDurationMult=1.4000000
		MagAmmo=300
		RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Teal'
	begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Teal"
	end object
	Camos[0]=XMV_Teal
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Green'
	begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
		Index=1
	end object
	Camos[1]=XMV_Green
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Black'
	begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=2)
		Index=2
	end object
	Camos[2]=XMV_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BallisticProV55.XMV850WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	DecayRange=(Min=1575.0000000,Max=3675.0000000)
	RangeAtten=0.6700000
	Damage=23
	DamageType=Class'BallisticProV55.DTXMV850MG'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MG'
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Fire-1',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=72.0000000
	PushbackForce=150.0000000
	Chaos=0.1200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMV850WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMV850WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	FireAnim="Undeploy"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMV850WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XMV850WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1000000),(InVal=0.2000000,OutVal=0.2200000),(InVal=0.3000000,OutVal=0.2800000),(InVal=0.4000000,OutVal=0.4000000),(InVal=0.5000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=0.1000000),(InVal=0.7000000,OutVal=0.2500000),(InVal=0.8000000,OutVal=0.4000000),(InVal=1.0000000,OutVal=0.6000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1700000),(InVal=0.3500000,OutVal=-0.4000000),(InVal=0.5000000,OutVal=-0.7000000),(InVal=1.0000000,OutVal=-1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	MaxRecoil=8192.0000000
	ClimbTime=0.0400000
	DeclineTime=1.5000000
	ViewBindFactor=0.1000000
	CrouchMultiplier=0.7500000
end object
// Reference: AimParams'BallisticProV55.XMV850WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1536)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=2000,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Default"
	PlayerSpeedFactor=0.9000000
	PlayerJumpFactor=0.9000000
	InventorySize=7
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.7000000
	SightingTime=0.6000000
	SightPivot=(Pitch=700,Yaw=0,Roll=2048)
	DisplaceDurationMult=1.4000000
	MagAmmo=300
	RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Teal'
begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Teal"
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Green'
begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsComp.XMV_Black'
begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=2
end object
