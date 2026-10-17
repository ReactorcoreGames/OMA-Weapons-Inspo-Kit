class Lightning extends Effects;

var float Count;

simulated function PreBeginPlay()
{
	//return;	
}

simulated function Tick(float DeltaTime)
{
	// End:0x6B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x5F
		if(Count > 0.0700000)
		{
			Style = 3;
			ScaleGlow = (LifeSpan / default.LifeSpan) * 0.2000000;
			AmbientGlow = byte(ScaleGlow * float(210));			
		}
		else
		{
			Count += DeltaTime;
		}
	}
	//return;	
}

simulated function PostBeginPlay()
{
	PlaySound(Sound'XEffects.LightningSound',,,,,, false);
	//return;	
}

defaultproperties
{
	DrawType=2
	LifeSpan=0.6000000
	Mesh=VertMesh'XEffects.LightningMesh'
	LODBias=9.0000000
	AmbientGlow=255
	ScaleGlow=10.0000000
}
