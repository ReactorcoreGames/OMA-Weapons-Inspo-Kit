class BallisticWeaponPickupMessage extends PickupMessagePlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string SlotDescriptions[11];

static function int GetFontSize(int Switch, PlayerReplicationInfo RelatedPRI1, PlayerReplicationInfo RelatedPRI2, PlayerReplicationInfo LocalPlayer)
{
	return default.FontSize;
	//return;	
}

static function string GetRelatedString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return GetString(Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	return "You can't carry any more weapons.";
	//return;	
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x75
	if(BallisticWeaponPickup(OptionalObject) != none)
	{
		// End:0x4A
		if(P.Level.TimeSeconds < (BallisticWeaponPickup(OptionalObject).LastBlockNotificationTime + float(2)))
		{
			return;			
		}
		else
		{
			BallisticWeaponPickup(OptionalObject).LastBlockNotificationTime = P.Level.TimeSeconds;
		}
	}
	super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	//return;	
}

defaultproperties
{
	StackMode=2
	PosY=0.7300000
}
