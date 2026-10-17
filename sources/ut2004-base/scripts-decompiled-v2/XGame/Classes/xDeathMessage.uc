class xDeathMessage extends LocalMessage
	config(User)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string KilledString;
var(Message) localized string SomeoneString;
var config bool bNoConsoleDeathMessages;

static function Color GetConsoleColor(PlayerReplicationInfo RelatedPRI_1)
{
	return Class'Engine.HUD'.default.GreenColor;
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
	// End:0x2C
	if(RelatedPRI_2 == none)
	{
		VictimName = default.SomeoneString;		
	}
	else
	{
		VictimName = RelatedPRI_2.PlayerName;
	}
	// End:0x7E
	if(Switch == 1)
	{
		return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, Class<DamageType>(OptionalObject).static.SuicideMessage(RelatedPRI_2));
	}
	// End:0x97
	if(RelatedPRI_1 == none)
	{
		KillerName = default.SomeoneString;		
	}
	else
	{
		KillerName = RelatedPRI_1.PlayerName;
	}
	return Class'Engine.GameInfo'.static.ParseKillMessage(KillerName, VictimName, Class<DamageType>(OptionalObject).static.DeathMessage(RelatedPRI_1, RelatedPRI_2));
	//return;	
}

static function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x37
	if(Switch == 1)
	{
		// End:0x35
		if(!default.bNoConsoleDeathMessages)
		{
			super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
		return;
	}
	// End:0x2A9
	if((RelatedPRI_1 == P.PlayerReplicationInfo) || (P.PlayerReplicationInfo.bOnlySpectator && Pawn(P.ViewTarget) != none) && Pawn(P.ViewTarget).PlayerReplicationInfo == RelatedPRI_1)
	{
		P.myHUD.LocalizedMessage(default.ChildMessage, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		// End:0x11C
		if(!default.bNoConsoleDeathMessages)
		{
			P.myHUD.LocalizedMessage(default.Class, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
		}
		// End:0x178
		if(int(P.Role) == int(ROLE_Authority))
		{
			// End:0x175
			if(UnrealPlayer(P).MultiKillLevel > 0)
			{
				P.ReceiveLocalizedMessage(Class'XGame.MultiKillMessage', UnrealPlayer(P).MultiKillLevel);
			}			
		}
		else
		{
			// End:0x291
			if(((RelatedPRI_1 != RelatedPRI_2) && RelatedPRI_2 != none) && (RelatedPRI_2.Team == none) || RelatedPRI_1.Team != RelatedPRI_2.Team)
			{
				// End:0x24E
				if(((P.Level.TimeSeconds - UnrealPlayer(P).LastKillTime) < float(4)) && Switch != 1)
				{
					UnrealPlayer(P).MultiKillLevel++;
					P.ReceiveLocalizedMessage(Class'XGame.MultiKillMessage', xPlayer(P).MultiKillLevel);					
				}
				else
				{
					UnrealPlayer(P).MultiKillLevel = 0;
				}
				UnrealPlayer(P).LastKillTime = P.Level.TimeSeconds;				
			}
			else
			{
				UnrealPlayer(P).MultiKillLevel = 0;
			}
		}		
	}
	else
	{
		// End:0x308
		if(RelatedPRI_2 == P.PlayerReplicationInfo)
		{
			P.ReceiveLocalizedMessage(Class'XGame.xVictimMessage', 0, RelatedPRI_1);
			// End:0x305
			if(!default.bNoConsoleDeathMessages)
			{
				super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
			}			
		}
		else
		{
			// End:0x332
			if(!default.bNoConsoleDeathMessages)
			{
				super.ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
			}
		}
	}
	//return;	
}

defaultproperties
{
	KilledString="was killed by"
	SomeoneString="someone"
	bIsSpecial=false
	ChildMessage=Class'XGame.xKillerMessagePlus'
	DrawColor=(R=255,G=0,B=0,A=255)
}
