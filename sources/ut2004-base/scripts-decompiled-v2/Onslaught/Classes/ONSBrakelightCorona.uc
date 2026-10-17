class ONSBrakelightCorona extends ONSHeadlightCorona;

simulated function UpdateBrakelightState(float Brake, int Gear)
{
	// End:0x2C
	if(Brake > 0.0100000)
	{
		bCorona = true;
		LightHue = byte(255);
		LightSaturation = 48;		
	}
	else
	{
		// End:0x56
		if(Gear == 0)
		{
			bCorona = true;
			LightHue = byte(255);
			LightSaturation = byte(255);			
		}
		else
		{
			bCorona = false;
		}
	}
	//return;	
}

defaultproperties
{
	MaxCoronaSize=50.0000000
	LightRadius=64.0000000
	DrawScale=0.3000000
}
