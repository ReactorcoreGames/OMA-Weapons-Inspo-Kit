class ChildLightningBolt extends xEmitter;

simulated function bool CheckMaxEffectDistance(PlayerController P, Vector SpawnLocation)
{
	return !P.BeyondViewDistance(SpawnLocation, 5000.0000000);
	//return;	
}

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x38
	if(EffectIsRelevant(Location + vect(0.0000000, 0.0000000, 2.0000000), false))
	{
		Spawn(Class'XEffects.ChildBlueSparks',,, Location, Rotation);
	}
	//return;	
}

defaultproperties
{
	mParticleType=5
	mRegen=false
	mStartParticles=10
	mMaxParticles=10
	mLifeRange[0]=0.5000000
	mLifeRange[1]=0.5000000
	mPosDev=(X=15.0000000,Y=15.0000000,Z=15.0000000)
	mSpawnVecB=(X=20.0000000,Y=0.0000000,Z=10.0000000)
	mSizeRange[0]=15.0000000
	mSizeRange[1]=15.0000000
	blockOnNet=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=1
	LifeSpan=0.5000000
	Skins[0]=Texture'XEffects.Skins.LightningBoltT'
	Style=6
}
