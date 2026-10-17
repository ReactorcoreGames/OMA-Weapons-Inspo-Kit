class ONSMineLayerAltFire extends WeaponFire;

var ONSMineLayerTargetBeamEffect Beam;
var Vector EffectOffset;
var ONSMineLayer Gun;
var float TraceRange;
var bool bDoHit;

function PostBeginPlay()
{
	super.PostBeginPlay();
	Gun = ONSMineLayer(Weapon);
	//return;	
}

function DestroyEffects()
{
	// End:0x17
	if(Beam != none)
	{
		Beam.Destroy();
	}
	super.DestroyEffects();
	//return;	
}

simulated function bool AllowFire()
{
	return true;
	//return;	
}

function ModeHoldFire()
{
	// End:0x2D
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		SetTimer(0.5000000, true);
		bDoHit = true;
	}
	//return;	
}

function PlayFiring()
{
	//return;	
}

function StopFiring()
{
	// End:0x3F
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x33
		if(Beam != none)
		{
			Beam.Cancel();
		}
		SetTimer(0.0000000, false);
	}
	//return;	
}

function Timer()
{
	bDoHit = true;
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	local Vector HitLocation, HitNormal, StartTrace, EndTrace, X, Y,
		Z;

	local Rotator Aim;
	local Actor Other;
	local int i;

	// End:0x0D
	if(!bIsFiring)
	{
		return;
	}
	Weapon.GetViewAxes(X, Y, Z);
	StartTrace = (Instigator.Location + Instigator.EyePosition()) + (X * Instigator.CollisionRadius);
	Aim = AdjustAim(StartTrace, aimerror);
	X = Vector(Aim);
	EndTrace = StartTrace + (TraceRange * X);
	Other = Weapon.Trace(HitLocation, HitNormal, EndTrace, StartTrace, false);
	// End:0xF1
	if((Other == none) || Other == Instigator)
	{
		HitLocation = EndTrace;
	}
	// End:0x15D
	if(Beam == none)
	{
		// End:0x13F
		if(int(Weapon.Role) == int(ROLE_Authority))
		{
			Beam = Weapon.Spawn(Class'Onslaught.ONSMineLayerTargetBeamEffect',,, Instigator.Location);			
		}
		else
		{
			// End:0x15C
			foreach Weapon.DynamicActors(Class'Onslaught.ONSMineLayerTargetBeamEffect', Beam)
			{
				// End:0x15C
				break;				
			}			
		}
	}
	// End:0x17C
	if(Beam != none)
	{
		Beam.EndEffect = HitLocation;
	}
	// End:0x22F
	if(bDoHit)
	{
		i = 0;
		J0x18C:

		// End:0x22F [Loop If]
		if(i < Gun.Mines.Length)
		{
			// End:0x1DE
			if(Gun.Mines[i] == none)
			{
				Gun.Mines.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x225;
			}
			// End:0x225
			if(ONSMineProjectile(Gun.Mines[i]) != none)
			{
				ONSMineProjectile(Gun.Mines[i]).SetScurryTarget(HitLocation);
			}
			J0x225:

			i++;
			// [Loop Continue]
			goto J0x18C;
		}
	}
	//return;	
}

defaultproperties
{
	EffectOffset=(X=-5.0000000,Y=15.0000000,Z=20.0000000)
	TraceRange=10000.0000000
	bSplashDamage=true
	bRecommendSplashDamage=true
	bFireOnRelease=true
	FireRate=0.6000000
	AmmoClass=Class'Onslaught.ONSMineAmmo'
	BotRefireRate=1.0000000
	WarnTargetPct=0.1000000
}
