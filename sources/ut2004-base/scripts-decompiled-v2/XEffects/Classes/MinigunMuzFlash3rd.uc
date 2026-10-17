class MinigunMuzFlash3rd extends xEmitter;

var int mNumPerFlash;

function Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles = mNumPerFlash;
	mGrowthRate = default.mGrowthRate;
	mLifeRange[0] = default.mLifeRange[0];
	mLifeRange[1] = default.mLifeRange[1];
	//return;	
}

defaultproperties
{
	mNumPerFlash=1
	mParticleType=4
	mStartParticles=0
	mMaxParticles=6
	mLifeRange[0]=0.1500000
	mLifeRange[1]=0.2000000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mRandOrient=true
	mSizeRange[0]=0.0500000
	mSizeRange[1]=0.0800000
	mGrowthRate=2.2000000
	mRandTextures=true
	mMeshNodes=StaticMesh'XEffects.MinigunFlashMesh'
	Skins[0]=FinalBlend'XGameShaders.WeaponShaders.MinigunFlashFinal'
	Style=6
}
