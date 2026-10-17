class X4KnifePoisoner extends Actor
	placeable;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var() float PoisonRate;
var() float PoisonTime;
var Controller InstigatorController;

function Reset()
{
	Destroy();
	//return;	
}

function Initialize(Actor V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	SetTimer(PoisonRate, true);
	SetBase(Victim);
	//return;	
}

event Timer()
{
	// End:0x13
	if(PoisonTime == float(-1))
	{
		return;
	}
	PoisonTime -= PoisonRate;
	// End:0x2F
	if(PoisonTime <= float(1))
	{
		Destroy();
	}
	// End:0xE5
	if(((Victim != none) && int(Level.NetMode) != int(NM_Client)) && PoisonTime > float(1))
	{
		// End:0x99
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Max(1, int(float(Damage) * (PoisonTime / default.PoisonTime)))), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

simulated event Tick(float dt)
{
	super.Tick(dt);
	// End:0x2D
	if((Victim == none) || Victim.bDeleteMe)
	{
		Destroy();
	}
	// End:0x5B
	if((Pawn(Victim) != none) && Pawn(Victim).Health <= 0)
	{
		Destroy();
	}
	// End:0x86
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && PoisonTime <= float(1))
	{
		Destroy();
	}
	// End:0x9C
	if(PoisonTime == float(-1))
	{
		return;		
	}
	else
	{
		// End:0xCC
		if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
		{
			SetBase(none);
			Destroy();
		}
	}
	//return;	
}

defaultproperties
{
	DamageType=Class'BallisticProV55.DTX4KnifePoison'
	Damage=4
	PoisonRate=0.2500000
	PoisonTime=5.0000000
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	bHardAttach=true
}
