class PainterMark extends Effects;

var Rotator RealRotation;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		RealRotation;
}

simulated function SpawnEffects()
{
	//return;	
}

auto state StartUp
{
	simulated function Tick(float DeltaTime)
	{
		local PainterMark Marks;

		// End:0x28
		foreach VisibleActors(Class'XEffects.PainterMark', Marks)
		{
			// End:0x27
			if(Marks != self)
			{
				Marks.Destroy();
			}			
		}		
		// End:0x3C
		if(Instigator != none)
		{
			MakeNoise(0.3000000);
		}
		// End:0x5A
		if(int(Role) == int(ROLE_Authority))
		{
			RealRotation = Rotation;			
		}
		else
		{
			SetRotation(RealRotation);
		}
		// End:0x81
		if(int(Level.NetMode) != int(NM_DedicatedServer))
		{
			SpawnEffects();
		}
		Disable('Tick');
		//return;		
	}
	stop;	
}

defaultproperties
{
	DrawType=0
	RemoteRole=2
	LifeSpan=10.0000000
}
