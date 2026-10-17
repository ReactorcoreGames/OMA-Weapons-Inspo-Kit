class banner_blue extends uTeamBanner;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	LoopAnim('banner');
	SimAnim.bAnimLoop = true;
	//return;	
}

defaultproperties
{
	Team=1
	Skins[0]=FinalBlend'SC_Volcano_T.Banners.SC_BannerBlue_F'
}
