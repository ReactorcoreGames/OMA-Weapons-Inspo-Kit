class FM13WeaponParamsArena extends BallisticWeaponParams;

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaParams_Flame'
	begin object name="ArenaParams_Flame" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Dragon's Breath"
		SightOffset=(X=10.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
		MagAmmo=6
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams_Flame'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams'
	end object
	Layouts[0]=ArenaParams_Flame
	// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaParams'
	begin object name="ArenaParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="8 Gauge Shot"
		LayoutTags="8Gauge"
		SightOffset=(X=10.0000000,Y=-0.1000000,Z=27.0000000)
		SightPivot=(Pitch=128,Yaw=0,Roll=0)
		WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
		WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
		ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
		MagAmmo=4
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams_Cluster'
	end object
	Layouts[1]=ArenaParams
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: RecoilParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaRecoilParams'
begin object name="ArenaRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.2000000,OutVal=0.1000000),(InVal=0.3500000,OutVal=0.1300000),(InVal=0.5500000,OutVal=0.2300000),(InVal=0.8000000,OutVal=0.3500000),(InVal=1.0000000,OutVal=0.4500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1500000),(InVal=0.4000000,OutVal=0.5000000),(InVal=0.6000000,OutVal=0.7000000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.1000000
	YRandFactor=0.1000000
	MaxRecoil=1892.0000000
	DeclineTime=0.5000000
	DeclineDelay=0.7500000
	ViewBindFactor=0.2500000
end object
// Reference: AimParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaAimParams'
begin object name="ArenaAimParams" class=BCoreProV55.AimParams
	ADSMultiplier=0.5000000
	SprintOffset=(Pitch=-1000,Yaw=-2048,Roll=0)
	ChaosDeclineTime=0.7500000
	ChaosSpeedThreshold=550
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryEffectParams_Flame'
begin object name="ArenaPrimaryEffectParams_Flame" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_ShotgunFlame'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=3072.0000000,Max=3072.0000000)
	RangeAtten=0.1500000
	Damage=10
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	MuzzleFlashClass=Class'BWBP_OP_Pro.FM13FlashEmitter'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=768.0000000
	Chaos=0.3000000
	Inaccuracy=(X=200,Y=200)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams_Flame'
begin object name="ArenaPrimaryFireParams_Flame" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	TargetState="FireFromImpact"
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryEffectParams_Flame'
end object
// Reference: ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryEffectParams'
begin object name="ArenaPrimaryEffectParams" class=BCoreProV55.ShotgunEffectParams
	TraceCount=10
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	TraceRange=(Min=3048.0000000,Max=3048.0000000)
	DecayRange=(Min=1000.0000000,Max=3000.0000000)
	RangeAtten=0.2000000
	Damage=20
	DamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FM13ShotgunHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	MuzzleFlashClass=Class'BallisticProV55.MRS138FlashEmitter_C'
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-FireStrong',Volume=3.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1800.0000000
	Chaos=0.4000000
	Inaccuracy=(X=512,Y=512)
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams'
begin object name="ArenaPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.8500000
	FireAnim="FireCombined"
	FireEndAnim="None"
	FireAnimRate=0.9000000
	AimedFireAnim="FireCombinedSight"
	FireEffectParams[0]=ShotgunEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryEffectParams'
begin object name="ArenaSecondaryEffectParams" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FM13Grenade'
	Speed=3500.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams'
begin object name="ArenaSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryEffectParams_Cluster'
begin object name="ArenaSecondaryEffectParams_Cluster" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.FM13FlakGrenade'
	Speed=3500.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	FlashScaleFactor=2.0000000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=1280.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
end object
// Reference: FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams_Cluster'
begin object name="ArenaSecondaryFireParams_Cluster" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	FireEndAnim="None"
	FireAnimRate=1.1000000
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryEffectParams_Cluster'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaParams_Flame'
begin object name="ArenaParams_Flame" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Dragon's Breath"
	SightOffset=(X=10.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
	MagAmmo=6
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams_Flame'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaParams'
begin object name="ArenaParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="8 Gauge Shot"
	LayoutTags="8Gauge"
	SightOffset=(X=10.0000000,Y=-0.1000000,Z=27.0000000)
	SightPivot=(Pitch=128,Yaw=0,Roll=0)
	WeaponMaterialSwaps[0]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellHeavy',MaterialName="",Index=3,pIndex=0,AIndex=-1)
	WeaponMaterialSwaps[1]=(Material=Texture'BWBP_OP_Tex.FM13.FM13-ShellFlak',MaterialName="",Index=4,pIndex=0,AIndex=-1)
	ViewOffset=(X=-9.0000000,Y=5.0000000,Z=-25.0000000)
	MagAmmo=4
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.FM13WeaponParamsArena.ArenaSecondaryFireParams_Cluster'
end object
