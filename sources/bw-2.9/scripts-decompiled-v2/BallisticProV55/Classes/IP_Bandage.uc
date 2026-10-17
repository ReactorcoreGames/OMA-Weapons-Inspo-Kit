class IP_Bandage extends TournamentHealth;

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
	//return;	
}

defaultproperties
{
	HealingAmount=5
	bSuperHeal=true
	MaxDesireability=0.3000000
	bAmbientGlow=false
	PickupMessage="You picked up an N-TOV Bandage +"
	PickupSound=Sound'BW_Core_WeaponSound.Health.NTovPickup'
	PickupForce="HealthPack"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Health.Bandage'
	AmbientGlow=0
	ScaleGlow=0.6000000
	TransientSoundRadius=64.0000000
	CollisionRadius=8.0000000
	CollisionHeight=3.5000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
