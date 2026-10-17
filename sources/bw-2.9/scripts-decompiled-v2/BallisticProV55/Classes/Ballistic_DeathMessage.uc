class Ballistic_DeathMessage extends xDeathMessage
	config(User)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var Color TextColor;
var Color DMColor;
var string Red;
var string Blue;
var string Text;
var string DMC;

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
	return default.TextColor;
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local string KillerName, VictimName;

	// End:0x13
	if(Class<DamageType>(OptionalObject) == none)
	{
		return "";
	}
	// End:0x99
	if(default.Red == "")
	{
		default.Red = Class'UnrealGame.DMStatsScreen'.static.MakeColorCode(Class'UnrealGame.SayMessagePlus'.default.RedTeamColor);
		default.Blue = Class'UnrealGame.DMStatsScreen'.static.MakeColorCode(Class'UnrealGame.SayMessagePlus'.default.BlueTeamColor);
		default.Text = Class'UnrealGame.DMStatsScreen'.static.MakeColorCode(default.TextColor);
		default.DMC = Class'UnrealGame.DMStatsScreen'.static.MakeColorCode(default.DMColor);
	}
	// End:0xC0
	if(RelatedPRI_2 == none)
	{
		VictimName = (default.DMC $ default.SomeoneString) $ default.Text;		
	}
	else
	{
		// End:0xF9
		if(RelatedPRI_2.Team == none)
		{
			VictimName = (default.DMC $ RelatedPRI_2.PlayerName) $ default.Text;			
		}
		else
		{
			// End:0x13B
			if(RelatedPRI_2.Team.TeamIndex == 0)
			{
				VictimName = (default.Red $ RelatedPRI_2.PlayerName) $ default.Text;				
			}
			else
			{
				VictimName = (default.Blue $ RelatedPRI_2.PlayerName) $ default.Text;
			}
		}
	}
	// End:0x19B
	if(Switch == 1)
	{
		return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, Class<DamageType>(OptionalObject).static.SuicideMessage(RelatedPRI_2));
	}
	// End:0x1C2
	if(RelatedPRI_1 == none)
	{
		KillerName = (default.DMC $ default.SomeoneString) $ default.Text;		
	}
	else
	{
		// End:0x1FB
		if(RelatedPRI_2.Team == none)
		{
			KillerName = (default.DMC $ RelatedPRI_1.PlayerName) $ default.Text;			
		}
		else
		{
			// End:0x23D
			if(RelatedPRI_1.Team.TeamIndex == 0)
			{
				KillerName = (default.Red $ RelatedPRI_1.PlayerName) $ default.Text;				
			}
			else
			{
				KillerName = (default.Blue $ RelatedPRI_1.PlayerName) $ default.Text;
			}
		}
	}
	// End:0x2D0
	if(((Switch == 3) && Class<BallisticDamageType>(OptionalObject) != none) && Class'BCoreProV55.BallisticDamageType'.default.bSimpleDeathMessages)
	{
		return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, default.Text $ Class<BallisticDamageType>(OptionalObject).static.PeneDeathMessage(RelatedPRI_1, RelatedPRI_2));
	}
	// End:0x341
	if(((Switch == 2) && Class<BallisticDamageType>(OptionalObject) != none) && Class'BCoreProV55.BallisticDamageType'.default.bSimpleDeathMessages)
	{
		return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, default.Text $ Class<BallisticDamageType>(OptionalObject).static.ScopedDeathMessage(RelatedPRI_1, RelatedPRI_2));
	}
	return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, default.Text $ Class<DamageType>(OptionalObject).static.DeathMessage(RelatedPRI_1, RelatedPRI_2));
	//return;	
}

defaultproperties
{
	TextColor=(R=210,G=210,B=210,A=255)
	DMColor=(R=255,G=255,B=0,A=255)
}
