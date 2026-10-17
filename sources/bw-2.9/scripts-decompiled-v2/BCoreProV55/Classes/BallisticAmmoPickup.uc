class BallisticAmmoPickup extends Ammo;

var float ChangeTime;
var int ReplacementsIndex;
//var delegate<OnItemChange> __OnItemChange__Delegate;
//var delegate<OnItemPickedUp> __OnItemPickedUp__Delegate;

delegate OnItemChange(Pickup Pickup)
{
	//return;	
}

delegate OnItemPickedUp(Pickup Pickup)
{
	//return;	
}

simulated event Tick(float dt)
{
	// End:0x49
	if(((ChangeTime > float(0)) && Level.TimeSeconds > ChangeTime) && IsInState('Sleeping') || !PlayerCanSeeMe())
	{
		OnItemChange(self);
	}
	super(Actor).Tick(dt);
	//return;	
}

function Inventory SpawnCopy(Pawn Other)
{
	// End:0x16
	if(!bDropped)
	{
		OnItemPickedUp(self);
	}
	return super.SpawnCopy(Other);
	//return;	
}

function AnnouncePickup(Pawn Receiver)
{
	Receiver.HandlePickup(self);
	PlaySound(PickupSound, 3, TransientSoundVolume,, TransientSoundRadius);
	//return;	
}

event PreBeginPlay()
{
	// End:0x55
	if((!bGameRelevant && int(Level.NetMode) != int(NM_Client)) && !Level.Game.BaseMutator.CheckRelevance(self))
	{
		Destroy();		
	}
	else
	{
		// End:0x8B
		if((int(Level.DetailMode) == int(0)) && CullDistance == default.CullDistance)
		{
			CullDistance *= 0.8000000;
		}
	}
	//return;	
}

defaultproperties
{
	ReplacementsIndex=-1
	AmmoAmount=30
	MaxDesireability=0.3200000
	InventoryType=Class'BCoreProV55.BallisticAmmo'
	PickupMessage="You picked up some Ballistic ammo"
	PickupForce="FlakAmmoPickup"
	DrawType=8
	AmbientGlow=0
	TransientSoundVolume=0.7000000
	TransientSoundRadius=64.0000000
	MessageClass=Class'BCoreProV55.BallisticPickupMessage'
}
