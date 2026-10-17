class ShockBeamCoil extends xEmitter;

defaultproperties
{
	mParticleType=6
	mMaxParticles=1
	mLifeRange=1.0000000
	mRegenDist=90.0000000
	mSpinRange=32000.0000000
	mSizeRange[0]=0.3000000
	mSizeRange[1]=0.6000000
	mColorRange[0]=(R=50,G=50,B=50,A=255)
	mColorRange[1]=(R=50,G=50,B=50,A=255)
	mMeshNodes=StaticMesh'XEffects.ShockCoil'
	bHighDetail=true
	LifeSpan=0.7500000
	DrawScale3D=(X=3.0000000,Y=15.0000000,Z=15.0000000)
	Skins[0]=FinalBlend'XEffectMat.Shock.ShockCoilFB'
}
