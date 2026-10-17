class PD97PrimaryFire extends BallisticProShotgunFire;

var() Vector SpawnOffset;
var Projectile proj;

simulated function PlayFiring()
{
	// End:0x2B
	if(PD97Bloodhound(BW).bNeedRotate)
	{
		PD97Bloodhound(BW).CycleDrum();
	}
	// End:0x87
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		AimedFireAnim = 'OpenSightFire';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	PD97Bloodhound(BW).ShellFired();
	//return;	
}

simulated state Projectile
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ProjectileEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = ProjectileEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
		//return;		
	}

	function float MaxRange()
	{
		// End:0x155
		if(ProjectileClass.default.MaxSpeed > ProjectileClass.default.Speed)
		{
			// End:0xFE
			if((Class<BallisticProjectile>(ProjectileClass) != none) && Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed > float(0))
			{
				// End:0xA7
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * float(2))) * float(2));					
				}
				else
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * ProjectileClass.default.LifeSpan)) * ProjectileClass.default.LifeSpan);
				}				
			}
			else
			{
				// End:0x12C
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return ProjectileClass.default.MaxSpeed * float(2);					
				}
				else
				{
					return (ProjectileClass.default.MaxSpeed * ProjectileClass.default.LifeSpan) * 0.7500000;
				}
			}			
		}
		else
		{
			// End:0x183
			if(ProjectileClass.default.LifeSpan <= float(0))
			{
				return ProjectileClass.default.Speed * float(2);				
			}
			else
			{
				return ProjectileClass.default.Speed * ProjectileClass.default.LifeSpan;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector Start, X, Y, Z, End, HitLocation,
			HitNormal, StartTrace;

		local Rotator Aim;
		local Actor Other;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * SpawnOffset.X);
		Other = Weapon.Trace(HitLocation, HitNormal, End, Start, false);
		// End:0x13A
		if(Other != none)
		{
			StartTrace = HitLocation;
		}
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x196
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		// End:0xBE
		if(proj != none)
		{
			proj.Instigator = Instigator;
			// End:0x69
			if(ProjectileClass == Class'BWBP_OP_Pro.PD97Dart')
			{
				PD97Dart(proj).Master = PD97Bloodhound(BW);
			}
			// End:0xBE
			if(ProjectileClass == Class'BWBP_OP_Pro.PD97Rocket')
			{
				PD97Rocket(proj).Master = PD97Bloodhound(BW);
				PD97Rocket(proj).LastLoc = PD97Bloodhound(BW).GetRocketTarget();
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=15.0000000,Z=-20.0000000)
	TraceCount=9
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	Damage=4.0000000
	AimedFireAnim="SightFire"
	FireRecoil=256.0000000
	FireChaos=0.1500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=0.5000000,Radius=128.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	PreFireAnim="None"
	FireAnimRate=1.1000000
	FireForce="AssaultRifleAltFire"
	FireRate=0.4000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.PD97Dart'
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
}
