class SmallRedeemerExplosion extends RocketExplosion;

simulated function PostBeginPlay()
{
	// End:0x21
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'XEffects.ExplosionCrap');
	}
	//return;	
}

defaultproperties
{
	RemoteRole=2
}
