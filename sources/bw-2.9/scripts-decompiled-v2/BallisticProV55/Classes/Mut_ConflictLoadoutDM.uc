class Mut_ConflictLoadoutDM extends Mut_ConflictLoadout
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
	FriendlyName="BallisticPro: Conflict Loadout - Internal"
}
