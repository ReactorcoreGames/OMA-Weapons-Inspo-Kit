class BioSmoke extends pclSmoke;

simulated function PostBeginPlay()
{
	SetTimer(0.1000000, false);
	super(Actor).PostBeginPlay();
	//return;	
}

simulated function Timer()
{
	mRegen = false;
	//return;	
}

defaultproperties
{
	mStartParticles=1
	mLifeRange[0]=0.4000000
	mLifeRange[1]=0.7000000
	mRegenRange[0]=150.0000000
	mRegenRange[1]=150.0000000
	mDirDev=(X=1.4000000,Y=1.4000000,Z=1.4000000)
	mPosDev=(X=10.8000000,Y=10.8000000,Z=10.8000000)
	mSpeedRange[0]=20.0000000
	mSpeedRange[1]=45.0000000
	mSpinRange[0]=10.0000000
	mSpinRange[1]=90.0000000
	mSizeRange[0]=60.0000000
	mSizeRange[1]=60.0000000
	mGrowthRate=70.0000000
	mLifeColorMap=Texture'XEffects.BiolifeMap_t'
	Physics=10
	LifeSpan=1.2000000
}
