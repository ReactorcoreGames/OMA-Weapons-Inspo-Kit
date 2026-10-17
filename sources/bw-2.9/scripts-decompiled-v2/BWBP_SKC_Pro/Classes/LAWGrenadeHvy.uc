class LAWGrenadeHvy extends BallisticGrenade;

var Actor StuckActor;
var bool bPlaced;

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x1E
	if((Other == Instigator) && !bCanHitOwner)
	{
		return;
	}
	// End:0x2B
	if(Base != none)
	{
		return;
	}
	// End:0xA5
	if(Pawn(Other) != none)
	{
		StuckActor = Other;
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);		
	}
	else
	{
		super(BallisticProjectile).ProcessTouch(Other, HitLocation);
	}
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
	local Projectile proj;
	local float boneDist;

	// End:0x0B
	if(bPlaced)
	{
		return;
	}
	bPlaced = true;
	// End:0x74
	if(ImpactManager != none)
	{
		// End:0x55
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x89
	if(int(Role) != int(ROLE_Authority))
	{
		Destroy();
		return;
	}
	// End:0x14C
	if(StuckActor == none)
	{
		Start = HitLocation - (Normal(Velocity) * 16.0000000);
		End = Start + (Normal(Velocity) * float(128));
		LastTrace = Trace(LastHitLoc, LastHitNorm, End, Start, false);
		// End:0x11C
		if((LastTrace == none) || !LastTrace.bWorldGeometry && Mover(LastTrace) == none)
		{
			return;
		}
		// End:0x129
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
	// End:0x1EC
	if(StuckActor == none)
	{
		proj = Spawn(Class'BWBP_SKC_Pro.LAWMineHvy',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		proj.bHardAttach = true;
		proj.SetBase(LastTrace);		
	}
	else
	{
		proj = Spawn(Class'BWBP_SKC_Pro.LAWRocket',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		proj.SetPhysics(0);
		proj.bHardAttach = true;
		// End:0x298
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
	ImpactDamageType=Class'BWBP_SKC_Pro.DTLAW'
	WeaponClass=Class'BWBP_SKC_Pro.LAWLauncher'
	ImpactManager=Class'BallisticProV55.IM_M46GrenadeImpact'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=2500.0000000
	MyDamageType=none
	StaticMesh=StaticMesh'BWBP_SKC_Static.LAW.LAWRocket'
	DrawScale=0.4500000
}
