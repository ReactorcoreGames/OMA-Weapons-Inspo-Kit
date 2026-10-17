class xDomPointB extends xDomPoint
	hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x61
	if(int(Level.NetMode) != int(NM_Client))
	{
		DomLetter = Spawn(Class'XGame.xDomB', self,, Location + EffectOffset, Rotation);
		DomRing = Spawn(Class'XGame.xDomRing', self,, Location + EffectOffset, Rotation);
	}
	SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
	//return;	
}

defaultproperties
{
	PointName="B"
	ControlEvent="xDOMMonitorB"
	DomCombiner=Combiner'XGameShaders.DomShaders.DomBCombiner'
	DomShader=Shader'XGameShaders.DomShaders.PulseBShader'
	ObjectiveName="Point B"
	Skins[0]=Texture'XGameTextures.DominationPointTex'
	Skins[1]=Combiner'XGameShaders.DomShaders.DomPointBCombiner'
}
