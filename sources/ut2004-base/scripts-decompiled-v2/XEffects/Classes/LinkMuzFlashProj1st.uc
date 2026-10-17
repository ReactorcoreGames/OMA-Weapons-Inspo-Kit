class LinkMuzFlashProj1st extends xEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles += mNumPerFlash;
	//return;	
}

defaultproperties
{
	mNumPerFlash=2
	mParticleType=4
	mStartParticles=0
	mMaxParticles=5
	mLifeRange[0]=0.1000000
	mLifeRange[1]=0.1400000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mRandOrient=true
	mSizeRange[0]=0.6000000
	mSizeRange[1]=0.8000000
	mColorRange[0]=(R=75,G=75,B=75,A=255)
	mColorRange[1]=(R=75,G=75,B=75,A=255)
	mRandTextures=true
	mNumTileColumns=2
	mNumTileRows=2
	mMeshNodes=StaticMesh'XEffects.LinkMuzFlashMesh'
	bHidden=true
	Skins[0]=FinalBlend'XEffectMat.Link.LinkMuzProjGreenFB'
}
