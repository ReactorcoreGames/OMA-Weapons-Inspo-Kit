class RX22AWeaponParamsRealistic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticParams'
	begin object name="RealisticParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.7750000
		PlayerJumpFactor=0.8000000
		InventorySize=7
		SightMoveSpeedFactor=0.5000000
		SightingTime=0.4000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		WeaponName="RX220-A Incinerator"
		MagAmmo=200
		RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticAimParams'
		FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticSecondaryFireParams'
	end object
	Layouts[0]=RealisticParams
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsRealistic.RX22A_Green'
	begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=RX22A_Green
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsRealistic.RX22A_Tan'
	begin object name="RX22A_Tan" class=BCoreProV55.WeaponCamo
		Weight=10
		CamoName="Tan"
		WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RX22ACamos.RX22ESkin",Index=1,pIndex=0,AIndex=0)
		Index=1
	end object
	Camos[1]=RX22A_Tan
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticPrimaryEffectParams'
begin object name="RealisticPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	Damage=20.0000000
	HeadMult=3.3000000
	LimbMult=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Ignite',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	Chaos=0.0500000
	Inaccuracy=(X=96,Y=96)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticPrimaryFireParams'
begin object name="RealisticPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0700000
	BurstFireRateFactor=1.0000000
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticPrimaryEffectParams'
end object
// Reference: FireEffectParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticSecondaryEffectParams'
begin object name="RealisticSecondaryEffectParams" class=BCoreProV55.FireEffectParams
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FuelLoop',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
	EffectString="Spray gas"
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticSecondaryFireParams'
begin object name="RealisticSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=FireEffectParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticRecoilParams'
begin object name="RealisticRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.6000000)))
	PitchFactor=0.5000000
	YawFactor=0.5000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=512.0000000
	DeclineTime=0.4000000
	ViewBindFactor=0.2500000
	ADSViewBindFactor=0.2500000
	CrouchMultiplier=0.8750000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticAimParams'
begin object name="RealisticAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=680,Max=1792)
	CrouchMultiplier=0.8750000
	ADSMultiplier=0.8750000
	SprintOffset=(Pitch=-2048,Yaw=-4096,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticParams'
begin object name="RealisticParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.7750000
	PlayerJumpFactor=0.8000000
	InventorySize=7
	SightMoveSpeedFactor=0.5000000
	SightingTime=0.4000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	WeaponName="RX220-A Incinerator"
	MagAmmo=200
	RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticAimParams'
	FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsRealistic.RealisticSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsRealistic.RX22A_Green'
begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsRealistic.RX22A_Tan'
begin object name="RX22A_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RX22ACamos.RX22ESkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
