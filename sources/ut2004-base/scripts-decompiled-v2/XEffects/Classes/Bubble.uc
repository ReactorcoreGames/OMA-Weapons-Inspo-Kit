class Bubble extends Effects;

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	// End:0x17
	if(!Volume.bWaterVolume)
	{
		Destroy();
	}
	//return;	
}

simulated function BeginPlay()
{
	super(Actor).BeginPlay();
	// End:0x72
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		LifeSpan = 3.0000000 + (float(4) * FRand());
		// End:0x4E
		if(FRand() < 0.3000000)
		{
			Texture = Texture'XEffects.S_bubble2';			
		}
		else
		{
			// End:0x65
			if(FRand() < 0.3000000)
			{
				Texture = Texture'XEffects.S_bubble3';
			}
		}
		LoopAnim('Flying', 0.6000000);
	}
	//return;	
}

defaultproperties
{
	DrawType=2
	Physics=2
	RemoteRole=2
	LifeSpan=2.0000000
	Mesh=VertMesh'XEffects.SBubbles'
	Texture=Texture'XEffects.S_bubble1'
	DrawScale=0.2000000
	Style=3
	Mass=3.0000000
	Buoyancy=5.0000000
}
