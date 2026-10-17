class WrenchDispenserTrigger extends Trigger;

struct PlayerTouch
{
	var Pawn TouchedPawn;
	var float NextTouchTime;
};

var array<PlayerTouch> Touchers;
var byte Uses;
var byte MaxUses;

event Touch(Actor Other)
{
	local int i;
	local xPawn Toucher;
	local PlayerTouch NewToucher;
	local Inventory Inv;

	// End:0x2D
	if((xPawn(Other) == none) || xPawn(Other).Controller == none)
	{
		return;
	}
	Toucher = xPawn(Other);
	// End:0x127
	if(Touchers.Length > 0)
	{
		i = 0;
		J0x50:

		// End:0x86 [Loop If]
		if((i < Touchers.Length) && Touchers[i].TouchedPawn != Toucher)
		{
			i++;
			// [Loop Continue]
			goto J0x50;
		}
		// End:0xE3
		if(i < Touchers.Length)
		{
			// End:0xBB
			if(Touchers[i].NextTouchTime > Level.TimeSeconds)
			{
				return;
			}
			Touchers[i].NextTouchTime = Level.TimeSeconds + float(3);			
		}
		else
		{
			NewToucher.TouchedPawn = Toucher;
			NewToucher.NextTouchTime = Level.TimeSeconds + float(3);
			Touchers[Touchers.Length] = NewToucher;
		}		
	}
	else
	{
		NewToucher.TouchedPawn = Toucher;
		NewToucher.NextTouchTime = Level.TimeSeconds + float(3);
		Touchers[Touchers.Length] = NewToucher;
	}
	i = 0;
	Inv = Pawn(Other).Inventory;
	J0x188:

	// End:0x226 [Loop If]
	if((Inv != none) && i < 1000)
	{
		i++;
		// End:0x1FB
		if(((Weapon(Inv) == none) || (BallisticWeapon(Inv) != none) && BallisticWeapon(Inv).bWT_Super) || WrenchWarpDevice(Inv) != none)
		{			
		}
		else
		{
			Weapon(Inv).FillToInitialAmmo();
		}
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x188;
	}
	Owner.PlaySound(Sound'BW_Core_WeaponSound.Ammo.AmmoPackPickup');
	// End:0x272
	if(PlayerController(Toucher.Controller) != none)
	{
		PlayerController(Toucher.Controller).ReceiveLocalizedMessage(Class'BWBP_OP_Pro.AmmoCrateLocalMessage');
	}
	++Uses;
	// End:0x2B2
	if(int(Uses) >= int(MaxUses))
	{
		WrenchAmmoCrate(Owner).bWarpOut = true;
		Owner.GotoState('Destroying');
	}
	//return;	
}

defaultproperties
{
	MaxUses=2
	CollisionRadius=64.0000000
	CollisionHeight=32.0000000
}
