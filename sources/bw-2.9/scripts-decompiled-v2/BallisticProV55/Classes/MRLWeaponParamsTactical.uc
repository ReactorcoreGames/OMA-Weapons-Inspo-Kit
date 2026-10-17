class MRLWeaponParamsTactical extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BallisticProV55.MRLWeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		PlayerSpeedFactor=0.9000000
		InventorySize=8
		SightMoveSpeedFactor=0.4500000
		SightingTime=0.5500000
		ViewPivot=(Pitch=1024,Yaw=-512,Roll=1024)
		DisplaceDurationMult=1.4000000
		MagAmmo=36
		RecoilParams[0]=RecoilParams'BallisticProV55.MRLWeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BallisticProV55.MRLWeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsTactical.MRL_Military'
	begin object name="MRL_Military" class=BCoreProV55.WeaponCamo
		Weight=30
		CamoName="OD Green"
	end object
	Camos[0]=MRL_Military
	// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsTactical.MRL_Rad'
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
// Reference: ProjectileEffectParams'BallisticProV55.MRLWeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRLRocket'
	SpawnOffset=(X=28.0000000,Y=10.0000000,Z=-8.0000000)
	Speed=4500.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=10000.0000000
	Damage=75.0000000
	DamageRadius=378.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRLFlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=2.0000000
	Chaos=0.1700000
	Inaccuracy=(X=128,Y=128)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1350000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRLWeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BallisticProV55.MRLWeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BallisticProV55.MRLRocketSecondary'
	SpawnOffset=(X=28.0000000,Y=8.0000000,Z=-6.0000000)
	Speed=4500.0000000
	MaxSpeed=25000.0000000
	AccelSpeed=10000.0000000
	Damage=75.0000000
	DamageRadius=378.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BallisticProV55.MRLFlashEmitter'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.MRL.MRL-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1.0000000
	Chaos=0.1700000
	Inaccuracy=(X=768,Y=768)
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.1000000
	FireEndAnim="None"
	FireEffectParams[0]=ProjectileEffectParams'BallisticProV55.MRLWeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: RecoilParams'BallisticProV55.MRLWeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
end object
// Reference: AimParams'BallisticProV55.MRLWeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=128,Max=2048)
	OffsetAdjustTime=0.6000000
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-3072,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-6000,Yaw=-1500,Roll=0)
	ADSViewBindFactor=0.0000000
	ChaosDeclineTime=0.3200000
	ChaosSpeedThreshold=300
end object
// Reference: WeaponParams'BallisticProV55.MRLWeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	PlayerSpeedFactor=0.9000000
	InventorySize=8
	SightMoveSpeedFactor=0.4500000
	SightingTime=0.5500000
	ViewPivot=(Pitch=1024,Yaw=-512,Roll=1024)
	DisplaceDurationMult=1.4000000
	MagAmmo=36
	RecoilParams[0]=RecoilParams'BallisticProV55.MRLWeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BallisticProV55.MRLWeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BallisticProV55.MRLWeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsTactical.MRL_Military'
begin object name="MRL_Military" class=BCoreProV55.WeaponCamo
	Weight=30
	CamoName="OD Green"
end object
// Reference: WeaponCamo'BallisticProV55.MRLWeaponParamsTactical.MRL_Rad'
begin object name="MRL_Rad" class=BCoreProV55.WeaponCamo
	Weight=5
	CamoName="Radical"
	WeaponMaterialSwaps[0]=(Material=Shader'BW_Core_WeaponTex.Hands.Hands-Shiny',MaterialName="",Index=0,pIndex=-1,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL_MainRed_S1",Index=1,pIndex=0,AIndex=0)
	WeaponMaterialSwaps[2]=(Material=none,MaterialName="BWBP_Camos_Tex.MRLCamos.MRL-MagRed",Index=2,pIndex=1,AIndex=1)
	Index=1
end object
