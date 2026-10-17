class ONSManualGunPawn extends ONSStationaryWeaponPawn
	config(User);

simulated function ActivateOverlay(bool bActive)
{
	// End:0x0D
	if(Controller == none)
	{
		return;
	}
	super(Vehicle).ActivateOverlay(bActive);
	// End:0x66
	if(Gun != none)
	{
		// End:0x4B
		if(bActive)
		{
			Gun.SetBoneScale(4, 0.0000000, 'TurretCockpit');			
		}
		else
		{
			Gun.SetBoneScale(4, 1.0000000, 'TurretCockpit');
		}
	}
	//return;	
}

defaultproperties
{
	GunClass=Class'Onslaught.ONSManualGun'
	CameraBone="TurretCockpit"
	DrivePos=(X=-50.0000000,Y=0.0000000,Z=48.0000000)
	EntryRadius=175.0000000
	FPCamPos=(X=-27.0000000,Y=0.0000000,Z=26.0000000)
	TPCamDistance=450.0000000
	TPCamLookat=(X=-200.0000000,Y=0.0000000,Z=220.0000000)
	DriverDamageMult=0.0000000
	HUDOverlayClass=Class'Onslaught.ONSManualGunOverlay'
	HUDOverlayOffset=(X=60.0000000,Y=0.0000000,Z=-25.0000000)
	HUDOverlayFOV=45.0000000
	HealthMax=450.0000000
	Health=450
	StaticMesh=StaticMesh'ONSDeadVehicles-SM.MANUALbaseGunDEAD'
	Mesh=SkeletalMesh'ONSWeapons-A.NewManualGun'
	bPathColliding=true
}
