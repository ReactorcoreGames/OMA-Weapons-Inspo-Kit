class X3WeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.X3WeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Silver"
		PlayerSpeedFactor=1.1500000
		InventorySize=1
		SightMoveSpeedFactor=0.5000000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireProjParams'
		AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicSecondaryFireParams'
		AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireProjParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsClassic.X3_Silver'
	begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=X3_Silver
	// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsClassic.X3_Black'
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
// Reference: FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireProjParams'
begin object name="ClassicPrimaryFireProjParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	BurstFireRateFactor=1.0000000
	FireAnimRate=2.5000000
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryProjEffectParams'
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=35
	HeadMult=2.5000000
	LimbMult=0.6000000
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	HookStopFactor=1.3000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	FireAnim="Slice1"
	FireAnimRate=2.5000000
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryProjEffectParams'
begin object name="ClassicPrimaryProjEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	Damage=35.0000000
	HeadMult=2.5000000
	LimbMult=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Knife.KnifeThrow',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.1000000
end object
// Reference: MeleeEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.MeleeEffectParams
	TraceRange=(Min=96.0000000,Max=96.0000000)
	WaterTraceRange=5000.0000000
	Damage=75
	HeadMult=1.5000000
	LimbMult=0.5000000
	DamageType=Class'BallisticProV55.DTX3Knife'
	DamageTypeHead=Class'BallisticProV55.DTX3KnifeHead'
	DamageTypeArm=Class'BallisticProV55.DTX3KnifeLimb'
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.Knife.KnifeSlash',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	Chaos=-1.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
end object
// Reference: FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3000000
	AmmoPerFire=0
	BurstFireRateFactor=1.0000000
	PreFireAnim="BigBack1"
	FireAnim="BigStab1"
	FireEffectParams[0]=MeleeEffectParams'BallisticProV55.X3WeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.X3WeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=2048.0000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.X3WeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	ViewBindFactor=0.5000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BallisticProV55.X3WeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Silver"
	PlayerSpeedFactor=1.1500000
	InventorySize=1
	SightMoveSpeedFactor=0.5000000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.X3WeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.X3WeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireProjParams'
	AltFireParams[0]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicSecondaryFireParams'
	AltFireParams[1]=FireParams'BallisticProV55.X3WeaponParamsClassic.ClassicPrimaryFireProjParams'
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsClassic.X3_Silver'
begin object name="X3_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.X3WeaponParamsClassic.X3_Black'
begin object name="X3_Black" class=BCoreProV55.WeaponCamo
	Weight=15
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.X3Camos.KnifeA1Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
