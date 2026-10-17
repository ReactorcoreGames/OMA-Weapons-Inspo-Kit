class CoachBleed extends Actor
	placeable;

const BleedInterval = 1.5f;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var() float BleedTime;
var() float MaxBleedTime;
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
	SetTimer(1.5000000, true);
	SetBase(Victim);
	//return;	
}

event Timer()
{
	// End:0x13
	if(BleedTime == float(-1))
	{
		return;
	}
	BleedTime -= 1.5000000;
	// End:0x31
	if(BleedTime < 1.5000000)
	{
		Destroy();
	}
	// End:0xD4
	if(((Victim != none) && int(Level.NetMode) != int(NM_Client)) && BleedTime >= 1.5000000)
	{
		// End:0x9D
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Damage), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

function AddTime(float TimeToAdd)
{
	BleedTime = float(Min(int(MaxBleedTime), int(BleedTime + TimeToAdd)));
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
	// End:0x88
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && BleedTime <= 1.5000000)
	{
		Destroy();
	}
	// End:0x9E
	if(BleedTime == float(-1))
	{
		return;		
	}
	else
	{
		// End:0xCE
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
	DamageType=Class'BWBP_SKC_Pro.DT_CoachBleed'
	Damage=3
	BleedTime=4.0000000
	MaxBleedTime=15.0000000
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	bHardAttach=true
}
