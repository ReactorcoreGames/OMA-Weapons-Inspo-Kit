class BloodJet extends xEmitter;

var Class<xScorch> SplatterClass;

simulated function Timer()
{
	GotoState('Ticking');
	//return;	
}

simulated function PostNetBeginPlay()
{
	SetTimer(LifeSpan - 1.0000000, false);
	// End:0x2F
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		WallSplat();
	}
	super(Actor).PostNetBeginPlay();
	//return;	
}

simulated function WallSplat()
{
	local Vector WallHit, WallNormal;
	local Actor WallActor;

	// End:0x0E
	if(FRand() > 0.8000000)
	{
		return;
	}
	WallActor = Trace(WallHit, WallNormal, Location + vect(0.0000000, 0.0000000, -200.0000000), Location, false);
	// End:0x6F
	if(WallActor != none)
	{
		Spawn(SplatterClass,,, WallHit + (float(20) * (WallNormal + VRand())), Rotator(-WallNormal));
	}
	//return;	
}

state Ticking
{
	simulated function Tick(float dt)
	{
		// End:0x2C
		if(LifeSpan < 1.0000000)
		{
			mRegenRange[0] *= LifeSpan;
			mRegenRange[1] = mRegenRange[0];
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	SplatterClass=Class'XEffects.BloodSplatter'
	mRegenPause=true
	mRegenOnTime[0]=1.0000000
	mRegenOnTime[1]=2.0000000
	mRegenOffTime[0]=0.4000000
	mRegenOffTime[1]=1.0000000
	mStartParticles=0
	mMaxParticles=60
	mLifeRange[0]=1.0000000
	mLifeRange[1]=1.0000000
	mRegenRange[0]=80.0000000
	mRegenRange[1]=80.0000000
	mDirDev=(X=0.0500000,Y=0.0500000,Z=0.0500000)
	mSpeedRange[0]=50.0000000
	mSpeedRange[1]=90.0000000
	mMassRange[0]=0.4000000
	mMassRange[1]=0.5000000
	mAirResistance=0.6000000
	mRandOrient=true
	mSizeRange[0]=1.5000000
	mSizeRange[1]=2.5000000
	mGrowthRate=12.0000000
	mRandTextures=true
	mNumTileColumns=4
	mNumTileRows=4
	LifeSpan=3.5000000
	Skins[0]=Texture'xGameShadersB.Blood.BloodJetc'
	Style=5
}
