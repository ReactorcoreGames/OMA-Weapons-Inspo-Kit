class Mut_AddShielding extends Mutator
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config int NewSS;

function ModifyPlayer(Pawn Other)
{
	Other.AddShieldStrength(NewSS);
	super.ModifyPlayer(Other);
	//return;	
}

defaultproperties
{
	NewSS=75
	FriendlyName="BallisticPro: Starting Shield"
	Description="Gives a configurable amount of shield to players on spawn."
}
