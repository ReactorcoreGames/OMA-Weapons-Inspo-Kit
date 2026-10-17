class FM13GasPatch extends RX22AGasPatch;

simulated function Ignite(Pawn EventInstigator)
{
	local FM13SurfaceFire Temp;

	// End:0x12
	if(int(Role) != int(ROLE_Authority))
	{
		return;
	}
	bIgnited = true;
	bPendingIgnite = false;
	Temp = Spawn(Class'BWBP_OP_Pro.FM13SurfaceFire', Instigator,, Location + (Vector(Rotation) * float(32)), Rotation);
	// End:0x87
	if((InstigatorController == none) && Instigator != none)
	{
		Temp.InstigatorController = Instigator.Controller;		
	}
	else
	{
		Temp.InstigatorController = InstigatorController;
	}
	Temp.Ignitioneer = Ignitioneer;
	Temp.PlayIgnite();
	Temp.SetFuel(Fuel);
	Temp.GasControl = GasControl;
	Temp.SetBase(Base);
	GasControl.PatchReplace(self, Temp);
	Destroy();
	//return;	
}

