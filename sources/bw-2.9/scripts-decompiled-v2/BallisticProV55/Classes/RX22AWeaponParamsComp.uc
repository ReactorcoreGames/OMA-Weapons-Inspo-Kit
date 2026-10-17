class RX22AWeaponParamsComp extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsComp.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.8500000
		PlayerJumpFactor=0.8500000
		InventorySize=8
		ReloadAnimRate=1.2500000
		SightMoveSpeedFactor=0.7000000
		SightPivot=(Pitch=768,Yaw=0,Roll=0)
		MagAmmo=40
		RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsComp.ArenaRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsComp.ArenaAimParams'
		FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsComp.RX22A_Green'
	begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="Green"
	end object
	Camos[0]=RX22A_Green
	// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsComp.RX22A_Tan'
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
// Reference: ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsComp.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	Damage=20.0000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-Ignite',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Chaos=0.0500000
	BotRefireRate=0.9900000
	WarnTargetPct=0.4000000
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsComp.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsComp.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	FireSound=(Sound=Sound'BW_Core_WeaponSound.RX22A.RX22A-FuelLoop',Volume=0.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=32.0000000
	WarnTargetPct=0.5000000
	EffectString="Spray fuel"
end object
// Reference: FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.RX22AWeaponParamsComp.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.RX22AWeaponParamsComp.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0100000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.3000000,OutVal=-0.3000000),(InVal=0.6000000,OutVal=-0.2500000),(InVal=0.7000000,OutVal=0.2500000),(InVal=1.0000000,OutVal=-0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.1800000),(InVal=0.2000000,OutVal=-0.2000000),(InVal=0.3000000,OutVal=0.3000000),(InVal=0.6000000,OutVal=-0.1500000),(InVal=0.7000000,OutVal=0.3000000),(InVal=1.0000000,OutVal=0.6000000)))
	PitchFactor=0.8000000
	YawFactor=0.8000000
	XRandFactor=0.2000000
	YRandFactor=0.2000000
	DeclineTime=0.7500000
end object
// Reference: AimParams'BallisticProV55.RX22AWeaponParamsComp.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=256,Max=1024)
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.RX22AWeaponParamsComp.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.8500000
	PlayerJumpFactor=0.8500000
	InventorySize=8
	ReloadAnimRate=1.2500000
	SightMoveSpeedFactor=0.7000000
	SightPivot=(Pitch=768,Yaw=0,Roll=0)
	MagAmmo=40
	RecoilParams[0]=RecoilParams'BallisticProV55.RX22AWeaponParamsComp.ArenaRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.RX22AWeaponParamsComp.ArenaAimParams'
	FireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.RX22AWeaponParamsComp.ArenaSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsComp.RX22A_Green'
begin object name="RX22A_Green" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="Green"
end object
// Reference: WeaponCamo'BallisticProV55.RX22AWeaponParamsComp.RX22A_Tan'
begin object name="RX22A_Tan" class=BCoreProV55.WeaponCamo
	Weight=10
	CamoName="Tan"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.RX22ACamos.RX22ESkin",Index=1,pIndex=0,AIndex=0)
	Index=1
end object
