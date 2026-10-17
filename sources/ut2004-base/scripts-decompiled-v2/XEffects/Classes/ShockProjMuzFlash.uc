class ShockProjMuzFlash extends xEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles += mNumPerFlash;
	//return;	
}

defaultproperties
{
	mNumPerFlash=3
	mParticleType=4
	mStartParticles=0
	mMaxParticles=6
	mLifeRange[0]=0.2000000
	mLifeRange[1]=0.2000000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mSizeRange[0]=0.6000000
	mSizeRange[1]=0.7000000
	mAttenKa=0.0000000
	mRandTextures=true
	mNumTileColumns=2
	mNumTileRows=2
	mMeshNodes=StaticMesh'XEffects.MinigunMuzFlash1stMesh'
	Skins[0]=FinalBlend'XGameShaders.WeaponShaders.ShockMuzFlash1stFinal'
	Style=6
}
