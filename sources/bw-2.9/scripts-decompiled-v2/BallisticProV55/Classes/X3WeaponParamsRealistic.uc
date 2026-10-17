class X3WeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.X3WeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=1.1500000
		InventorySize=1
		SightMoveSpeedFactor=0.5000000
		ViewPivot=(Pitch=0,Yaw=32768,Roll=0)
		WeaponName="X3 Combat Knife"
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireProjParams'
		AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticSecondaryFireParams'
		AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireProjParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsRealistic.X3_Silver'
	begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=X3_Silver
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsRealistic.X3_Black'
	begin object name="X3_Black" class=BCoreProV55.WeaponCamo
		Weight=15
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=X3_Black
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireProjParams'
begin object name="RealisticPrimaryFireProjParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.5000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryProjEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=78.0000000,Max=78.0000000)
	WaterTraceRange=5000.0000000
	Damage=38
	HeadMult=2.2368420
	LimbMult=0.4473680
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	HookStopFactor=1.0000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3333330
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slice1"
	FireAnimRate=2.0000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryProjEffectParams'
begin object name="RealisticPrimaryProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=1500.0000000
	Damage=50.0000000
	HeadMult=2.5000000
	LimbMult=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifeThrow',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=104.0000000,Max=104.0000000)
	WaterTraceRange=5000.0000000
	Damage=74
	HeadMult=2.2567560
	LimbMult=0.4459450
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	HookStopFactor=1.5000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="BigBack1"
	FireAnim="BigStab1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.X3WeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.X3WeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.X3WeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=1.1500000
	InventorySize=1
	SightMoveSpeedFactor=0.5000000
	ViewPivot=(Pitch=0,Yaw=32768,Roll=0)
	WeaponName="X3 Combat Knife"
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireProjParams'
	AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticSecondaryFireParams'
	AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsRealistic.RealisticPrimaryFireProjParams'
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsRealistic.X3_Silver'
begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsRealistic.X3_Black'
begin object name="X3_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
