class HealthCharger extends xPickUpBase;

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetLocation(Location + vect(0.0000000, 0.0000000, -4.0000000));
	//return;	
}

defaultproperties
{
	PowerUp=Class'XPickups.HealthPack'
	SpawnHeight=45.0000000
	NewStaticMesh=StaticMesh'2K4chargerMESHES.ChargerMeshes.HealthChargerMESH-DS'
	NewPrePivot=(X=0.0000000,Y=0.0000000,Z=2.5000000)
	NewDrawScale=0.4500000
	DrawType=8
	StaticMesh=StaticMesh'XGame_rc.HealthChargerMesh'
	Texture=none
	DrawScale=0.5000000
}
