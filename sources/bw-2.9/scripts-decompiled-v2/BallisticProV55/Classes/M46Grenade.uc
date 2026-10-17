class M46Grenade extends BallisticGrenade;

var Actor StuckActor;
var bool bPlaced;
var M46AssaultRifle Rifle;

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	local Vector HitNormal, VNorm;

	// End:0x96
	if(Pawn(Other) != none)
	{
		HitNormal = Normal(HitLocation - Other.Location);
		VNorm = (Velocity Dot HitNormal) * HitNormal;
		Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
		// End:0x87
		if(RandomSpin != float(0))
		{
			RandSpin(100000.0000000);
		}
		Speed = VSize(Velocity);
		return true;
	}
	return false;
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	// End:0x1B
	if(Pawn(Wall) != none)
	{
		StuckActor = Wall;
	}
	Explode(Location, HitNormal);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Actor LastTrace;
	local Vector Start, End, LastHitLoc, LastHitNorm;
	local Rotator R;
	local M46Mine proj;
	local float boneDist;

	// End:0x18
	if(bPlaced || Rifle == none)
	{
		return;
	}
	bPlaced = true;
	// End:0x81
	if(ImpactManager != none)
	{
		// End:0x62
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x96
	if(int(Role) < int(ROLE_Authority))
	{
		Destroy();
		return;
	}
	// End:0x159
	if(StuckActor == none)
	{
		Start = HitLocation - (Normal(Velocity) * 16.0000000);
		End = Start + (Normal(Velocity) * float(128));
		LastTrace = Trace(LastHitLoc, LastHitNorm, End, Start, false);
		// End:0x129
		if((LastTrace == none) || !LastTrace.bWorldGeometry && Mover(LastTrace) == none)
		{
			return;
		}
		// End:0x136
		if(LastTrace == none)
		{
			return;
		}
		LastHitLoc += (5.0000000 * LastHitNorm);
		LastHitNorm = -LastHitNorm;		
	}
	else
	{
		R = Rotation;
		LastHitLoc = Location;
		LastHitNorm = Normal(Velocity);
	}
	R = Rotator(LastHitNorm);
	R.Roll = Rand(65536);
	// End:0x25B
	if(StuckActor == none)
	{
		proj = Spawn(Class'BallisticProV55.M46ProximityMine', Rifle,, LastHitLoc, R);
		// End:0x258
		if(proj != none)
		{
			proj.Instigator = Instigator;
			proj.InstigatorController = InstigatorController;
			M46ProximityMine(proj).OriginalPlacer = Instigator;
			proj.bHardAttach = true;
			proj.SetBase(LastTrace);
			// End:0x258
			if(int(Rifle.CurrentWeaponMode) == 1)
			{
				proj.SetManualMode(true);
			}
		}		
	}
	else
	{
		proj = Spawn(Class'BallisticProV55.M46StickyMine',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		proj.SetPhysics(0);
		proj.bHardAttach = true;
		// End:0x307
		if((StuckActor != Instigator) && int(StuckActor.DrawType) == int(2))
		{
			StuckActor.AttachToBone(proj, StuckActor.GetClosestBone(LastHitLoc, Velocity, boneDist));			
		}
		else
		{
			proj.SetBase(StuckActor);
		}
	}
	proj.SetRotation(R);
	proj.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	Destroy();
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=0.0000000
	ImpactDamage=20
	ImpactDamageType=Class'BallisticProV55.DTM46GrenadeHit'
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	ImpactManager=Class'BallisticProV55.IM_M46GrenadeImpact'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=2700.0000000
	MyDamageType=none
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade'
	DrawScale=0.4500000
}
