class ONSPRVRearGunPawn extends ONSWeaponPawn
	config(User);

function AltFire(optional float F)
{
	local PlayerController PC;

	PC = PlayerController(Controller);
	// End:0x1D
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = true;
	PC.ToggleZoom();
	//return;	
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
	local PlayerController PC;

	// End:0x19
	if(!bWasAltFire)
	{
		super.ClientVehicleCeaseFire(bWasAltFire);
		return;
	}
	PC = PlayerController(Controller);
	// End:0x36
	if(PC == none)
	{
		return;
	}
	bWeaponisAltFiring = false;
	PC.StopZoom();
	//return;	
}

simulated function ClientKDriverLeave(PlayerController PC)
{
	super.ClientKDriverLeave(PC);
	bWeaponisAltFiring = false;
	PC.EndZoom();
	//return;	
}

defaultproperties
{
	GunClass=Class'Onslaught.ONSPRVRearGun'
	bHasAltFire=false
	CameraBone="REARgunTURRET"
	DrivePos=(X=-20.0000000,Y=0.0000000,Z=90.0000000)
	ExitPositions=/* ERROR: System.ArgumentOutOfRangeException */
	EntryPosition=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	EntryRadius=160.0000000
	FPCamViewOffset=(X=0.0000000,Y=0.0000000,Z=40.0000000)
	TPCamDistance=350.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	DriverDamageMult=0.6000000
	VehiclePositionString="in a HellBender's rear turret"
	VehicleNameString="HellBender Rear Turret"
}
