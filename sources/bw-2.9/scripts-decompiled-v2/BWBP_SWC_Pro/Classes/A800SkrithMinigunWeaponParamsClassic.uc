class A800SkrithMinigunWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Replacable Cells"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=12
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.7500000
		SightingTime=0.6000000
		SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		AllowedCamos[0]=0
		MagAmmo=80
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams_BigBattery'
	begin object name="ClassicParams_BigBattery" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Integrated Cells"
		LayoutTags="no_reload"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=12
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.7500000
		SightingTime=0.6000000
		SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		AllowedCamos[0]=0
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[1]=ClassicParams_BigBattery
	// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams_Elite'
	begin object name="ClassicParams_Elite" class=BCoreProV55.WeaponParams
		Weight=5
		LayoutName="Elite"
		LayoutTags="no_reload"
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.7500000
		InventorySize=12
		ReloadAnimRate=1.3000000
		SightMoveSpeedFactor=0.7500000
		SightingTime=0.6000000
		SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
		SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
		ZoomType=2
		ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
		ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
		AllowedCamos[0]=2
		MagAmmo=250
		WeaponModes[0]=(ModeName="Reflect Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		WeaponModes[2]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
		RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams_Elite'
		AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[2]=ClassicParams_Elite
	// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Blue'
	begin object name="A800_Blue" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Blue"
	end object
	Camos[0]=A800_Blue
	// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Pink'
	begin object name="A800_Pink" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Pink"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73AmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
		WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73SkinB',MaterialName="",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73.A73BladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=A800_Pink
	// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Orange'
	begin object name="A800_Orange" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Orange"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedFront",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedRear",Index=2,pIndex=1,AIndex=1)
		WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedCore",Index=3,pIndex=2,AIndex=2)
		WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin',MaterialName="",Index=4,pIndex=3,AIndex=3)
		Index=2
	end object
	Camos[2]=A800_Orange
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.5500000
	AmmoPerFire=10
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=0.1000000)))
	XRandFactor=0.4500000
	YRandFactor=0.4500000
	MaxRecoil=512.0000000
	DeclineTime=1.7000000
	DeclineDelay=0.4000000
	ViewBindFactor=0.2000000
	CrouchMultiplier=0.8000000
	bViewDecline=true
end object
// Reference: AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=2500)
	AimAdjustTime=1.0000000
	OffsetAdjustTime=0.6500000
	SprintOffset=(Pitch=-7000,Yaw=-3500,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.5000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=75
	ChaosDeclineTime=5.0000000
	ChaosSpeedThreshold=300
end object
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0750000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A73NewProjectile'
	SpawnOffset=(X=1.0000000,Y=5.0000000,Z=-5.0000000)
	Speed=3000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=60000.0000000
	Damage=27.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=SoundGroup'BWBP_SWC_Sounds.SkrithMinigun.A800-Fire',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=40.0000000
	PushbackForce=15.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: GrenadeEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryEffectParams_Elite'
begin object name="ClassicPrimaryEffectParams_Elite" class=BCoreProV55.GrenadeEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A800Projectile_Red'
	SpawnOffset=(X=1.0000000,Y=5.0000000,Z=-5.0000000)
	Speed=3000.0000000
	MaxSpeed=9000.0000000
	AccelSpeed=60000.0000000
	Damage=45.0000000
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitterB'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.A73E.A73E-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.1000000,bAtten=false,bNoOverride=false)
	Recoil=80.0000000
	PushbackForce=45.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams_Elite'
begin object name="ClassicPrimaryFireParams_Elite" class=BCoreProV55.FireParams
	FireInterval=0.1500000
	AmmoPerFire=2
	AimedFireAnim="SightFire"
	FireEffectParams[0]=GrenadeEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryEffectParams_Elite'
end object
// Reference: ProjectileEffectParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_SWC_Pro.A800StickyBombProjectile'
	SpawnOffset=(X=400.0000000,Y=7.0000000,Z=-9.0000000)
	Speed=1000.0000000
	MaxSpeed=2000.0000000
	AccelSpeed=8000.0000000
	Damage=150.0000000
	DamageRadius=230.0000000
	MomentumTransfer=50000.0000000
	RadiusFallOffType=0
	MuzzleFlashClass=Class'BallisticProV55.A73FlashEmitter'
	FlashScaleFactor=2.0000000
	FireSound=(Sound=Sound'BWBP_SWC_Sounds.SkrithMinigun.A800-AltFire2',Volume=1.0000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=200.0000000
	Chaos=0.5000000
	WarnTargetPct=0.2000000
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Replacable Cells"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=12
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.7500000
	SightingTime=0.6000000
	SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	AllowedCamos[0]=0
	MagAmmo=80
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams_BigBattery'
begin object name="ClassicParams_BigBattery" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Integrated Cells"
	LayoutTags="no_reload"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=12
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.7500000
	SightingTime=0.6000000
	SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	AllowedCamos[0]=0
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicParams_Elite'
begin object name="ClassicParams_Elite" class=BCoreProV55.WeaponParams
	Weight=5
	LayoutName="Elite"
	LayoutTags="no_reload"
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.7500000
	InventorySize=12
	ReloadAnimRate=1.3000000
	SightMoveSpeedFactor=0.7500000
	SightingTime=0.6000000
	SightOffset=(X=-30.0000000,Y=-25.0000000,Z=6.5000000)
	SightPivot=(Pitch=0,Yaw=0,Roll=-1900)
	ZoomType=2
	ViewOffset=(X=20.0000000,Y=20.0000000,Z=-15.0000000)
	ViewPivot=(Pitch=0,Yaw=0,Roll=-256)
	AllowedCamos[0]=2
	MagAmmo=250
	WeaponModes[0]=(ModeName="Reflect Fire",bUnavailable=false,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[1]=(ModeName="Rapid Fire",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	WeaponModes[2]=(ModeName="2400 RPM",bUnavailable=true,ModeID="WM_FullAuto",Value=0.0000000,RecoilParamsIndex=0,AimParamsIndex=0)
	RecoilParams[0]=RecoilParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicPrimaryFireParams_Elite'
	AltFireParams[0]=FireParams'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Blue'
begin object name="A800_Blue" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Blue"
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Pink'
begin object name="A800_Pink" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Pink"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73AmmoSkin',MaterialName="",Index=1,pIndex=3,AIndex=3)
	WeaponMaterialSwaps[2]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[3]=(Material=Shader'BW_Core_WeaponTex.A73PurpleLayout.A73Skin_SD',MaterialName="",Index=2,pIndex=4,AIndex=-1)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73PurpleLayout.A73SkinB',MaterialName="",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[5]=(Material=Shader'BW_Core_WeaponTex.A73.A73BladeShader',MaterialName="",Index=4,pIndex=1,AIndex=1)
	Index=1
end object
// Reference: WeaponCamo'BWBP_SWC_Pro.A800SkrithMinigunWeaponParamsClassic.A800_Orange'
begin object name="A800_Orange" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Orange"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedFront",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedRear",Index=2,pIndex=1,AIndex=1)
	WeaponMaterialSwaps[3]=(Material=none,MaterialName="BWBP_Camos_Tex.HyperblasterCamos.Hyper-RedCore",Index=3,pIndex=2,AIndex=2)
	WeaponMaterialSwaps[4]=(Material=Texture'BW_Core_WeaponTex.A73RedLayout.A73BAmmoSkin',MaterialName="",Index=4,pIndex=3,AIndex=3)
	Index=2
end object
