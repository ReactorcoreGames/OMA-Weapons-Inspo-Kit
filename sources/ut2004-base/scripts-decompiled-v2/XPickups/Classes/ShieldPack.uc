class ShieldPack extends ShieldPickup;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheStaticMesh(StaticMesh'E_Pickups.General.RegShield');
	//return;	
}

defaultproperties
{
	ShieldAmount=50
	bPredictRespawns=true
	PickupSound=Sound'PickupSounds.ShieldPack'
	PickupForce="ShieldPack"
	DrawType=8
	StaticMesh=StaticMesh'E_Pickups.General.RegShield'
	Physics=5
	ScaleGlow=0.6000000
	Style=9
	CollisionRadius=32.0000000
	RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}
