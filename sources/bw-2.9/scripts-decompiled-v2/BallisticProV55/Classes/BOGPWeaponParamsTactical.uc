class BOGPWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		InventorySize=5
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.2000000
		SightPivot=(Pitch=300,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=1
		bDualBlocked=true
		RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalGrenadeFireParams'
		FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalFlareFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAltFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_Red'
	begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=BORT_Red
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_White'
	begin object name="BORT_White" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=BORT_White
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_Flame'
	begin object name="BORT_Flame" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Radical"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.FGP",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=BORT_Flame
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalGrenadeEffectParams'
begin object name="TacticalGrenadeEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=50.0000000
	bOverrideArming=true
	DetonateDelay=3.0000000
	ProjectileClass=Class'BallisticProV55.BOGPGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=2700.0000000
	Damage=120.0000000
	DamageRadius=768.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.BOGP.BOGP_Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	Chaos=0.7000000
	Inaccuracy=(X=128,Y=128)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalGrenadeFireParams'
begin object name="TacticalGrenadeFireParams" class=BCoreProV55.FireParams
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalGrenadeEffectParams'
end object
// Reference: GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalFlareEffectParams'
begin object name="TacticalFlareEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=40.0000000
	ProjectileClass=Class'BallisticProV55.BOGPFlare'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=40.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareFire',Volume=2.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.7000000
	Inaccuracy=(X=128,Y=128)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalFlareFireParams'
begin object name="TacticalFlareFireParams" class=BCoreProV55.FireParams
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalFlareEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAltEffectParams'
begin object name="TacticalAltEffectParams" class=BCoreProV55.FireEffectParams
	EffectString="Switch grenade"
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAltFireParams'
begin object name="TacticalAltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAltEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	ClimbTime=0.0750000
	DeclineTime=1.0000000
	DeclineDelay=0.2000000
	EscapeMultiplier=1.1000000
	ViewBindFactor=0.1500000
	ADSViewBindFactor=0.5000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=1.5000000
end object
// Reference: AimParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=768)
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-1024,Roll=0)
	ADSViewBindFactor=0.0000000
	JumpChaos=0.7500000
	ChaosDeclineTime=1.0000000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	InventorySize=5
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.2000000
	SightPivot=(Pitch=300,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=1
	bDualBlocked=true
	RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalGrenadeFireParams'
	FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalFlareFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsTactical.TacticalAltFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_Red'
begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_White'
begin object name="BORT_White" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsTactical.BORT_Flame'
begin object name="BORT_Flame" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Radical"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.FGP",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
