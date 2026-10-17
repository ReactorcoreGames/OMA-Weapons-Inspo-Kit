class AD_BloodDecal extends BallisticDecal
	config(BallisticProV55);

var() globalconfig float StayScale;

event PostBeginPlay()
{
	// End:0x19
	if(StayScale >= float(0))
	{
		StayTime *= StayScale;
	}
	super.PostBeginPlay();
	//return;	
}

function StopExpanding()
{
	bExpandingDecal = false;
	AbandonProjector(StayTime * Level.DecalStayScale);
	Destroy();
	//return;	
}

defaultproperties
{
	StayScale=1.0000000
	bClipBSP=true
	bClipStaticMesh=true
}
