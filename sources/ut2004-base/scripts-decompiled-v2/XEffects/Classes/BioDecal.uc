class BioDecal extends xScorch;

simulated function BeginPlay()
{
	// End:0x2D
	if(!Level.bDropDetail && FRand() < 0.5000000)
	{
		ProjTexture = Texture'XEffects.xbiosplat2';
	}
	super(Actor).BeginPlay();
	//return;	
}

defaultproperties
{
	ProjTexture=Texture'XEffects.xbiosplat'
	bClipStaticMesh=true
	CullDistance=7000.0000000
	LifeSpan=6.0000000
	DrawScale=0.6500000
}
