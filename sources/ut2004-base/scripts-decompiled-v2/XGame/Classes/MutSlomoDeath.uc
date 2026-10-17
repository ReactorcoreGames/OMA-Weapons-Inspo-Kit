class MutSlomoDeath extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function PostBeginPlay()
{
	Level.RagdollTimeScale = 0.3000000;
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local xPawn X;

	X = xPawn(Other);
	// End:0x2F
	if(X != none)
	{
		X.RagdollLifeSpan = 18.0000000;
	}
	super.ModifyPlayer(Other);
	//return;	
}

defaultproperties
{
	GroupName="CorpseTimeScale"
	FriendlyName="Slow Motion Corpses"
	Description="Death should not be rushed."
}
