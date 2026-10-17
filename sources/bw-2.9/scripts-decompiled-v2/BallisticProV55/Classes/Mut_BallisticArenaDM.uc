class Mut_BallisticArenaDM extends Mut_BallisticArena
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
	FriendlyName="Ballistic Arena - Internal"
}
