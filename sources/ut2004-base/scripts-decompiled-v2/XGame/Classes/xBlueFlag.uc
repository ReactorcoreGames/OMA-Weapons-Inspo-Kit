class xBlueFlag extends CTFFlag;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	LoopAnim('flag', 0.8000000);
	SimAnim.bAnimLoop = true;
	//return;	
}

defaultproperties
{
	TeamNum=1
	LightHue=130
	Mesh=VertMesh'XGame_rc.FlagMesh'
	DrawScale=0.9000000
	Skins[0]=FinalBlend'XGameShaders2004.CTFShaders.BlueFlagShader_F'
}
