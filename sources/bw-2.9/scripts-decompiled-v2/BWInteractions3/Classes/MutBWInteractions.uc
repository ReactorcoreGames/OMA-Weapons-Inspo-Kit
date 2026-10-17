class MutBWInteractions extends xMutator
	transient
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function ClientSideInitialization(PlayerController PC)
{
	AddAnInteraction(PC, string(Class'BWInteractions3.BallisticProInteractions'));
	//return;	
}

defaultproperties
{
	FriendlyName="Ballistic Weapons: Bind Menu"
	Description="Adds bind support to Ballistic."
}
