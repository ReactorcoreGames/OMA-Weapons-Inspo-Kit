class TransEffect extends xEmitter;

simulated event PostBeginPlay()
{
	SetTimer(0.7000000, true);
	SetRotation(rot(0, 0, 0));
	PlaySound(ProceduralSound'WeaponSounds.PWeaponSpawn1.P1WeaponSpawn1', 0);
	super(Actor).PostBeginPlay();
	//return;	
}

simulated event Timer()
{
	mRegen = false;
	//return;	
}

defaultproperties
{
	mParticleType=4
	mStartParticles=0
	mLifeRange[0]=0.6000000
	mLifeRange[1]=0.6000000
	mRegenRange[0]=30.0000000
	mRegenRange[1]=30.0000000
	mPosDev=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mSizeRange[0]=1.1000000
	mSizeRange[1]=0.5000000
	mGrowthRate=-0.5000000
	mMeshNodes=StaticMesh'XEffects.TeleRing'
	Physics=5
	RemoteRole=2
	Tag="xEmitter"
	Skins[0]=Shader'XGameShaders.Trans.TransRing'
	bFixedRotationDir=true
}
