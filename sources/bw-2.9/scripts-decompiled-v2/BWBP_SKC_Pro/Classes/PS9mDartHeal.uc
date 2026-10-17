class PS9mDartHeal extends Actor
	placeable;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int HealValue;
var() int TickCount;
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
	SetTimer(1.0000000, true);
	SetBase(Victim);
	//return;	
}

event Timer()
{
	// End:0x11
	if(TickCount == -2)
	{
		return;
	}
	// End:0xED
	if(((Victim != none) && int(Level.NetMode) != int(NM_Client)) && TickCount > 0)
	{
		// End:0x79
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		// End:0xBF
		if(BallisticPawn(Victim) != none)
		{
			BallisticPawn(Victim).GiveAttributedHealth(HealValue, int(Pawn(Victim).HealthMax), Instigator);			
		}
		else
		{
			Pawn(Victim).GiveHealth(HealValue, int(Pawn(Victim).HealthMax));
		}
	}
	--TickCount;
	// End:0x102
	if(TickCount <= 0)
	{
		Destroy();
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
	// End:0x84
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && TickCount <= 0)
	{
		Destroy();
	}
	// End:0x98
	if(TickCount == -2)
	{
		return;		
	}
	else
	{
		// End:0xC8
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
	DamageType=Class'BWBP_SKC_Pro.DT_PS9mMedDart'
	HealValue=8
	TickCount=5
	bHidden=true
	bOnlyRelevantToOwner=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
	bHardAttach=true
}
