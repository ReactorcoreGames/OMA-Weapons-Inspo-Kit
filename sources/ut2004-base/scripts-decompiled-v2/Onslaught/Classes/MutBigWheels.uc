class MutBigWheels extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
	local BigWheelsRules G;

	super(Actor).PostBeginPlay();
	G = Spawn(Class'Onslaught.BigWheelsRules');
	G.BigWheelsMutator = self;
	// End:0x61
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = G;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(G);
	}
	//return;	
}

function float GetWheelsScaleFor(PlayerReplicationInfo P)
{
	local float NewScale;

	// End:0x11
	if(P == none)
	{
		return 1.0000000;
	}
	// End:0x4C
	if(Abs(P.Deaths) < float(1))
	{
		NewScale = 0.4000000 * (P.Score + float(1));		
	}
	else
	{
		NewScale = 0.4000000 * ((P.Score + float(1)) / (P.Deaths + float(1)));
	}
	return FClamp(NewScale, 1.0000000, 3.0000000);
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local Vehicle V;

	V = Vehicle(Other);
	// End:0x54
	if((V != none) && V.Driver != none)
	{
		V.SetWheelsScale(GetWheelsScaleFor(V.PlayerReplicationInfo));
	}
	return true;
	//return;	
}

function DriverEnteredVehicle(Vehicle V, Pawn P)
{
	V.SetWheelsScale(GetWheelsScaleFor(V.PlayerReplicationInfo));
	// End:0x47
	if(NextMutator != none)
	{
		NextMutator.DriverEnteredVehicle(V, P);
	}
	//return;	
}

function DriverLeftVehicle(Vehicle V, Pawn P)
{
	V.SetWheelsScale(1.0000000);
	// End:0x38
	if(NextMutator != none)
	{
		NextMutator.DriverLeftVehicle(V, P);
	}
	//return;	
}

defaultproperties
{
	GroupName="BigWheels"
	FriendlyName="BigWheels"
	Description="Vehicle wheel size depends on how well you are doing."
}
