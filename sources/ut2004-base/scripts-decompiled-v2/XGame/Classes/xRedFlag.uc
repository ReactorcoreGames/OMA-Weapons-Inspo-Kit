class xRedFlag extends CTFFlag;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	LoopAnim('flag', 0.8000000);
	SimAnim.bAnimLoop = true;
	//return;	
}

defaultproperties
{
	Mesh=VertMesh'XGame_rc.FlagMesh'
	DrawScale=0.9000000
	Skins[0]=FinalBlend'XGameShaders2004.CTFShaders.RedFlagShader_F'
}
