class BioMuzFlash1st extends xEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles += mNumPerFlash;
	//return;	
}

defaultproperties
{
	mNumPerFlash=1
	mParticleType=4
	mStartParticles=0
	mMaxParticles=5
	mLifeRange[0]=0.1000000
	mLifeRange[1]=0.1500000
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
	mGrowthRate=10.0000000
	mColorRange[0]=(R=180,G=180,B=180,A=255)
	mColorRange[1]=(R=180,G=180,B=180,A=255)
	mMeshNodes=StaticMesh'XEffects.FlakMuzFlashMesh'
	bHidden=true
	Skins[0]=FinalBlend'XGameShaders.WeaponShaders.BioFlashFinal'
}
