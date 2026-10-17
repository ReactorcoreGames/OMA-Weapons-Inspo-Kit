class LightningBolt extends xEmitter;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	MakeNoise(0.5000000);
	PlaySound(SoundGroup'WeaponSounds.LightningGun.LightningGunImpact', 1,,,,, false);
	// End:0x4A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'XEffects.BlueSparks',,, Location, Rotation);
	}
	//return;	
}

defaultproperties
{
	mParticleType=5
	mRegen=false
	mStartParticles=30
	mMaxParticles=30
	mLifeRange[0]=0.5000000
	mLifeRange[1]=0.5000000
	mPosDev=(X=5.0000000,Y=5.0000000,Z=5.0000000)
	mSpawnVecB=(X=40.0000000,Y=40.0000000,Z=10.0000000)
	mSizeRange[0]=30.0000000
	mSizeRange[1]=30.0000000
	blockOnNet=true
	bReplicateInstigator=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=1
	NetPriority=3.0000000
	Skins[0]=Texture'XEffects.Skins.LightningBoltT'
	Style=6
}
