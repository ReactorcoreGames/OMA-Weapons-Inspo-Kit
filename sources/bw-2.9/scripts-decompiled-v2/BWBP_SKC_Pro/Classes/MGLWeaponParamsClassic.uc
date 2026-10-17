class MGLWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=512,Yaw=0,Roll=0)
		MagAmmo=6
		WeaponModes[0]=(ModeName="Timed",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Impact",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="4-Round Burst",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParams'
		FireParams[1]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParamsImpact'
		AltFireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Desert'
	begin object name="MGL_Desert" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Desert"
	end object
	Camos[0]=MGL_Desert
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Black'
	begin object name="MGL_Black" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Black"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=MGL_Black
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Jungle'
	begin object name="MGL_Jungle" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Jungle"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
		Index=2
	end object
	Camos[2]=MGL_Jungle
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Arctic'
	begin object name="MGL_Arctic" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Arctic"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainArctic",Index=1,pIndex=0,AIndex=0)
		Index=3
	end object
	Camos[3]=MGL_Arctic
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Purple'
	begin object name="MGL_Purple" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Purple"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainPurble",Index=1,pIndex=0,AIndex=0)
		Index=4
	end object
	Camos[4]=MGL_Purple
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Red'
	begin object name="MGL_Red" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Red"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainRed",Index=1,pIndex=0,AIndex=0)
		Index=5
	end object
	Camos[5]=MGL_Red
	// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Gold'
	begin object name="MGL_Gold" class=BCoreProV55.WeaponCamo
		Weight=1
		CamoName="Gold"
		WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainGoldShine",Index=1,pIndex=0,AIndex=0)
		Index=6
	end object
	Camos[6]=MGL_Gold
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenadeTimed'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	Damage=140.0000000
	DamageRadius=356.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryEffectParamsImpact'
begin object name="ClassicPrimaryEffectParamsImpact" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=2000.0000000
	Damage=140.0000000
	DamageRadius=356.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-FireAlt',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParamsImpact'
begin object name="ClassicPrimaryFireParamsImpact" class=BCoreProV55.FireParams
	FireInterval=0.7000000
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryEffectParamsImpact'
end object
// Reference: ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SKC_Pro.MGLGrenadeRemote'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=4000.0000000
	Damage=130.0000000
	DamageRadius=356.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MGL.MGL-Fire',Volume=9.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=-1.0000000
	SplashDamage=true
	RecommendSplashDamage=true
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	BurstFireRateFactor=1.0000000
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=-0.1000000),(InVal=0.3000000,OutVal=-0.2000000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.3000000,OutVal=0.5000000),(InVal=1.0000000,OutVal=1.0000000)))
	YawFactor=0.0000000
	XRandFactor=0.4000000
	YRandFactor=0.4000000
	DeclineTime=0.9000000
	ViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=2560)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.2500000
	JumpChaos=0.7000000
	FallingChaos=0.4000000
	SprintChaos=0.4000000
	ChaosDeclineTime=2.0000000
end object
// Reference: WeaponParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=512,Yaw=0,Roll=0)
	MagAmmo=6
	WeaponModes[0]=(ModeName="Timed",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Impact",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="4-Round Burst",bUnavailable=true,ModeID="",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParams'
	FireParams[1]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicPrimaryFireParamsImpact'
	AltFireParams[0]=FireParams'BWBP_SKC_Pro.MGLWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Desert'
begin object name="MGL_Desert" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Desert"
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Black'
begin object name="MGL_Black" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Black"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Jungle'
begin object name="MGL_Jungle" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Jungle"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainJungle",Index=1,pIndex=0,AIndex=0)
	Index=2
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Arctic'
begin object name="MGL_Arctic" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Arctic"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainArctic",Index=1,pIndex=0,AIndex=0)
	Index=3
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Purple'
begin object name="MGL_Purple" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Purple"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainPurble",Index=1,pIndex=0,AIndex=0)
	Index=4
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Red'
begin object name="MGL_Red" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Red"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainRed",Index=1,pIndex=0,AIndex=0)
	Index=5
end object
// Reference: WeaponCamo'BWBP_SKC_Pro.MGLWeaponParamsClassic.MGL_Gold'
begin object name="MGL_Gold" class=BCoreProV55.WeaponCamo
	Weight=1
	CamoName="Gold"
	WeaponMaterialSwaps[0]=(Material=none,MaterialName="BW_Core_WeaponTex.Hands.Hands-Shiny",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MGLCamos.MGL-MainGoldShine",Index=1,pIndex=0,AIndex=0)
	Index=6
end object
