class ItemGameRules extends GameRules
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool OverridePickupQuery(Pawn Other, Pickup Item, out byte bAllowPickup)
{
	bAllowPickup = 0;
	return true;
	//return;	
}

