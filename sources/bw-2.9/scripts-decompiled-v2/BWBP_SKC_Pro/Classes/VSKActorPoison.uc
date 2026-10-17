class VSKActorPoison extends BallisticEmitter;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var() float BurnTime;
var Controller InstigatorController;

function Reset()
{
	Destroy();
	//return;	
}

simulated function Initialize(Actor V)
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
	//return;	
}

simulated event Timer()
{
	// End:0x13
	if(BurnTime == float(-1))
	{
		return;
	}
	BurnTime -= 0.5000000;
	// End:0x3E
	if(BurnTime <= float(2))
	{
		BurnTime = -1.0000000;
		Kill();
	}
	// End:0xDF
	if(((Victim != none) && int(Level.NetMode) != int(NM_Client)) && BurnTime > float(1))
	{
		// End:0xA8
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Damage), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
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
	// End:0x58
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && BurnTime <= float(1))
	{
		Destroy();
	}
	// End:0x6E
	if(BurnTime == float(-1))
	{
		return;		
	}
	else
	{
		// End:0xAC
		if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
		{
			SetBase(none);
			Kill();
			BurnTime = -1.0000000;
		}
	}
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranqPsn'
	Damage=5
	BurnTime=3.5000000
	AutoDestroy=true
	bFullVolume=true
	bHardAttach=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}
