class RaygunPlagueTrigger extends Trigger;

var byte Team;
var Pawn PawnOwner;
var Controller InstigatorController;
var RaygunPlagueEffect PlagueEffect;

function PostBeginPlay()
{
	super.PostBeginPlay();
	PawnOwner = Pawn(Owner);
	// End:0x26
	if(PawnOwner == none)
	{
		Destroy();
		return;
	}
	Team = byte(PawnOwner.GetTeamNum());
	SetBase(PawnOwner);
	SetTimer(0.3500000, false);
	//return;	
}

function Timer()
{
	local xPawn P;

	// End:0x90
	foreach CollidingActors(Class'XGame.xPawn', P, CollisionRadius, Location)
	{
		// End:0x84
		if(((P == Owner) || P.Health < 1) || (Level.TimeSeconds - P.SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
		{
			continue;			
		}
		TryPlague(P);		
	}	
	//return;	
}

function TryPlague(xPawn P)
{
	local byte InTeam;
	local RaygunPlagueEffect RPE;

	// End:0x59
	if(P.Controller != none)
	{
		InTeam = byte(P.Controller.GetTeamNum());
		// End:0x59
		if((int(InTeam) != 255) && int(InTeam) != int(Team))
		{
			return;
		}
	}
	// End:0x76
	foreach P.BasedActors(Class'BWBP_OP_Pro.RaygunPlagueEffect', RPE)
	{
		// End:0x76
		break;		
	}	
	// End:0x111
	if(RPE == none)
	{
		RPE = Spawn(Class'BWBP_OP_Pro.RaygunPlagueEffect', P,, P.Location);
		RPE.Initialize(P);
		RPE.Duration = PlagueEffect.Duration;
		// End:0x111
		if(Instigator != none)
		{
			RPE.Instigator = Instigator;
			RPE.InstigatorController = Instigator.Controller;
		}
	}
	//return;	
}

function Touch(Actor Other)
{
	// End:0x3E
	if(((Other == Owner) || xPawn(Other) == none) || xPawn(Other).Health < 1)
	{
		return;
	}
	TryPlague(xPawn(Other));
	//return;	
}

defaultproperties
{
	bHardAttach=true
	CollisionRadius=150.0000000
	CollisionHeight=80.0000000
}
