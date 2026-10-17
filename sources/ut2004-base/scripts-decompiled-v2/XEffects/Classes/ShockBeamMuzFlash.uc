class ShockBeamMuzFlash extends xEmitter;

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
	mLifeRange[0]=0.1400000
	mLifeRange[1]=0.1400000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mAirResistance=0.0000000
	mSizeRange[0]=0.5000000
	mSizeRange[1]=0.5000000
	mGrowthRate=5.0000000
	mAttenKa=0.0000000
	mMeshNodes=StaticMesh'WeaponStaticMesh.ShockMuzFlash'
	Skins[0]=FinalBlend'XEffectMat.Shock.ShockFlashFB'
	Style=6
}
