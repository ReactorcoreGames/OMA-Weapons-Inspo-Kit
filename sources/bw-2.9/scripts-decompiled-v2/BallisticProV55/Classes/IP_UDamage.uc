class IP_UDamage extends TournamentPickUp;

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
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
	bAmbientGlow=false
	bPredictRespawns=true
	RespawnTime=90.0000000
	PickupMessage="You got the Damage Amplifier."
	PickupSound=Sound'BW_Core_WeaponSound.Udamage.UDamagePickup'
	PickupForce="UDamagePickup"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Misc.U-Damage'
	DrawScale=0.6000000
	TransientSoundVolume=0.6000000
	TransientSoundRadius=128.0000000
	CollisionRadius=16.0000000
	CollisionHeight=28.0000000
	Mass=10.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
