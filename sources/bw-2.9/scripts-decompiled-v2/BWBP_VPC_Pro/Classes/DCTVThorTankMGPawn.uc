class DCTVThorTankMGPawn extends ONSTankSecondaryTurretPawn
	config(User);

function AttachToVehicle(ONSVehicle VehiclePawn, name WeaponBone)
{
	// End:0x91
	if(int(Level.NetMode) != int(NM_Client))
	{
		VehicleBase = VehiclePawn;
		// End:0x78
		if((VehiclePawn.Weapons.Length > 0) && VehiclePawn.Weapons[0] != none)
		{
			VehiclePawn.Weapons[0].AttachToBone(Gun, 'MGWeapon');			
		}
		else
		{
			VehicleBase.AttachToBone(Gun, WeaponBone);
		}
	}
	//return;	
}

simulated function Vector GetCameraLocationStart()
{
	// End:0x28
	if(Gun != none)
	{
		return Gun.GetBoneCoords(CameraBone).Origin;		
	}
	else
	{
		return super(ONSWeaponPawn).GetCameraLocationStart();
	}
	//return;	
}

defaultproperties
{
	GunClass=Class'BWBP_VPC_Pro.DCTVThorTankMG'
	CameraBone="MG"
	FPCamPos=(X=-35.0000000,Y=0.0000000,Z=5.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	VehiclePositionString="operating a Thor Machinegun"
	VehicleNameString="Thor Machinegun Turret"
}
