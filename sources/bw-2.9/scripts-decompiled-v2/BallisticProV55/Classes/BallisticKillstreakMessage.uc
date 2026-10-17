class BallisticKillstreakMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Sound StreakSound;
var Sound DonationSound;

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
	// End:0x33
	if(Switch < 0)
	{
		return ("Donation Level" @ string(-Switch)) @ "Received";
	}
	return ("Level" @ string(Switch)) @ "Killstreak Available";
	//return;	
}

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x49
	if(Switch < 0)
	{
		P.ClientPlaySound(default.DonationSound, true, 3.0000000, 5);		
	}
	else
	{
		P.ClientPlaySound(default.StreakSound, true, 3.0000000, 5);
	}
	//return;	
}

defaultproperties
{
	StreakSound=Sound'GameSounds.Fanfares.UT2K3Fanfare08'
	DonationSound=Sound'GameSounds.OtherFanfares.LadderOpened'
	DrawColor=(R=255,G=60,B=0,A=255)
}
