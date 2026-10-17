class xBlueFlagBase extends xRealCTFBase
	hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
	local xCTFBase xbase;

	super.PostBeginPlay();
	// End:0x5E
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		xbase = Spawn(Class'XGame.xCTFBase', self,, Location - BaseOffset, rot(0, 0, 0));
		xbase.Skins[0] = Texture'XGameTextures.FlagBaseTexB';
	}
	//return;	
}

defaultproperties
{
	FlagType=Class'XGame.xBlueFlag'
	DefenderTeamIndex=1
	DefenseScriptTags="DefendBlueFlag"
	ObjectiveName="Blue Flag"
	Skins[0]=FinalBlend'XGameShaders2004.CTFShaders.BlueFlagShader_F'
}
