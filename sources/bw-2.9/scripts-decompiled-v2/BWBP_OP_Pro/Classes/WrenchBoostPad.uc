class WrenchBoostPad extends WrenchDeployable;

var WrenchBoostTrigger bt;

function PostBeginPlay()
{
	super.PostBeginPlay();
	bt = Spawn(Class'BWBP_OP_Pro.WrenchBoostTrigger', self,, Location + vect(0.0000000, 0.0000000, 16.0000000));
	bt.Team = Team;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(bt != none)
	{
		bt.Destroy();
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
	if(bt != none)
	{
		bt.Destroy();
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
	TeamSkinIndex=2
	TeamSkins[0]=Shader'BWBP_OP_Tex.Wrench.BoostShaderRed'
	TeamSkins[1]=Shader'BWBP_OP_Tex.Wrench.BoostShaderBlue'
	Health=100
	StaticMesh=StaticMesh'BWBP_OP_Static.Wrench.BoostPad'
	DrawScale3D=(X=0.7500000,Y=0.7500000,Z=0.5000000)
	CollisionHeight=4.0000000
}
