class ONSPRVSideGunPawn extends ONSWeaponPawn
	config(User);

function bool StopWeaponFiring()
{
	// End:0x3E
	if(bWeaponisAltFiring && Bot(Controller) != none)
	{
		Gun.CalcWeaponFire();
		Gun.AltFire(Controller);
	}
	return super(Vehicle).StopWeaponFiring();
	//return;	
}

defaultproperties
{
	GunClass=Class'Onslaught.ONSPRVSideGun'
	ExitPositions[0]=()
	ExitPositions[1]=()
	ExitPositions[2]=()
	ExitPositions[3]=()
	EntryPosition=(X=40.0000000,Y=50.0000000,Z=-100.0000000)
	EntryRadius=170.0000000
	FPCamPos=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	TPCamDistance=150.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	DriverDamageMult=0.4000000
	VehiclePositionString="in a HellBender's side turret"
	VehicleNameString="HellBender Side Turret"
}
