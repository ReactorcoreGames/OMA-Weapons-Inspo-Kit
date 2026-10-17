class ONSTankSecondaryTurretPawn extends ONSWeaponPawn
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

function ShouldTargetMissile(Projectile P)
{
	// End:0x87
	if((Bot(Controller) != none) && Bot(Controller).Skill >= 5.0000000)
	{
		// End:0x7C
		if(((Controller.Enemy != none) && Bot(Controller).EnemyVisible()) && Bot(Controller).Skill < float(5))
		{
			return;
		}
		ShootMissile(P);
	}
	//return;	
}

defaultproperties
{
	GunClass=Class'Onslaught.ONSTankSecondaryTurret'
	bHasAltFire=false
	CameraBone="Object02"
	bDrawDriverInTP=false
	DrivePos=(X=0.0000000,Y=0.0000000,Z=130.0000000)
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryRadius=130.0000000
	FPCamViewOffset=(X=10.0000000,Y=0.0000000,Z=30.0000000)
	TPCamDistance=300.0000000
	TPCamLookat=(X=-25.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=120.0000000)
	DriverDamageMult=0.0000000
	VehiclePositionString="in a Goliath turret"
	VehicleNameString="Goliath Minigun Turret"
}
