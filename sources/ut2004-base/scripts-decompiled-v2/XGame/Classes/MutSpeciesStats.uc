class MutSpeciesStats extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
	local GameRules G;

	super(Actor).PostBeginPlay();
	G = Spawn(Class'XGame.SpeciesGameRules');
	// End:0x51
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

function ModifyPlayer(Pawn Other)
{
	local xPawn xp;

	super.ModifyPlayer(Other);
	xp = xPawn(Other);
	// End:0x28
	if(xp == none)
	{
		return;
	}
	xp.Species.static.ModifyPawn(xp);
	//return;	
}

defaultproperties
{
	GroupName="Species"
	FriendlyName="Species Statistics"
	Description="Each race has unique combat statistics."
}
