class MutUDamageReward extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x31
	if(!bDeleteMe)
	{
		Level.Game.AddGameModifier(Spawn(Class'XGame.UDamageRules'));
	}
	//return;	
}

defaultproperties
{
	FriendlyName="UDamage Reward"
	Description="Any remaining UDamage powerup is thrown from players when they are fragged."
}
