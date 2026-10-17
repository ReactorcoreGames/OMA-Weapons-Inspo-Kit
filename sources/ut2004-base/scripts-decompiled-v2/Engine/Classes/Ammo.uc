class Ammo extends Pickup
	abstract
	native
	placeable;

var() int AmmoAmount;

static simulated function UpdateHUD(HUD H)
{
	H.LastPickupTime = H.Level.TimeSeconds;
	H.LastAmmoPickupTime = H.LastPickupTime;
	//return;	
}

function float DetourWeight(Pawn Other, float PathWeight)
{
	local Weapon W;
	local float desire;

	// End:0x27
	if(Other.Weapon.AIRating >= 0.5000000)
	{
		return 0.0000000;
	}
	// End:0x7E
	foreach Other.__NFUN_326__(Class'Engine.Weapon', W)
	{
		desire = W.DesireAmmo(InventoryType, true);
		// End:0x7D
		if(desire != float(0))
		{			
			return (desire * MaxDesireability) / PathWeight;
		}		
	}	
	return 0.0000000;
	//return;	
}

function float BotDesireability(Pawn Bot)
{
	local Weapon W;
	local float desire;
	local Ammunition M;

	// End:0x21
	if(Bot.Controller.bHuntPlayer)
	{
		return 0.0000000;
	}
	// End:0x71
	foreach Bot.__NFUN_326__(Class'Engine.Weapon', W)
	{
		desire = W.DesireAmmo(InventoryType, false);
		// End:0x70
		if(desire != float(0))
		{			
			return desire * MaxDesireability;
		}		
	}	
	M = Ammunition(Bot.FindInventoryType(InventoryType));
	// End:0xC5
	if((M != none) && M.AmmoAmount >= M.MaxAmmo)
	{
		return -1.0000000;
	}
	return 0.2500000 * MaxDesireability;
	//return;	
}

function Inventory SpawnCopy(Pawn Other)
{
	local Inventory Copy;

	Copy = super.SpawnCopy(Other);
	Ammunition(Copy).AmmoAmount = AmmoAmount;
	return Copy;
	//return;	
}

defaultproperties
{
	MaxDesireability=0.2000000
	RespawnTime=30.0000000
	PickupMessage="You picked up some ammo."
	CullDistance=4000.0000000
	Texture=Texture'Engine.S_Ammo'
	AmbientGlow=128
}
