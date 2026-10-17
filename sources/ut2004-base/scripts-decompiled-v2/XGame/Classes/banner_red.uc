class banner_red extends uTeamBanner;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	LoopAnim('banner');
	SimAnim.bAnimLoop = true;
	//return;	
}

defaultproperties
{
	Skins[0]=FinalBlend'SC_Volcano_T.Banners.SC_BannerRed_F'
}
