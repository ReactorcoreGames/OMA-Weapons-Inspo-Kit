class FastBotSparks extends xEmitter;

simulated function Timer()
{
	GotoState('Ticking');
	//return;	
}

simulated function PostNetBeginPlay()
{
	SetTimer(LifeSpan - 1.0000000, false);
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
	mParticleType=2
	mStartParticles=0
	mMaxParticles=20
	mDelayRange[1]=0.0500000
	mLifeRange[0]=0.1000000
	mLifeRange[1]=0.2000000
	mRegenRange[0]=60.0000000
	mRegenRange[1]=60.0000000
	mDirDev=(X=0.6000000,Y=0.6000000,Z=0.6000000)
	mPosDev=(X=0.8000000,Y=0.8000000,Z=0.8000000)
	mSpawnVecB=(X=2.0000000,Y=0.0000000,Z=0.0300000)
	mSpeedRange[0]=150.0000000
	mSpeedRange[1]=200.0000000
	mMassRange[0]=1.5000000
	mMassRange[1]=2.5000000
	mAirResistance=0.0000000
	mSizeRange[0]=2.5000000
	mSizeRange[1]=1.5000000
	mGrowthRate=-4.0000000
	mAttenKa=0.0000000
	LifeSpan=0.2000000
	Skins[0]=Texture'XEffects.Skins.BotSpark'
	ScaleGlow=2.0000000
	Style=6
}
