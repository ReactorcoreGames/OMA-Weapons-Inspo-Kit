class PD97TrackerProj extends BallisticGrenade;

var PD97Bloodhound Master;
var bool bPlaced;
var Actor StuckActor;

function DoDamage(Actor Other, Vector HitLocation)
{
	// End:0x7C
	if(((Pawn(Other) != none) && Master != none) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime)
	{
		Master.GotTarget(Pawn(Other));
	}
	super(BallisticProjectile).DoDamage(Other, HitLocation);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x8F
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, GetMomentumVector(Normal(Velocity)), ImpactDamageType);
	}
	DoDamage(Other, HitLocation);
	//return;	
}

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
	// End:0x121
	if(Pawn(Other) != none)
	{
		StuckActor = Other;
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
		// End:0x11E
		if(((Pawn(Other) != none) && Master != none) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime)
		{
			Master.GotTarget(Pawn(Other));
		}		
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
	// End:0x21E
	if(StuckActor == none)
	{
		proj = Spawn(Class'BWBP_OP_Pro.PD97TrackerBeacon',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		PD97TrackerBeacon(proj).Master = Master;
		Master.ActiveBeacon = PD97TrackerBeacon(proj);
		proj.bHardAttach = true;
		proj.SetBase(LastTrace);		
	}
	else
	{
		proj = Spawn(Class'BWBP_OP_Pro.PD97TrackerBeacon',,, LastHitLoc, R);
		proj.Instigator = Instigator;
		PD97TrackerBeacon(proj).Master = Master;
		Master.ActiveBeacon = PD97TrackerBeacon(proj);
		proj.SetPhysics(0);
		proj.bHardAttach = true;
		// End:0x2FC
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
	ImpactDamage=15
	ImpactDamageType=Class'BWBP_OP_Pro.DTPD97Tazer'
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.MGLNadeTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTPD97Tazer'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=10240.0000000
	Damage=10.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTPD97Tazer'
	DrawType=0
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.BHTazerDart'
	LifeSpan=1.0000000
	DrawScale=1.5000000
	bIgnoreTerminalVelocity=true
}
