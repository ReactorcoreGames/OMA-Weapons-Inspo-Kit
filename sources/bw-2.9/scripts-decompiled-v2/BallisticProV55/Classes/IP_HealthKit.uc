class IP_HealthKit extends TournamentHealth;

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
	//return;	
}

defaultproperties
{
	HealingAmount=35
	bAmbientGlow=false
	PickupMessage="You picked up a Health Kit +"
	PickupSound=Sound'BW_Core_WeaponSound.Health.HealthKitPickup'
	PickupForce="HealthPack"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Health.HealthKit'
	AmbientGlow=0
	ScaleGlow=0.6000000
	TransientSoundVolume=0.7000000
	TransientSoundRadius=64.0000000
	CollisionRadius=16.0000000
	CollisionHeight=6.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
