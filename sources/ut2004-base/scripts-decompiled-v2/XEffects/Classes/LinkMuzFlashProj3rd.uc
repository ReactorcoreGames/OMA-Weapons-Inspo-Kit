class LinkMuzFlashProj3rd extends xEmitter;

simulated event Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles = 1;
	//return;	
}

defaultproperties
{
	mParticleType=4
	mStartParticles=0
	mMaxParticles=3
	mLifeRange[0]=0.0800000
	mLifeRange[1]=0.1200000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mSizeRange[0]=0.6000000
	mSizeRange[1]=0.6000000
	mColorRange[0]=(R=70,G=70,B=70,A=255)
	mColorRange[1]=(R=70,G=70,B=70,A=255)
	mAttenKa=0.0000000
	mRandTextures=true
	mNumTileColumns=2
	mNumTileRows=2
	mMeshNodes=StaticMesh'XEffects.LinkMuzFlashMesh'
	Skins[0]=FinalBlend'XEffectMat.Link.LinkMuzProjGreenFB'
}
