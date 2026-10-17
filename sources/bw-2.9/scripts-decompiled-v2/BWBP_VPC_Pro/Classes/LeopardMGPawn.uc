class LeopardMGPawn extends ONSWeaponPawn
	config(User);

var(Bones) name AttachmentBoneName;

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

function AttachToVehicle(ONSVehicle VehiclePawn, name WeaponBone)
{
	// End:0x91
	if(int(Level.NetMode) != int(NM_Client))
	{
		VehicleBase = VehiclePawn;
		// End:0x78
		if((VehiclePawn.Weapons.Length > 0) && VehiclePawn.Weapons[0] != none)
		{
			VehiclePawn.Weapons[0].AttachToBone(Gun, AttachmentBoneName);			
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
		return super.GetCameraLocationStart();
	}
	//return;	
}

defaultproperties
{
	AttachmentBoneName="MGAttachBone"
	GunClass=Class'BWBP_VPC_Pro.LeopardMG'
	bHasAltFire=false
	CameraBone="MGAttachBone"
	bDrawDriverInTP=false
	bDesiredBehindView=false
	DrivePos=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	DriveAnim="Idle_Rest"
	ExitPositions[0]=()
	ExitPositions[1]=()
	EntryRadius=130.0000000
	FPCamViewOffset=(X=-8.0000000,Y=-5.0000000,Z=40.0000000)
	TPCamDistance=450.0000000
	TPCamLookat=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	TPCamWorldOffset=(X=0.0000000,Y=0.0000000,Z=96.0000000)
	TPCamDistRange=(Min=128.0000000,Max=450.0000000)
	DriverDamageMult=0.0000000
	VehiclePositionString="Manning a TM V .50"
	VehicleNameString="Leopard TM V .50 Cal"
}
