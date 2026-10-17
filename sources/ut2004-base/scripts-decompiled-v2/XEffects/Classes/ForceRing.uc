class ForceRing extends xEmitter;

simulated function Fire()
{
	mRegenRange[0] = 24.0000000;
	mRegenRange[1] = 24.0000000;
	SetTimer(0.2000000, false);
	//return;	
}

simulated function Timer()
{
	mRegenRange[0] = 0.0000000;
	mRegenRange[1] = 0.0000000;
	//return;	
}

defaultproperties
{
	mParticleType=3
	mStartParticles=0
	mMaxParticles=10
	mLifeRange[0]=0.2500000
	mLifeRange[1]=0.2500000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpeedRange[0]=250.0000000
	mSpeedRange[1]=250.0000000
	mPosRelative=true
	mSizeRange[0]=1.0000000
	mSizeRange[1]=1.0000000
	mGrowthRate=200.0000000
	mColorRange[0]=(R=32,G=255,B=32,A=255)
	mColorRange[1]=(R=32,G=255,B=32,A=255)
	mAttenKa=0.0000000
	Skins[0]=Texture'XEffectMat.Shock.shock_ring_b'
	Style=6
}
