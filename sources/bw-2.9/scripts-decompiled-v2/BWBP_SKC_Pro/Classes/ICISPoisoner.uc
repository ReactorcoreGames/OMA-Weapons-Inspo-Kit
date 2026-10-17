class ICISPoisoner extends BallisticEmitter;

var Pawn Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var() int Duration;
var Controller InstigatorController;
var float pwr;

function Reset()
{
	Destroy();
	//return;	
}

simulated function Initialize(Pawn V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	SetTimer(1.0000000, true);
	SetLocation(Victim.Location - (vect(0.0000000, 0.0000000, 1.0000000) * Victim.CollisionHeight));
	SetRotation(Victim.Rotation + rot(0, -16384, 0));
	SetBase(Victim);
	Victim.GiveHealth(int(float(5) * pwr), int(Instigator.HealthMax));
	//return;	
}

simulated event Timer()
{
	// End:0x64
	if((Victim != none) && int(Level.NetMode) != int(NM_Client))
	{
		// End:0x64
		if(Instigator.bProjTarget)
		{
			Victim.GiveHealth(int(float(5) * pwr), int(Instigator.HealthMax));
		}
	}
	--Duration;
	// End:0x85
	if(Duration == 0)
	{
		SetTimer(0.0000000, false);
		Kill();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x2D
	if((Victim == none) || Victim.bDeleteMe)
	{
		Destroy();
	}
	// End:0x56
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && Duration <= 1)
	{
		Destroy();
	}
	// End:0x63
	if(Duration == 0)
	{
		return;
	}
	// End:0x9D
	if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
	{
		SetBase(none);
		Kill();
		Duration = 0;
	}
	//return;	
}

defaultproperties
{
	Duration=8
	AutoDestroy=true
	bDynamicLight=true
	bFullVolume=true
	bHardAttach=true
	SoundVolume=255
	bNotOnDedServer=false
}
