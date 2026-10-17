class KHMKIINoseGunPawn extends ONSTankSecondaryTurretPawn
	config(User);

function KDriverEnter(Pawn P)
{
	super(ONSWeaponPawn).KDriverEnter(P);
	// End:0x30
	if(!VehicleBase.bDriving)
	{
		VehicleBase.bDriving = true;
	}
	//return;	
}

event bool KDriverLeave(bool bForceLeave)
{
	local bool B;

	B = super(ONSWeaponPawn).KDriverLeave(bForceLeave);
	// End:0x41
	if(B && VehicleBase.IsVehicleEmpty())
	{
		VehicleBase.bDriving = false;
	}
	return B;
	//return;	
}

simulated function AttachDriver(Pawn P)
{
	// End:0x0D
	if(Gun == none)
	{
		return;
	}
	KHMKII(VehicleBase).OutputThrust = 0.0000000;
	KHMKII(VehicleBase).OutputStrafe = 0.0000000;
	KHMKII(VehicleBase).OutputRise = 0.0000000;
	P.SetLocation(VehicleBase.Location);
	P.SetBase(VehicleBase);
	P.SetPhysics(0);
	P.SetPhysics(0);
	//return;	
}

defaultproperties
{
	GunClass=Class'BWBP_VPC_Pro.KHMKIINoseGun'
	CameraBone="KHMKIIGunHousing"
	bDesiredBehindView=false
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryRadius=96.0000000
	FPCamPos=(X=0.0000000,Y=0.0000000,Z=-76.0000000)
	FPCamViewOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamDistance=0.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=-76.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamDistRange=(Min=0.0000000,Max=0.0000000)
	VehiclePositionString="Manning a KH AutoCannon"
	VehicleNameString="KH MarkII AutoCannon"
}
