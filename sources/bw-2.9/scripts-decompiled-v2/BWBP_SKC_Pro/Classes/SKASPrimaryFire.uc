class SKASPrimaryFire extends BallisticProShotgunFire;

var() Vector SpawnOffset;
var Projectile proj;
var() Sound SuperFireSound;
var() Sound ClassicFireSound;
var() Sound UltraFireSound;
var() Sound XR4FireSound;
var bool bRequireSpool;
var Rotator OldLookDir;
var Rotator TurnVelocity;
var SKASShotgun MainGun;
var float NextTVUpdateTime;
var float OldFireRate;

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x31
	if(int(newmode) == 1)
	{
		KickForce = 800;
		XInaccuracy = 35.0000000;
		YInaccuracy = 35.0000000;		
	}
	else
	{
		RangeAtten = default.RangeAtten;
		KickForce = default.KickForce;
		bCockAfterFire = false;
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
	}
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

simulated state SpinUpFire
{
	event ModeTick(float dt)
	{
		local Rotator BasePlayerView;

		BasePlayerView = BW.GetBasePlayerView();
		// End:0xBE
		if(Instigator.IsLocallyControlled())
		{
			TurnVelocity = (BasePlayerView - OldLookDir) / dt;
			OldLookDir = BasePlayerView;
			// End:0xBE
			if((int(Level.NetMode) == int(NM_Client)) && Level.TimeSeconds > NextTVUpdateTime)
			{
				MainGun.SetServerTurnVelocity(TurnVelocity.Yaw, TurnVelocity.Pitch);
				NextTVUpdateTime = Level.TimeSeconds + 0.1500000;
			}
		}
		OldFireRate = FireRate;
		// End:0xED
		if(MainGun.BarrelSpeed <= float(0))
		{
			FireRate = 0.6600000;			
		}
		else
		{
			FireRate = default.FireRate / (float(1) + (0.2500000 * float(int(BW.bBerserk))));
			FireRate = FMin(0.6600000, FireRate / MainGun.BarrelSpeed);
			NextFireTime += (FireRate - OldFireRate);
		}
		super(BallisticFire).ModeTick(dt);
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x2E
		if(bRequireSpool && MainGun.BarrelSpeed < MainGun.DesiredSpeed)
		{
			return;
		}
		super(BallisticProShotgunFire).ModeDoFire();
		//return;		
	}

	simulated function bool AllowFire()
	{
		// End:0x19
		if(MainGun.GetSecCharge() > float(0))
		{
			return false;
		}
		return super(BallisticFire).AllowFire();
		//return;		
	}
	stop;	
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
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

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
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x139
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
		proj.Instigator = Instigator;
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	SuperFireSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Power'
	ClassicFireSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Classic'
	UltraFireSound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Ultra2'
	XR4FireSound=Sound'BWBP_SKC_Sounds.XR4.XR4-Fire'
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTSKASShotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTSKASShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTSKASShotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MRS138Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bCockAfterEmpty=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FireRecoil=450.0000000
	FirePushbackForce=180.0000000
	FireChaos=0.3000000
	XInaccuracy=310.0000000
	YInaccuracy=310.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.SKAS.SKAS-Single',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireRate=0.3000000
	AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.4000000
}
