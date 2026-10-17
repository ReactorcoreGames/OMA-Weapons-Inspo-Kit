class MutVampire extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
	local GameRules G;

	super(Actor).PostBeginPlay();
	G = Spawn(Class'XGame.VampireGameRules');
	// End:0x51
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = G;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(G);
	}
	Destroy();
	//return;	
}

defaultproperties
{
	GroupName="Vampire"
	FriendlyName="Vampire"
	Description="Damaging your opponents will heal you."
}
