class RX22AWeaponParamsClassic extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicParams'
	begin object name="ClassicParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Fuel Sprayer"
		PlayerSpeedFactor=0.8000000
		PlayerJumpFactor=0.7000000
		InventorySize=11
		SightMoveSpeedFactor=0.5000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		ViewOffset=(X=2.0000000,Y=4.0000000,Z=-1.2000000)
		MagAmmo=150
		RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicAimParams'
		FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicSecondaryFireParams'
	end object
	Layouts[0]=ClassicParams
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsClassic.RX22A_Green'
	begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=RX22A_Green
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsClassic.RX22A_Tan'
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
// Reference: ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicPrimaryEffectParams'
begin object name="ClassicPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	Damage=4.0000000
	HeadMult=3.3000000
	LimbMult=0.6000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Ignite',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=64.0000000
	Chaos=0.0500000
	Inaccuracy=(X=32,Y=32)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicPrimaryFireParams'
begin object name="ClassicPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	BurstFireRateFactor=1.0000000
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicSecondaryEffectParams'
begin object name="ClassicSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FuelLoop',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	Chaos=-1.0000000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
	EffectString="Spray gas"
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicSecondaryFireParams'
begin object name="ClassicSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	BurstFireRateFactor=1.0000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicRecoilParams'
begin object name="ClassicRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.6000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	MaxRecoil=2048.0000000
	DeclineTime=1.0000000
	ViewBindFactor=0.2500000
	CrouchMultiplier=0.7000000
	bViewDecline=true
end object
// Reference: AimParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicAimParams'
begin object name="ClassicAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=16,Max=1536)
	CrouchMultiplier=0.7000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-500,Yaw=-1024,Roll=0)
	JumpOffset=(Pitch=1000,Yaw=-3000,Roll=0)
	ViewBindFactor=0.1500000
	JumpChaos=0.5000000
	FallingChaos=0.5000000
	SprintChaos=0.5000000
	ChaosDeclineTime=2.0000000
	ChaosSpeedThreshold=600
end object
// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicParams'
begin object name="ClassicParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Fuel Sprayer"
	PlayerSpeedFactor=0.8000000
	PlayerJumpFactor=0.7000000
	InventorySize=11
	SightMoveSpeedFactor=0.5000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	ViewOffset=(X=2.0000000,Y=4.0000000,Z=-1.2000000)
	MagAmmo=150
	RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicAimParams'
	FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsClassic.ClassicSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsClassic.RX22A_Green'
begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsClassic.RX22A_Tan'
begin object name="RX22A_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RX22ACamos.RX22ESkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
