class CX85WeaponParamsTactical extends BallisticWeaponParams;

static simulated function SetAttachmentParams(BallisticAttachment BWA)
{
	BWA.ModeInfos[0].TracerChance = 1.0000000;
	BWA.ModeInfos[0].TracerMix = 5;
	//return;	
}

defaultproperties
{
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalParams'
	begin object name="TacticalParams" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="5.56mm Mod"
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=1
		ScopeScale=0.7000000
		MaxZoom=4.0000000
		MagAmmo=50
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams'
	end object
	Layouts[0]=TacticalParams
	// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalParams_Seeker'
	begin object name="TacticalParams_Seeker" class=BCoreProV55.WeaponParams
		Weight=30
		LayoutName="Seeker Spikes"
		PlayerSpeedFactor=0.9500000
		SightMoveSpeedFactor=0.3500000
		SightingTime=0.4500000
		ZoomType=1
		ScopeScale=0.7000000
		MaxZoom=4.0000000
		MagAmmo=20
		RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalRecoilParams'
		AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalAimParams'
		FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams_Seeker'
		AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams_Smart'
	end object
	Layouts[1]=TacticalParams_Seeker
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryEffectParams'
begin object name="TacticalSecondaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=5
	DamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Dart'
	FireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	Recoil=256.0000000
	Chaos=0.5000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
end object
// Reference: RecoilParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalRecoilParams'
begin object name="TacticalRecoilParams" class=BCoreProV55.RecoilParams
	XCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1000000,OutVal=0.0000000),(InVal=0.2500000,OutVal=0.1200000),(InVal=0.4000000,OutVal=0.1800000),(InVal=0.8000000,OutVal=0.2200000),(InVal=1.0000000,OutVal=0.2500000)))
	YCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1500000,OutVal=0.1200000),(InVal=0.3000000,OutVal=0.3500000),(InVal=0.5000000,OutVal=0.4450000),(InVal=0.7500000,OutVal=0.7500000),(InVal=1.0000000,OutVal=1.0000000)))
	XRandFactor=0.0500000
	YRandFactor=0.0500000
	ClimbTime=0.0400000
	DeclineTime=0.7500000
	DeclineDelay=0.1400000
	ViewBindFactor=0.3000000
	HipMultiplier=1.2500000
	MaxMoveMultiplier=2.5000000
	CrouchMultiplier=0.8500000
end object
// Reference: AimParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalAimParams'
begin object name="TacticalAimParams" class=BCoreProV55.AimParams
	AimSpread=(Min=384,Max=1280)
	ADSMultiplier=0.7000000
	SprintOffset=(Pitch=-2048,Yaw=-2048,Roll=0)
	JumpOffset=(Pitch=-1024,Yaw=-1024,Roll=0)
	ChaosSpeedThreshold=300
end object
// Reference: InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryEffectParams'
begin object name="TacticalPrimaryEffectParams" class=BCoreProV55.InstantEffectParams
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DecayRange=(Min=1838.0000000,Max=5250.0000000)
	RangeAtten=0.6700000
	Damage=34
	HeadMult=3.2500000
	DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
	PenetrationEnergy=32.0000000
	PenetrateForce=150
	bPenetrate=true
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.5000000,bAtten=false,bNoOverride=false)
	Recoil=120.0000000
	Chaos=0.0800000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams'
begin object name="TacticalPrimaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.0900000
	FireEndAnim="None"
	FireAnimRate=1.2000000
	AimedFireAnim="Fire"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryEffectParams'
end object
// Reference: ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryEffectParams_Seeker'
begin object name="TacticalPrimaryEffectParams_Seeker" class=BCoreProV55.ProjectileEffectParams
	ProjectileClass=Class'BWBP_OP_Pro.CX85Flechette'
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	Speed=10000.0000000
	MaxSpeed=10000.0000000
	AccelSpeed=1000.0000000
	Damage=50.0000000
	DamageRadius=8.0000000
	MomentumTransfer=20000.0000000
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=1.3500000
	FireSound=(Sound=SoundGroup'BWBP_OP_Sounds.CX85.CX85-Fire',Volume=1.5000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	Recoil=512.0000000
	Chaos=0.2000000
	WarnTargetPct=0.2000000
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams_Seeker'
begin object name="TacticalPrimaryFireParams_Seeker" class=BCoreProV55.FireParams
	FireInterval=0.2500000
	TargetState="SeekerFlechette"
	FireEndAnim="None"
	AimedFireAnim="SightFire"
	FireEffectParams[0]=ProjectileEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryEffectParams_Seeker'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams'
begin object name="TacticalSecondaryFireParams" class=BCoreProV55.FireParams
	FireInterval=0.3500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams_Smart'
begin object name="TacticalSecondaryFireParams_Smart" class=BCoreProV55.FireParams
	FireInterval=0.7500000
	AmmoPerFire=0
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireEffectParams[0]=InstantEffectParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryEffectParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalParams'
begin object name="TacticalParams" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="5.56mm Mod"
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=1
	ScopeScale=0.7000000
	MaxZoom=4.0000000
	MagAmmo=50
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams'
end object
// Reference: WeaponParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalParams_Seeker'
begin object name="TacticalParams_Seeker" class=BCoreProV55.WeaponParams
	Weight=30
	LayoutName="Seeker Spikes"
	PlayerSpeedFactor=0.9500000
	SightMoveSpeedFactor=0.3500000
	SightingTime=0.4500000
	ZoomType=1
	ScopeScale=0.7000000
	MaxZoom=4.0000000
	MagAmmo=20
	RecoilParams[0]=RecoilParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalRecoilParams'
	AimParams[0]=AimParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalAimParams'
	FireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalPrimaryFireParams_Seeker'
	AltFireParams[0]=FireParams'BWBP_OP_Pro.CX85WeaponParamsTactical.TacticalSecondaryFireParams_Smart'
end object
