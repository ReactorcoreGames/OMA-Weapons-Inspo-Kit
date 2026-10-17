class RSDarkHealBlockMessage extends LocalMessage
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

static function string GetString(optional int SwitchNum, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local string EnemyName, AllyName;

	// End:0x22
	if(RelatedPRI_1 == none)
	{
		EnemyName = Class'XGame.xDeathMessage'.default.SomeoneString;		
	}
	else
	{
		EnemyName = RelatedPRI_1.PlayerName;
	}
	// End:0x58
	if(RelatedPRI_2 == none)
	{
		AllyName = Class'XGame.xDeathMessage'.default.SomeoneString;		
	}
	else
	{
		AllyName = RelatedPRI_2.PlayerName;
	}
	switch(SwitchNum)
	{
		// End:0xAB
		case 1:
			return ((EnemyName $ "'s Dark Flames blocked ") $ AllyName) $ "'s heal!";
		// End:0xEE
		case 2:
			return ((EnemyName $ "'s Dark Flames prevent you from healing ") $ AllyName) $ "!";
		// End:0xFFFF
		default:
			return EnemyName $ "'s Dark Flames blocked the heal!";
			break;
	}
	//return;	
}

defaultproperties
{
	bIsUnique=true
	bIsConsoleMessage=false
	bFadeMessage=true
	Lifetime=1
	DrawColor=(R=200,G=25,B=25,A=255)
	StackMode=2
	PosY=0.7750000
}
