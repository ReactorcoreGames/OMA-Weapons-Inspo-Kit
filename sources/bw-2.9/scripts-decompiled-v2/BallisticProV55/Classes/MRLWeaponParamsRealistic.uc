class MRLWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7500000
		PlayerJumpFactor=0.8000000
		InventorySize=9
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4500000
		ViewPivot=(Pitch=1024,Yaw=-512,Roll=1024)
		WeaponName="JL21 'PeaceMaker' Rocket Launcher"
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsRealistic.MRL_Military'
	begin object name="MRL_Military" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="OD Green"
	end object
	Camos[0]=MRL_Military
	// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsRealistic.MRL_Rad'
	begin object name="MRL_Rad" class=BCoreProV55.WeaponCamo
		Weight=5
		CamoName="Radical"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL_MainRed_S1",Index=1,pIndex=0,AIndex=0)
		WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL-MagRed",Index=2,pIndex=1,AIndex=1)
		Index=1
	end object
	Camos[1]=MRL_Rad
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRLRocket'
	SpawnOffset=(X=28.0000000,Y=10.0000000,Z=-8.0000000)
	Speed=800.0000000
	MaxSpeed=5000.0000000
	AccelSpeed=8000.0000000
	Damage=100.0000000
	DamageRadius=120.0000000
	MomentumTransfer=20000.0000000
	HeadMult=1.0000000
	LimbMult=1.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRLFlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-0.1000000
	Inaccuracy=(X=64,Y=64)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1250000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRLDrunkRocketSecondary'
	SpawnOffset=(X=28.0000000,Y=8.0000000,Z=-6.0000000)
	MaxSpeed=3500.0000000
	AccelSpeed=5000.0000000
	LimbMult=0.5000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=0.0200000
	Inaccuracy=(X=512,Y=512)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.5000000
	YRandFactor=0.5000000
	MaxRecoil=512.0000000
	ViewBindFactor=0.5000000
	ADSViewBindFactor=0.5000000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=1024,Max=3584)
	AimAdjustTime=0.6000000
	OffsetAdjustTime=0.6500000
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-5000,Yaw=-7000,Roll=0)
	JumpOffset=(Pitch=-7000,Yaw=0,Roll=0)
	ViewBindFactor=0.1000000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	AimDamageThreshold=375
	ChaosDeclineTime=1.6500000
	ChaosSpeedThreshold=400
end object
// Reference: WeaponParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7500000
	PlayerJumpFactor=0.8000000
	InventorySize=9
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4500000
	ViewPivot=(Pitch=1024,Yaw=-512,Roll=1024)
	WeaponName="JL21 'PeaceMaker' Rocket Launcher"
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsRealistic.MRL_Military'
begin object name="MRL_Military" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="OD Green"
end object
// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsRealistic.MRL_Rad'
begin object name="MRL_Rad" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Radical"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL_MainRed_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL-MagRed",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
