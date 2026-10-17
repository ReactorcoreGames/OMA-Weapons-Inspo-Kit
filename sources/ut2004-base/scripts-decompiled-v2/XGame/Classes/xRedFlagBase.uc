class xRedFlagBase extends xRealCTFBase
	hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x42
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'XGame.xCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
	}
	//return;	
}

defaultproperties
{
	FlagType=Class'XGame.xRedFlag'
	DefenseScriptTags="DefendRedFlag"
	ObjectiveName="Red Flag"
	Skins[0]=FinalBlend'XGameShaders2004.CTFShaders.RedFlagShader_F'
}
