class pclMuzFlashA extends xEmitter;

event Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles = int(ClampToMaxParticles(100.0000000));
	//return;	
}

defaultproperties
{
	mRegenPause=true
	mStartParticles=0
	mMaxParticles=2
	mLifeRange[0]=0.0500000
	mLifeRange[1]=0.0500000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mRandOrient=true
	mSizeRange[0]=35.0000000
	mSizeRange[1]=70.0000000
	mColorRange[0]=(R=95,G=95,B=95,A=255)
	mColorRange[1]=(R=95,G=95,B=95,A=255)
	mAttenuate=false
	bHidden=true
	bOnlyOwnerSee=true
	DrawScale=0.7500000
	Skins[0]=Texture'XEffects.Skins.MuzFlashA_t'
	Style=6
}
