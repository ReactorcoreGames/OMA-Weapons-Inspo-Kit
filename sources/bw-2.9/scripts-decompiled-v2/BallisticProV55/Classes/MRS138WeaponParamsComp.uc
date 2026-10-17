class MRS138WeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="10ga Shot"
		InventorySize=5
		CockAnimRate=1.2000000
		ReloadAnimRate=1.5000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams_Frag'
	begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga HE Slug"
		InventorySize=5
		ReloadAnimRate=1.5000000
		SightingTime=0.3000000
		SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
		GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Frag'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams_Frag
	// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams_Gas'
	begin object name="ArenaParams_Gas" class=BCoreProV55.WeaponParams
		Weight=10
		LayoutName="10ga Teargas Slug"
		InventorySize=5
		ReloadAnimRate=1.5000000
		SightingTime=0.3000000
		SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Gas'
		AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[2]=ArenaParams_Gas
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Silver'
	begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Silver"
	end object
	Camos[0]=MRS_Silver
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Arctic'
	begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MRS_Arctic
	// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Gold'
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
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.9000000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="TazerStart"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.0500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2000000),(InVal=0.4000000,OutVal=0.4500000),(InVal=0.7500000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=8192.0000000
	ClimbTime=0.0750000
	DeclineTime=0.7500000
	DeclineDelay=0.5000000
	ViewBindFactor=0.6000000
	HipMultiplier=1.2500000
end object
// Reference: AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=0,Max=0)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=300
end object
// Reference: ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DecayRange=(Min=500.0000000,Max=2000.0000000)
	RangeAtten=0.2000000
	Damage=16
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
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireEffectParams[0]=ShotgunEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams_Frag'
begin object name="ArenaPrimaryEffectParams_Frag" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=100.0000000
	ProjectileClass=Class'BallisticProV55.MRS138Slug_HE'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=450000.0000000
	AccelSpeed=300000.0000000
	Damage=100.0000000
	DamageRadius=256.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2472.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Frag'
begin object name="ArenaPrimaryFireParams_Frag" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	TargetState="Projectile"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams_Frag'
end object
// Reference: GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams_Gas'
begin object name="ArenaPrimaryEffectParams_Gas" class=BCoreProV55.GrenadeEffectParams
	ImpactDamage=50.0000000
	ProjectileClass=Class'BallisticProV55.MRS138Slug_Gas'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=9000.0000000
	MaxSpeed=450000.0000000
	AccelSpeed=300000.0000000
	Damage=50.0000000
	DamageRadius=128.0000000
	MomentumTransfer=60000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRS38.RSS-FireSlug',Volume=1.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2472.0000000
	PushbackForce=100.0000000
	Chaos=1.0000000
	BotRefireRate=0.5000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Gas'
begin object name="ArenaPrimaryFireParams_Gas" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	TargetState="Projectile"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.8500000
	FireEffectParams[0]=GrenadeEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryEffectParams_Gas'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRS138TazerProj'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=12800.0000000
	MaxSpeed=12800.0000000
	Damage=8.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	BotRefireRate=0.3000000
	WarnTargetPct=0.5000000
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="10ga Shot"
	InventorySize=5
	CockAnimRate=1.2000000
	ReloadAnimRate=1.5000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams_Frag'
begin object name="ArenaParams_Frag" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga HE Slug"
	InventorySize=5
	ReloadAnimRate=1.5000000
	SightingTime=0.3000000
	SightOffset=(X=-5.0000000,Y=0.2000000,Z=3.0000000)
	GunAugments[0]=(GunAugmentClass=Class'BallisticProV55.Augment_Reflex',BoneName="CombatShotgun",Scale=0.0500000,AugmentOffset=(X=65.0000000,Y=0.0000000,Z=20.0000000),AugmentRot=(Pitch=0,Yaw=32768,Roll=0))
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Frag'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BallisticProV55.MRS138WeaponParamsComp.ArenaParams_Gas'
begin object name="ArenaParams_Gas" class=BCoreProV55.WeaponParams
	Weight=10
	LayoutName="10ga Teargas Slug"
	InventorySize=5
	ReloadAnimRate=1.5000000
	SightingTime=0.3000000
	SightOffset=(X=-6.0000000,Y=0.0000000,Z=2.1000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BallisticProV55.MRS138WeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRS138WeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaPrimaryFireParams_Gas'
	AltFireParams[0]=FireParams'BallisticProV55.MRS138WeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Silver'
begin object name="MRS_Silver" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Silver"
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Arctic'
begin object name="MRS_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSArctic-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BallisticProV55.MRS138WeaponParamsComp.MRS_Gold'
begin object name="MRS_Gold" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRS138Camos.MRSGold-Main-Shine",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
