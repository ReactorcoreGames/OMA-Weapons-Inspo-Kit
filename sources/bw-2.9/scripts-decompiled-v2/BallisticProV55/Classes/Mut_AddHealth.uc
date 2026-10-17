class Mut_AddHealth extends Mutator
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config int NewHP;
var() config int NewHealthMax;
var() config int NewSHealthMax;

function ModifyPlayer(Pawn Other)
{
	Other.Health = NewHP;
	Other.HealthMax = float(NewHealthMax);
	Other.SuperHealthMax = float(NewSHealthMax);
	super.ModifyPlayer(Other);
	//return;	
}

defaultproperties
{
	NewHP=175
	NewHealthMax=175
	NewSHealthMax=218
	FriendlyName="BallisticPro: Starting Health"
	Description="Gives a configurable amount of health to players on spawn."
}
