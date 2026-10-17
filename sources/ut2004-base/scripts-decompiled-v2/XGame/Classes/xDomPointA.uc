class xDomPointA extends xDomPoint
	hidecategories(Lighting,LightColor,Karma,Force);

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x61
	if(int(Level.NetMode) != int(NM_Client))
	{
		DomLetter = Spawn(Class'XGame.xDomA', self,, Location + EffectOffset, Rotation);
		DomRing = Spawn(Class'XGame.xDomRing', self,, Location + EffectOffset, Rotation);
	}
	SetShaderStatus(CNeutralState[0], SNeutralState, CNeutralState[1]);
	//return;	
}

defaultproperties
{
	PointName="A"
	ControlEvent="xDOMMonitorA"
	PrimaryTeam=1
	ObjectiveName="Point A"
}
