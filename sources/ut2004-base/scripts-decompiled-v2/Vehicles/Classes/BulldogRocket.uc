class BulldogRocket extends SeekingRocketProj;

simulated function Timer()
{
	local Vector ForceDir;
	local float VelMag;

	// End:0x24
	if(InitialDir == vect(0.0000000, 0.0000000, 0.0000000))
	{
		InitialDir = Normal(Velocity);
	}
	Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
	super.Timer();
	// End:0xF0
	if((Seeking != none) && Seeking != Instigator)
	{
		ForceDir = Normal(Seeking.Location - Location);
		// End:0xE6
		if((ForceDir Dot InitialDir) > -0.5000000)
		{
			VelMag = VSize(Velocity);
			ForceDir = Normal(((ForceDir * 0.5000000) * VelMag) + (0.8000000 * Velocity));
			Velocity = VelMag * ForceDir;
			Acceleration += (float(5) * ForceDir);
		}
		SetRotation(Rotator(Velocity));
	}
	//return;	
}

