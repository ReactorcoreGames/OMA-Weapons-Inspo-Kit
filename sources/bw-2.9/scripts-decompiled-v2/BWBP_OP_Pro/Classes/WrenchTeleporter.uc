class WrenchTeleporter extends WrenchDeployable;

var WrenchTeleporterTrigger WTN;

function PostBeginPlay()
{
	local Teleporter t;
	local GameObjective GO;

	super.PostBeginPlay();
	// End:0x22
	foreach RadiusActors(Class'Engine.Teleporter', t, 256.0000000)
	{
		Destroy();		
		return;		
	}	
	// End:0x3F
	foreach RadiusActors(Class'UnrealGame.GameObjective', GO, 512.0000000)
	{
		Destroy();		
		return;		
	}	
	WTN = Spawn(Class'BWBP_OP_Pro.WrenchTeleporterTrigger', self,, Location + vect(0.0000000, 0.0000000, 64.0000000), Rotation + rot(0, 32768, 0));
	WTN.Team = Team;
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x8D
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && Level.GetLocalPlayerController().PlayerReplicationInfo.Team != none) && Level.GetLocalPlayerController().PlayerReplicationInfo.Team.TeamIndex != int(Team))
	{
		Skins[0] = FinalBlend'XEffectMat.Combos.InvisOverlayFB';
	}
	//return;	
}

function Initialize(byte deployable_index)
{
	local int myIndex;

	super.Initialize(deployable_index);
	// End:0x4F
	if((Master == none) || (Master.Teleporters[0] != none) && Master.Teleporters[1] != none)
	{
		GotoState('Destroying');
		return;
	}
	// End:0x6F
	if(Master.Teleporters[0] == none)
	{
		myIndex = 0;		
	}
	else
	{
		myIndex = 1;
	}
	Master.Teleporters[myIndex] = self;
	// End:0x107
	if(Master.Teleporters[myIndex ^ 1] != none)
	{
		Master.Teleporters[myIndex ^ 1].WTN.OtherWarp = WTN;
		WTN.OtherWarp = Master.Teleporters[myIndex ^ 1].WTN;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(WTN != none)
	{
		WTN.Destroy();
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
	if(WTN != none)
	{
		WTN.Destroy();
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
	TeamSkinIndex=0
	TeamSkins[0]=Texture'BWBP_OP_Tex.Wrench.Teleport_RED'
	TeamSkins[1]=Texture'BWBP_OP_Tex.Wrench.Teleport_BLU'
	Health=125
	StaticMesh=StaticMesh'X_SG_Special.Mech.sg_Mech_smallteleport'
	DrawScale=0.5000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	CollisionHeight=1.0000000
}
