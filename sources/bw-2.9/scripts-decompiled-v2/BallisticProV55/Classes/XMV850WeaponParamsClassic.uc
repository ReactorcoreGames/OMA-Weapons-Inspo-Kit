class XMV850WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Default"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7000000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.6500000
		SightPivot=(Pitch=700,Yaw=0,Roll=2048)
		ViewOffset=(X=4.0000000,Y=5.0000000,Z=-4.0000000)
		MagAmmo=900
		WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Teal'
	begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Teal"
	end object
	Camos[0]=XMV_Teal
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Green'
	begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Green"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
		Index=1
	end object
	Camos[1]=XMV_Green
	// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Black'
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
// Reference: InstantEffectParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=12000.0000000,Max=12000.0000000)
	WaterTraceRange=9600.0000000
	Damage=17
	HeadMult=3.2000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTXMV850MG'
	DamageTypeHead=Class'BallisticProV55.DTXMV850MGHead'
	DamageTypeArm=Class'BallisticProV55.DTXMV850MG'
	PenetrationEnergy=22.0000000
	PenetrateForce=150
	bPenetrate=true
	PDamageFactor=0.6000000
	WallPDamageFactor=0.4000000
	MuzzleFlashClass=Class'BallisticProV55.XMV850FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.XMV-850.XMV-Fire-1',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=50.0000000
	PushbackForce=25.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0500000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=InstantEffectParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=none,Volume=1.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.3000000
	EffectString="Deploy weapon"
end object
// Reference: FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Drop"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.6000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.3000000
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	DeclineTime=2.5000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.5000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=512,Max=2048)
	AimAdjustTime=1.3000000
	CrouchMultiplier=0.5000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-6000,Yaw=-8000,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Default"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7000000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.6500000
	SightPivot=(Pitch=700,Yaw=0,Roll=2048)
	ViewOffset=(X=4.0000000,Y=5.0000000,Z=-4.0000000)
	MagAmmo=900
	WeaponModes[0]=(ModeName="1200 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="2400 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="3600 RPM",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.XMV850WeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Teal'
begin object name="XMV_Teal" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Teal"
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Green'
begin object name="XMV_Green" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Green"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV858_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.XMV850WeaponParamsClassic.XMV_Black'
begin object name="XMV_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Main",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.XMVCamos.XMV500_Barrels_SD",Index=2,pIndex=1,AIndex=2)
	Index=2
end object
