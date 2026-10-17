class IP_Adrenaline extends TournamentPickUp;

var() float AdrenalineAmount;

function float DetourWeight(Pawn Other, float PathWeight)
{
	// End:0x23
	if(!Other.Controller.NeedsAdrenaline())
	{
		return 0.0000000;
	}
	return MaxDesireability;
	//return;	
}

event float BotDesireability(Pawn Bot)
{
	// End:0x21
	if(Bot.Controller.bHuntPlayer)
	{
		return 0.0000000;
	}
	// End:0x44
	if(!Bot.Controller.NeedsAdrenaline())
	{
		return 0.0000000;
	}
	return MaxDesireability;
	//return;	
}

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

		// End:0x4C
		if(ValidTouch(Other))
		{
			P = Pawn(Other);
			P.Controller.AwardAdrenaline(AdrenalineAmount);
			AnnouncePickup(P);
			SetRespawn();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	AdrenalineAmount=3.0000000
	MaxDesireability=0.3000000
	bAmbientGlow=false
	RespawnTime=30.0000000
	PickupMessage="Adrenaline +3"
	PickupSound=Sound'BW_Core_WeaponSound.Health.AdrenalinPickup'
	PickupForce="AdrenelinPickup"
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Health.A-Pod'
	DrawScale=0.1500000
	TransientSoundRadius=64.0000000
	CollisionRadius=8.0000000
	CollisionHeight=8.5000000
	Mass=10.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
