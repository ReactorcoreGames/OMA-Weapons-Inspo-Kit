class MRS138WeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Shot"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams_Frag'
	begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga HE Slug"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[1]=TacticalParams_Frag
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams_Gas'
	begin object name="TacticalParams_Gas" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga Teargas Slug"
		SightMoveSpeedFactor=0.6000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Gas'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[2]=TacticalParams_Gas
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Silver'
	begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=MRS_Silver
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Arctic'
	begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MRS_Arctic
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Gold'
	begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MRS_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="TazerStart"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.7500000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0750000
	DeclineTime=0.7500000
	DeclineDelay=0.5000000
	EscapeMultiplier=1.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.7000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.0000000
end object
// Reference: AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=768)
	AimAdjustTime=0.6000000
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=788.0000000,Max=2363.0000000)
	RangeAtten=0.2000000
	Damage=15
	HeadMult=1.7500000
	LimbMult=0.8500000
	DamageType=Class'BallisticProV55.DTMRS138Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRS138ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRS138Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1536.0000000
	Chaos=0.4000000
	Inaccuracy=(X=256,Y=256)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
begin object name="TacticalPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=70.0000000
	bCombinedSplashImpact=true
	ProjectileClass=Class'BallisticProV55.MRS138Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=20000.0000000
	MaxSpeed=270000.0000000
	AccelSpeed=270000.0000000
	Damage=75.0000000
	DamageRadius=256.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
begin object name="TacticalPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	TargetState="Projectile"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams_Frag'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams_Gas'
begin object name="TacticalPrimaryEffectParams_Gas" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=25.0000000
	bCombinedSplashImpact=true
	ProjectileClass=Class'BallisticProV55.MRS138Slug_Gas'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2700.0000000
	MaxSpeed=230000.0000000
	AccelSpeed=230000.0000000
	Damage=35.0000000
	DamageRadius=256.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-FireSlug',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=3072.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Gas'
begin object name="TacticalPrimaryFireParams_Gas" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	TargetState="Projectile"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryEffectParams_Gas'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRS138TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=12800.0000000
	MaxSpeed=12800.0000000
	Damage=20.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Shot"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams_Frag'
begin object name="TacticalParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga HE Slug"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalParams_Gas'
begin object name="TacticalParams_Gas" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga Teargas Slug"
	SightMoveSpeedFactor=0.6000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalPrimaryFireParams_Gas'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Silver'
begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Arctic'
begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsTactical.MRS_Gold'
begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
