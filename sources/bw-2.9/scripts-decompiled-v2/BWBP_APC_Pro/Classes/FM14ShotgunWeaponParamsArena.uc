class FM14ShotgunWeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		ReloadAnimRate=1.1000000
		SightOffset=(X=10.0000000,Y=-0.0300000,Z=27.5000000)
		ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: ShotgunEffectParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=1
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_BigBulletHMG'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	RangeAtten=0.1500000
	Damage=80
	DamageType=Class'BWBP_APC_Pro.DTFM14Shotgun'
	DamageTypeHead=Class'BWBP_APC_Pro.DTFM14ShotgunHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTFM14Shotgun'
	MuzzleFlashClass=Class'BWBP_APC_Pro.FM14FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.3000000
	Inaccuracy=(X=200,Y=200)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_APC_Pro.FM14FlakGrenade'
	Speed=3500.0000000
	Damage=15.0000000
	DamageRadius=256.0000000
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: RecoilParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.1300000),(InVal=0.5500000,OutVal=0.2300000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	DeclineTime=0.5000000
	DeclineDelay=0.7500000
	ViewBindFactor=0.2500000
end object
// Reference: AimParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=550
end object
// Reference: WeaponParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	ReloadAnimRate=1.1000000
	SightOffset=(X=10.0000000,Y=-0.0300000,Z=27.5000000)
	ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_APC_Pro.FM14ShotgunWeaponParamsArena.ArenaSecondaryFireParams'
end object
