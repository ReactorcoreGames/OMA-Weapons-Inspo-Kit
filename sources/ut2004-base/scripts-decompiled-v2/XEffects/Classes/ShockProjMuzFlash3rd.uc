class ShockProjMuzFlash3rd extends xEmitter;

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
	mMaxParticles=6
	mLifeRange[0]=0.1300000
	mLifeRange[1]=0.1300000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mRandOrient=true
	mSizeRange[0]=0.3500000
	mSizeRange[1]=0.4000000
	mGrowthRate=3.2000000
	mColorRange[0]=(R=50,G=255,B=255,A=255)
	mColorRange[1]=(R=50,G=255,B=255,A=255)
	mAttenKa=0.0000000
	mRandTextures=true
	mMeshNodes=StaticMesh'XEffects.MinigunFlashMesh'
	Skins[0]=FinalBlend'XGameShaders.WeaponShaders.ShockMuzFlash3rdFinal'
	Style=6
}
