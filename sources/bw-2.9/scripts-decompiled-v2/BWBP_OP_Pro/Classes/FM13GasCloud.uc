class FM13GasCloud extends RX22AGasCloud;

simulated function Ignite(Pawn EventInstigator)
{
	local RX22ACloudBang Bang;

	bIgnited = true;
	// End:0x65
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Bang = Spawn(Class'BallisticProV55.RX22ACloudBang',,, Location);
		Bang.InitCloudBang(Fuel / MaxFuel);
		PlaySound(IgniteSound,, 0.8000000,, 112.0000000);
	}
	// End:0xB9
	if(int(Role) == int(ROLE_Authority))
	{
		Ignitioneer = EventInstigator;
		HurtRadius(25.0000000 + (Fuel * float(5)), 128.0000000 + (Fuel * float(3)), Class'BWBP_OP_Pro.DT_FM13CloudBomb', 10000.0000000, Location);
	}
	//return;	
}

