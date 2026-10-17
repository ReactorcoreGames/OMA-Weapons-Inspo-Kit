class LinkSparks extends xEmitter;

var float DesiredRegen;

simulated function SetLinkStatus(int Links, bool bLinking, float ls)
{
	mSizeRange[0] = default.mSizeRange[0] * ((ls * 1.0000000) + float(1));
	mSizeRange[1] = default.mSizeRange[1] * ((ls * 1.0000000) + float(1));
	mSpeedRange[0] = default.mSpeedRange[0] * ((ls * 0.7000000) + float(1));
	mSpeedRange[1] = default.mSpeedRange[1] * ((ls * 0.7000000) + float(1));
	mLifeRange[0] = default.mLifeRange[0] * (ls + float(1));
	mLifeRange[1] = mLifeRange[0];
	DesiredRegen = default.mRegenRange[0] * (ls + float(1));
	// End:0xE6
	if(Links == 0)
	{
		Skins[0] = Texture'XEffectMat.Link.link_spark_green';		
	}
	else
	{
		Skins[0] = Texture'XEffectMat.Link.link_spark_yellow';
	}
	//return;	
}

defaultproperties
{
	DesiredRegen=40.0000000
	mParticleType=2
	mStartParticles=0
	mMaxParticles=40
	mLifeRange[0]=0.5000000
	mLifeRange[1]=0.5000000
	mRegenRange[0]=40.0000000
	mRegenRange[1]=40.0000000
	mDirDev=(X=0.5000000,Y=1.0000000,Z=1.0000000)
	mPosDev=(X=8.0000000,Y=8.0000000,Z=8.0000000)
	mSpawnVecB=(X=12.0000000,Y=0.0000000,Z=0.0600000)
	mSpeedRange[0]=-175.0000000
	mSpeedRange[1]=-225.0000000
	mMassRange[0]=2.0000000
	mMassRange[1]=2.0000000
	mSizeRange[0]=8.0000000
	mSizeRange[1]=12.0000000
	mColorRange[0]=(R=150,G=150,B=150,A=255)
	mColorRange[1]=(R=150,G=150,B=150,A=255)
	mAttenKa=0.1000000
	LightType=1
	LightHue=100
	LightSaturation=100
	LightBrightness=180.0000000
	LightRadius=3.0000000
	bDynamicLight=true
	Skins[0]=Texture'XEffectMat.Link.link_spark_green'
	Style=6
}
