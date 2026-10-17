class Mut_OutfittingDM extends Mut_Outfitting
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool MutatorIsAllowed()
{
	return true;
	//return;	
}

defaultproperties
{
	DMMode=true
	FriendlyName="Ballistic LoadOut - Internal"
}
