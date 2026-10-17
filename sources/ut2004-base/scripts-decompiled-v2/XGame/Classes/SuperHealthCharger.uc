class SuperHealthCharger extends xPickUpBase;

function PostBeginPlay()
{
	super.PostBeginPlay();
	SetLocation(Location + vect(0.0000000, 0.0000000, -1.0000000));
	//return;	
}

defaultproperties
{
	PowerUp=Class'XPickups.SuperHealthPack'
	SpawnHeight=60.0000000
	bDelayedSpawn=true
	NewStaticMesh=StaticMesh'2K4chargerMESHES.ChargerMeshes.HealthChargerMESH-DS'
	NewPrePivot=(X=0.0000000,Y=0.0000000,Z=2.7500000)
	NewDrawScale=0.7000000
	DrawType=8
	StaticMesh=StaticMesh'XGame_rc.HealthChargerMesh'
	Texture=none
	DrawScale=0.8000000
}
