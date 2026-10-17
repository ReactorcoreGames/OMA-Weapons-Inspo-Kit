class MinigunMuzFlash1st extends xEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles += mNumPerFlash;
	//return;	
}

defaultproperties
{
	mNumPerFlash=5
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
	mSizeRange[0]=0.0500000
	mSizeRange[1]=0.0800000
	mGrowthRate=3.0000000
	mRandTextures=true
	mTileAnimation=true
	mNumTileColumns=2
	mNumTileRows=2
	mMeshNodes=StaticMesh'XEffects.MinigunMuzFlash1stMesh'
	DrawScale=0.9000000
	Skins[0]=FinalBlend'XGameShaders.WeaponShaders.MinigunMuzFlash1stFinal'
	Style=6
}
