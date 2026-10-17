class LinkMuzFlashBeam1st extends xEmitter;

event Trigger(Actor Other, Pawn EventInstigator)
{
	mStartParticles += 1;
	//return;	
}

defaultproperties
{
	mStartParticles=0
	mMaxParticles=5
	mLifeRange[0]=0.2500000
	mLifeRange[1]=0.2500000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mPosRelative=true
	mRandOrient=true
	mSpinRange[0]=-100.0000000
	mSpinRange[1]=100.0000000
	mSizeRange[0]=24.0000000
	mSizeRange[1]=24.0000000
	mColorRange[0]=(R=200,G=200,B=200,A=255)
	mColorRange[1]=(R=200,G=200,B=200,A=255)
	mAttenKa=0.0000000
	bHidden=true
	bOnlyOwnerSee=true
	Skins[0]=Texture'XEffectMat.Link.link_muz_green'
	Style=3
}
