class SPASShotgunWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaParams_Slug'
	begin object name="ArenaParams_Slug" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Slug"
		LayoutTags="slug"
		InventorySize=4
		ReloadAnimRate=1.5000000
		SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
		ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams_Slug'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams_Scope'
		bNoaltfire=true
	end object
	Layouts[0]=ArenaParams_Slug
	// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="12 Gauge Shot"
		InventorySize=4
		ReloadAnimRate=1.5000000
		SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
		ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
		MagAmmo=5
		RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[1]=ArenaParams
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Gray'
	begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Gray"
	end object
	Camos[0]=SP_Gray
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Cobalt'
	begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Cobalt"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=SP_Cobalt
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Bricks'
	begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Bricks"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=SP_Bricks
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Hazard'
	begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
		Weight=3
		CamoName="Hazard"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=SP_Hazard
	// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Gold'
	begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=SP_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.1300000),(InVal=0.5500000,OutVal=0.2300000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.5000000
	DeclineDelay=0.7500000
	ViewBindFactor=0.4000000
	CrouchMultiplier=0.8000000
end object
// Reference: AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ADSMultiplier=0.3500000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=1.0000000
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=550
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=8
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=7500.0000000,Max=7500.0000000)
	RangeAtten=0.3000000
	Damage=9
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.3500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-FireOld',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=650.0000000
	Chaos=0.3000000
	Inaccuracy=(X=190,Y=270)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.4500000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryEffectParams_Slug'
begin object name="ArenaPrimaryEffectParams_Slug" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=6000.0000000,Max=6000.0000000)
	DecayRange=(Min=750.0000000,Max=3000.0000000)
	RangeAtten=0.1500000
	Damage=100
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.6500000
	FireSound=(Sound=SoundGroup'BWBP_JCF_Sounds.SPAS.SPAS-HFire',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=2048.0000000
	Chaos=0.3000000
	Inaccuracy=(X=32,Y=32)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams_Slug'
begin object name="ArenaPrimaryFireParams_Slug" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryEffectParams_Slug'
end object
// Reference: ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=14
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=4000.0000000,Max=6000.0000000)
	RangeAtten=0.3000000
	Damage=9
	HeadMult=2.5000000
	DamageType=Class'BWBP_JCF_Pro.DTSPASShotgun'
	DamageTypeHead=Class'BWBP_JCF_Pro.DTSPASShotgunHead'
	DamageTypeArm=Class'BWBP_JCF_Pro.DTSPASShotgun'
	PenetrateForce=100
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=0.1000000
	FireSound=(Sound=Sound'BWBP_JCF_Sounds.SPAS.SPAS-FireDouble',Volume=1.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=900.0000000
	Chaos=0.5000000
	Inaccuracy=(X=190,Y=540)
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8000000
	AmmoPerFire=2
	FireAnim="FireCock"
	FireEndAnim="None"
	AimedFireAnim="SightFireCock"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryEffectParams_Scope'
begin object name="ArenaSecondaryEffectParams_Scope" class=BCoreProV55.FireEffectParams
	BotRefireRate=0.3000000
end object
// Reference: FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams_Scope'
begin object name="ArenaSecondaryFireParams_Scope" class=BCoreProV55.FireParams
	FireInterval=0.2000000
	AmmoPerFire=0
	TargetState="Scope"
	FireEffectParams[0]=FireEffectParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryEffectParams_Scope'
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaParams_Slug'
begin object name="ArenaParams_Slug" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Slug"
	LayoutTags="slug"
	InventorySize=4
	ReloadAnimRate=1.5000000
	SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
	ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams_Slug'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams_Scope'
	bNoaltfire=true
end object
// Reference: WeaponParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="12 Gauge Shot"
	InventorySize=4
	ReloadAnimRate=1.5000000
	SightOffset=(X=7.0000000,Y=-0.0500000,Z=10.2000000)
	ViewOffset=(X=-1.0000000,Y=4.0000000,Z=-10.0000000)
	MagAmmo=5
	RecoilParams[0]=RecoilParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Gray'
begin object name="SP_Gray" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Gray"
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Cobalt'
begin object name="SP_Cobalt" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Cobalt"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S4",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Bricks'
begin object name="SP_Bricks" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Bricks"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S2",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Hazard'
begin object name="SP_Hazard" class=BCoreProV55.WeaponCamo
	Weight=3
	CamoName="Hazard"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S5",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_JCF_Pro.SPASShotgunWeaponParamsArena.SP_Gold'
begin object name="SP_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.SPASCamos.SPASShort_Main_S3",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
