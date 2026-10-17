class M75PrimaryFire extends BallisticRailgunFire;

const MAX_RAIL_POWER = 1.0f;

var float RailPower;

simulated state ClassicRail
{
	simulated event ModeDoFire()
	{
		Damage = default.Damage * RailPower;
		WallPenetrationForce = (default.WallPenetrationForce * 0.2000000) + ((default.WallPenetrationForce * 0.8000000) * RailPower);
		PenetrateForce = int(float(default.PenetrateForce) * RailPower);
		KickForce = int(float(default.KickForce) * RailPower);
		FireRecoil = default.FireRecoil * RailPower;
		super(BallisticRailgunFire).ModeDoFire();
		RailPower = 0.0000000;
		Weapon.ThirdPersonActor.SoundPitch = 32;
		Weapon.ThirdPersonActor.SoundVolume = 64;
		Weapon.ThirdPersonActor.SoundRadius = 128.0000000;
		//return;		
	}

	simulated function ModeTick(float dt)
	{
		super(BallisticFire).ModeTick(dt);
		Weapon.ThirdPersonActor.SoundPitch = byte(float(32) + (RailPower * float(12)));
		RailPower = FMin(1.0000000, RailPower + (0.1666000 * dt));
		//return;		
	}

	simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
	{
		M75Attachment(Weapon.ThirdPersonActor).RailPower = byte(float(255) * RailPower);
		super(BallisticRailgunFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		Weapon.HurtRadius(60.0000000 * RailPower, 48.0000000 + (48.0000000 * RailPower), DamageType, 25000.0000000, HitLocation);
		return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
		//return;		
	}

	function WallEnterEffect(Vector HitLocation, Vector HitNormal, Vector X, Actor Other, Material HitMat)
	{
		Weapon.HurtRadius(60.0000000 * RailPower, 48.0000000 + (48.0000000 * RailPower), DamageType, 25000.0000000, HitLocation);
		super(BallisticRailgunFire).WallEnterEffect(HitLocation, HitNormal, X, Other, HitMat);
		//return;		
	}

	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local InstantEffectParams effect_params;

		super(BallisticInstantFire).ApplyFireEffectParams(Params);
		effect_params = InstantEffectParams(Params);
		TraceRange = effect_params.TraceRange;
		MaxWaterTraceRange = effect_params.WaterTraceRange;
		RangeAtten = effect_params.RangeAtten;
		default.Damage = float(effect_params.Damage);
		HeadMult = effect_params.HeadMult;
		LimbMult = effect_params.LimbMult;
		DamageType = effect_params.DamageType;
		DamageTypeHead = effect_params.DamageTypeHead;
		DamageTypeArm = effect_params.DamageTypeArm;
		bUseRunningDamage = effect_params.UseRunningDamage;
		RunningSpeedThresh = effect_params.RunningSpeedThreshold;
		default.WallPenetrationForce = effect_params.PenetrationEnergy;
		default.PenetrateForce = effect_params.PenetrateForce;
		default.FireRecoil = effect_params.Recoil;
		bPenetrate = effect_params.bPenetrate;
		PDamageFactor = effect_params.PDamageFactor;
		WallPDamageFactor = effect_params.WallPDamageFactor;
		HookStopFactor = effect_params.HookStopFactor;
		HookPullForce = effect_params.HookPullForce;
		//return;		
	}
	stop;	
}

simulated state FullChargedRail
{
	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0x12C
		if(RailPower >= 1.0000000)
		{
			PenetrateForce = int(float(default.PenetrateForce) * RailPower);
			WallPenetrationForce = default.WallPenetrationForce * RailPower;
			KickForce = int(float(default.KickForce) * RailPower);
			FireRecoil = default.FireRecoil * RailPower;
			FirePushbackForce = default.FirePushbackForce * RailPower;
			BW.RcComponent.DeclineTime = BW.RcComponent.default.DeclineTime * RailPower;
			BW.RcComponent.DeclineDelay = BW.RcComponent.default.DeclineDelay * RailPower;
			BallisticFireSound.Volume = 0.6000000 + (RailPower * 0.8000000);
			BallisticFireSound.Radius = 280.0000000 + (RailPower * 350.0000000);
			super(BallisticRailgunFire).ModeDoFire();
		}
		RailPower = 0.0000000;
		Weapon.ThirdPersonActor.SoundPitch = byte(float(32) + (RailPower * float(12)));
		//return;		
	}

	simulated function ModeTick(float DeltaTime)
	{
		// End:0x43
		if(bIsFiring)
		{
			RailPower = FMin(1.0000000, RailPower + (1.0000000 * DeltaTime));
			// End:0x40
			if(RailPower >= 1.0000000)
			{
				bIsFiring = false;
			}			
		}
		else
		{
			// End:0x69
			if(RailPower > float(0))
			{
				RailPower = FMax(0.0000000, RailPower - DeltaTime);
			}
		}
		super(BallisticFire).ModeTick(DeltaTime);
		// End:0x115
		if((RailPower > float(0)) && RailPower <= 1.0000000)
		{
			Weapon.ThirdPersonActor.SoundPitch = byte(float(32) + (RailPower * float(12)));
			Weapon.ThirdPersonActor.SoundVolume = byte(float(64) + (float(190) * RailPower));
			Weapon.ThirdPersonActor.SoundRadius = 128.0000000 + (float(768) * RailPower);
		}
		//return;		
	}

	simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
	{
		M75Attachment(Weapon.ThirdPersonActor).RailPower = byte(float(255) * FMin(RailPower, 1.0000000));
		super(BallisticRailgunFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		//return;		
	}

	simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
	{
		BallisticWeapon(Weapon).TargetedHurtRadius(80.0000000 * FMin(RailPower, 1.0000000), 64.0000000 + (64.0000000 * FMin(RailPower, 1.0000000)), DamageType, 4000.0000000, HitLocation, Pawn(Other));
		return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
		//return;		
	}

	function WallEnterEffect(Vector HitLocation, Vector HitNormal, Vector X, Actor Other, Material HitMat)
	{
		BallisticWeapon(Weapon).TargetedHurtRadius(80.0000000 * FMin(RailPower, 1.0000000), 64.0000000 + (64.0000000 * FMin(RailPower, 1.0000000)), DamageType, 4000.0000000, HitLocation, Pawn(Other));
		super(BallisticRailgunFire).WallEnterEffect(HitLocation, HitNormal, X, Other, HitMat);
		//return;		
	}
	stop;	
}

simulated state ChargedRail
{
	simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
	{
		M75Attachment(Weapon.ThirdPersonActor).RailPower = 64;
		super(BallisticRailgunFire).SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
		//return;		
	}
	stop;	
}

defaultproperties
{
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	WallPenetrationForce=128.0000000
	DamageType=Class'BallisticProV55.DTM75Railgun'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM75Railgun'
	KickForce=10000
	PenetrateForce=500
	bPenetrate=true
	PDamageFactor=0.7000000
	BrassClass=Class'BallisticProV55.Brass_Railgun'
	BrassOffset=(X=-33.0000000,Y=-4.0000000,Z=-4.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FlashScaleFactor=0.7500000
	FireRecoil=768.0000000
	FirePushbackForce=350.0000000
	FireChaos=0.7500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=0.7500000,Radius=384.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="'"
	FireRate=1.5000000
	AmmoClass=Class'BallisticProV55.Ammo_20mmRailgun'
	ShakeRotMag=(X=400.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
	aimerror=800.0000000
}
