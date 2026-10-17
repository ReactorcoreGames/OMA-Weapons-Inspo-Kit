class AD_ImpactDecal extends BallisticDecal
	config(BallisticProV55);

var() globalconfig bool bPermanentImpacts;

event PostBeginPlay()
{
	// End:0x0B
	if(bWaitForInit)
	{
		return;
	}
	// End:0x1F
	if(bPermanentImpacts)
	{
		StayTime = 0.0000000;
	}
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	bRandomRotate=true
	StayTime=20.0000000
	FOV=1
	MaxTraceDistance=60
	bProjectParticles=false
	bProjectActor=false
	bClipBSP=true
	bClipStaticMesh=true
	bProjectOnUnlit=true
	bStatic=false
	LifeSpan=20.0000000
	DrawScale=0.2500000
	bGameRelevant=true
}
