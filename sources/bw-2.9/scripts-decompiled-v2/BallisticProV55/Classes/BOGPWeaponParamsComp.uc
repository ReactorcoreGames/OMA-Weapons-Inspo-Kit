class BOGPWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=3
		CockAnimRate=1.5000000
		ReloadAnimRate=1.2500000
		SightingTime=0.2000000
		SightPivot=(Pitch=300,Yaw=0,Roll=0)
		WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
		ViewOffset=(X=6.0000000,Y=4.5000000,Z=-4.5000000)
		DisplaceDurationMult=0.7500000
		MagAmmo=1
		RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaGrenadeFireParams'
		FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaFlareFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAltFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_Red'
	begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Red"
	end object
	Camos[0]=BORT_Red
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_White'
	begin object name="BORT_White" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="White"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=BORT_White
	// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_Flame'
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
// Reference: GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaGrenadeEffectParams'
begin object name="ArenaGrenadeEffectParams" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=125.0000000
	ProjectileClass=Class'BallisticProV55.BOGPGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4200.0000000
	MaxSpeed=4200.0000000
	Damage=100.0000000
	DamageRadius=1024.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=SoundGroup'BW_Core_WeaponSound.BOGP.BOGP_Fire',Volume=1.7500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	Chaos=0.7000000
	Inaccuracy=(X=64,Y=64)
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaGrenadeFireParams'
begin object name="ArenaGrenadeFireParams" class=BCoreProV55.FireParams
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaGrenadeEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaFlareEffectParams'
begin object name="ArenaFlareEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.BOGPFlare'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=5500.0000000
	MaxSpeed=7500.0000000
	AccelSpeed=100000.0000000
	Damage=50.0000000
	DamageRadius=64.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.BOGP.BOGP_FlareFire',Volume=2.0000000,Radius=255.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.7000000
	Inaccuracy=(X=64,Y=64)
	BotRefireRate=0.3000000
	WarnTargetPct=0.1000000
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaFlareFireParams'
begin object name="ArenaFlareFireParams" class=BCoreProV55.FireParams
	bCockAfterFire=true
	PreFireAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaFlareEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAltEffectParams'
begin object name="ArenaAltEffectParams" class=BCoreProV55.FireEffectParams
	EffectString="Switch grenade"
end object
// Reference: FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAltFireParams'
begin object name="ArenaAltFireParams" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	FireEffectParams[0]=FireEffectParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAltEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.BOGPWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	YawFactor=0.0000000
	XRandFactor=0.2500000
	YRandFactor=0.2500000
	ClimbTime=0.0750000
	DeclineTime=1.0000000
	DeclineDelay=0.2000000
	ViewBindFactor=0.6000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=378)
	JumpChaos=0.7500000
	ChaosDeclineTime=1.0000000
end object
// Reference: WeaponParams'BallisticProV55.BOGPWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=3
	CockAnimRate=1.5000000
	ReloadAnimRate=1.2500000
	SightingTime=0.2000000
	SightPivot=(Pitch=300,Yaw=0,Roll=0)
	WeaponBoneScales[0]=(BoneName="Scope",Slot=5,Scale=0.0000000)
	ViewOffset=(X=6.0000000,Y=4.5000000,Z=-4.5000000)
	DisplaceDurationMult=0.7500000
	MagAmmo=1
	RecoilParams[0]=RecoilParams'BallisticProV55.BOGPWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaGrenadeFireParams'
	FireParams[1]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaFlareFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.BOGPWeaponParamsComp.ArenaAltFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_Red'
begin object name="BORT_Red" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Red"
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_White'
begin object name="BORT_White" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="White"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.whiteBOGP_Main",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.BOGPWeaponParamsComp.BORT_Flame'
begin object name="BORT_Flame" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Radical"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.BOGPCamos.FGP",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
