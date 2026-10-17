class UDamagePack extends TournamentPickUp;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheStaticMesh(StaticMesh'E_Pickups.General.Udamage');
	L.AddPrecacheMaterial(Shader'XGameShaders.PlayerShaders.WeaponUDamageShader');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Shader'XGameShaders.PlayerShaders.WeaponUDamageShader');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'E_Pickups.General.Udamage');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

auto state Pickup
{
	function Touch(Actor Other)
	{
		local Pawn P;

		// End:0x43
		if(ValidTouch(Other))
		{
			P = Pawn(Other);
			P.EnableUDamage(30.0000000);
			AnnouncePickup(P);
			SetRespawn();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	MaxDesireability=2.0000000
	bPredictRespawns=true
	RespawnTime=90.0000000
	PickupMessage="DOUBLE DAMAGE!"
	PickupSound=Sound'PickupSounds.UDamagePickup'
	PickupForce="UDamagePickup"
	DrawType=8
	StaticMesh=StaticMesh'E_Pickups.General.Udamage'
	Physics=5
	DrawScale=0.9000000
	AmbientGlow=254
	ScaleGlow=0.6000000
	Style=9
	TransientSoundRadius=600.0000000
	CollisionRadius=32.0000000
	CollisionHeight=23.0000000
	Mass=10.0000000
	RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}
