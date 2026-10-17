class ShockExplosion extends xEmitter;

simulated event PostBeginPlay()
{
	local PlayerController PC;

	super(Actor).PostBeginPlay();
	SetTimer(0.5000000, false);
	// End:0x34
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0x9B
		if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(4000))
		{
			LightType = 0;
			bDynamicLight = false;
		}
	}
	//return;	
}

simulated function Timer()
{
	LightType = 0;
	//return;	
}

defaultproperties
{
	mParticleType=4
	mMaxParticles=1
	mLifeRange[0]=0.6000000
	mLifeRange[1]=0.6000000
	mRegenRange[0]=0.0000000
	mRegenRange[1]=0.0000000
	mSpeedRange[0]=0.0000000
	mSpeedRange[1]=0.0000000
	mRandOrient=true
	mSizeRange[0]=0.6000000
	mSizeRange[1]=0.6000000
	mGrowthRate=1.2000000
	mColorRange[0]=(R=100,G=100,B=100,A=255)
	mColorRange[1]=(R=100,G=100,B=100,A=255)
	mAttenKa=0.3000000
	mAttenFunc=1
	mMeshNodes=StaticMesh'XEffects.EffectsSphere144'
	LightType=1
	LightHue=195
	LightSaturation=85
	LightBrightness=255.0000000
	LightRadius=5.0000000
	bAttenByLife=true
	bDynamicLight=true
	LifeSpan=2.0000000
	Skins[0]=FinalBlend'XEffectMat.Shock.ShockDarkFB'
}
