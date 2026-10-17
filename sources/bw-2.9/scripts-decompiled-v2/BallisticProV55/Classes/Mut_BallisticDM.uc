class Mut_BallisticDM extends Mut_BallisticSwap
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
	FriendlyName="Ballistic - Internal"
}
