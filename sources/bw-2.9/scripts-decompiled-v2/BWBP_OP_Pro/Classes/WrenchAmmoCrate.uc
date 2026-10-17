class WrenchAmmoCrate extends WrenchDeployable;

var WrenchDispenserTrigger dt;

function PostBeginPlay()
{
	super.PostBeginPlay();
	dt = Spawn(Class'BWBP_OP_Pro.WrenchDispenserTrigger', self,, Location + vect(0.0000000, 0.0000000, 16.0000000));
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(dt != none)
	{
		dt.Destroy();
	}
	super.Destroyed();
	//return;	
}

state Destroying
{Begin:

	bHidden = true;
	bTearOff = true;
	bAlwaysRelevant = true;
	SetCollision(false, false, false);
	// End:0x35
	if(dt != none)
	{
		dt.Destroy();
	}
	// End:0x93
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		// End:0x72
		if(!bWarpOut)
		{
			Spawn(EffectWhenDestroyed, Owner,, Location);			
		}
		else
		{
			Spawn(Class'BWBP_OP_Pro.WrenchWarpEndEmitter', Owner,, Location);
			PlaySound(Sound'BWBP_OP_Sounds.Wrench.Teleport',, 1.0000000);
		}
	}
	Sleep(0.5000000);
	Destroy();
	stop;		
}

defaultproperties
{
	StaticMesh=StaticMesh'BWBP_OP_Static.Wrench.AmmoCrate'
	CollisionHeight=32.0000000
}
