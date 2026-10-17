class CryoLanceWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		InventorySize=8
		ReloadAnimRate=1.1000000
		SightOffset=(X=6.0000000,Y=0.0000000,Z=28.0000000)
		SightPivot=(Pitch=850,Yaw=0,Roll=0)
		ViewOffset=(X=15.0000000,Y=12.0000000,Z=-18.0000000)
		ViewPivot=(Pitch=500,Yaw=0,Roll=0)
		MagAmmo=48
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	RangeAtten=0.3500000
	Damage=20
	DamageType=Class'BWBP_SKC_Pro.DT_MARSAssault'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_MARSAssaultHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_MARSAssault'
	PenetrateForce=150
	MuzzleFlashClass=Class'BWBP_SKC_Pro.MARSFlashEmitter'
	FlashScaleFactor=0.5000000
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.MARS.MARS-RapidFire',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=140.0000000
	Chaos=0.0200000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0800000
	PreFireAnim="FireStart"
	FireAnim="FireLoop"
	FireEffectParams[0]=InstantEffectParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.CryoLanceGrenade'
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	Speed=1500.0000000
	Damage=40.0000000
	DamageRadius=384.0000000
	MuzzleFlashClass=Class'BallisticProV55.M50M900FlashEmitter'
	FireSound=(Sound=Sound'BWBP_SKC_Sounds.LAW.LAW-Fire',Volume=1.2000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=1024.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.6000000
end object
// Reference: FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=1.2000000
	AmmoPerFire=8
	FireAnim="FireQuick"
	AimedFireAnim="FireQuick"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0800000),(InVal=0.2500000,OutVal=0.2000000),(InVal=0.3500000,OutVal=0.1500000),(InVal=0.4800000,OutVal=0.2000000),(InVal=0.6000000,OutVal=-0.0500000),(InVal=0.7500000,OutVal=0.0500000),(InVal=0.9000000,OutVal=0.1500000),(InVal=1.0000000,OutVal=0.3000000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.2500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.8000000),(InVal=0.8000000,OutVal=0.9000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	DeclineTime=0.5000000
	DeclineDelay=0.1400000
	ViewBindFactor=0.4000000
end object
// Reference: AimParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	SprintOffset=(Pitch=-3000,Yaw=-4096,Roll=0)
	ChaosDeclineTime=0.5000000
end object
// Reference: WeaponParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	InventorySize=8
	ReloadAnimRate=1.1000000
	SightOffset=(X=6.0000000,Y=0.0000000,Z=28.0000000)
	SightPivot=(Pitch=850,Yaw=0,Roll=0)
	ViewOffset=(X=15.0000000,Y=12.0000000,Z=-18.0000000)
	ViewPivot=(Pitch=500,Yaw=0,Roll=0)
	MagAmmo=48
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.CryoLanceWeaponParamsArena.ArenaSecondaryFireParams'
end object
