class IP_SuperHealthKit extends TournamentHealth;

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
	//return;	
}

defaultproperties
{
	HealingAmount=100
	bSuperHeal=true
	bAmbientGlow=false
	bPredictRespawns=true
	RespawnTime=60.0000000
	PickupMessage="You picked up a Super Health Kit +"
	PickupSound=Sound'BW_Core_WeaponSound.Health.SuperHealthPickup'
	PickupForce="LargeHealthPickup"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Health.SuperHealth'
	DrawScale=0.8000000
	AmbientGlow=0
	ScaleGlow=0.6000000
	TransientSoundVolume=0.6000000
	TransientSoundRadius=64.0000000
	CollisionRadius=16.0000000
	CollisionHeight=22.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
