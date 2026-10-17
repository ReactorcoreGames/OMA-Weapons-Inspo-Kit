class LockedObjective extends ProximityObjective
	hidecategories(Lighting,LightColor,Karma,Force);

var() name KeyTag;
var KeyPickup MyKey;

function FindKey()
{
	// End:0x23
	if((MyKey != none) && !MyKey.bDeleteMe)
	{
		return;
	}
	MyKey = none;
	// End:0x43
	foreach AllActors(Class'UnrealGame.KeyPickup', MyKey, KeyTag)
	{
		// End:0x43
		break;		
	}	
	//return;	
}

function bool TellBotHowToDisable(Bot B)
{
	local KeyInventory k;
	local Controller C;

	k = KeyInventory(B.Pawn.FindInventoryType(Class'UnrealGame.KeyInventory'));
	// End:0x59
	if((k != none) && k.Tag == KeyTag)
	{
		return super.TellBotHowToDisable(B);
	}
	// End:0x13B
	foreach __NFUN_325__(Class'Engine.Controller', C)
	{
		// End:0x13A
		if(((C.PlayerReplicationInfo != none) && C.Pawn != none) && C.PlayerReplicationInfo.Team == B.PlayerReplicationInfo.Team)
		{
			k = KeyInventory(C.Pawn.FindInventoryType(Class'UnrealGame.KeyInventory'));
			// End:0x13A
			if((k != none) && k.Tag == KeyTag)
			{
				B.Squad.TellBotToFollow(B, C);				
				return true;
			}
		}		
	}	
	FindKey();
	// End:0x14F
	if(MyKey == none)
	{
		return false;
	}
	// End:0x1AC
	if(B.actorReachable(MyKey))
	{
		B.GoalString = "almost at " $ string(MyKey);
		B.MoveTarget = MyKey;
		B.SetAttractionState();
		return true;
	}
	B.GoalString = "No path to key " $ string(MyKey);
	// End:0x1F2
	if(!B.FindBestPathToward(MyKey, false, true))
	{
		return false;
	}
	B.GoalString = "Follow path to " $ string(MyKey);
	B.SetAttractionState();
	return true;
	//return;	
}

function bool IsRelevant(Pawn Instigator, bool bAliveCheck)
{
	local KeyInventory k;

	// End:0x5F
	if(Instigator != none)
	{
		k = KeyInventory(Instigator.FindInventoryType(Class'UnrealGame.KeyInventory'));
		// End:0x5F
		if((k != none) && k.Tag == KeyTag)
		{
			k.UnLock(self);
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	KeyTag="KeyPickup"
}
