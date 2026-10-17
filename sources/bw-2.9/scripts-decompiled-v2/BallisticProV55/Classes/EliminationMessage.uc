class EliminationMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string GetReady;
var localized string NoWin;
var localized string TimeLimit;
var localized string RedMessages[6];
var localized string BlueMessages[6];

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x3A
	if(Switch < 100)
	{
		P.PlayBeepSound();
	}
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x1F
	if(Switch >= 110)
	{
		return default.BlueMessages[Switch - 110];		
	}
	else
	{
		// End:0x3E
		if(Switch >= 100)
		{
			return default.RedMessages[Switch - 100];			
		}
		else
		{
			// End:0x53
			if(Switch == 95)
			{
				return default.NoWin;				
			}
			else
			{
				// End:0x65
				if(Switch == 96)
				{
					return default.TimeLimit;
				}
			}
		}
	}
	return default.GetReady $ string(Switch);
	//return;	
}

static function bool IsConsoleMessage(int Switch)
{
	// End:0x0E
	if(Switch < 100)
	{
		return false;
	}
	return true;
	//return;	
}

defaultproperties
{
	GetReady="Get ready..."
	NoWin="None are left alive on the field of battle!"
	TimeLimit="This battle has gone on long enough!"
	RedMessages[0]="The Red legion mercilessly blasted all enemies out of their way!"
	RedMessages[1]="The Red force pounded their way ahead!"
	RedMessages[2]="The Red fighters tore through enemy ranks to take the lead!"
	RedMessages[3]="The Red zealots won't let the enemy lead!"
	RedMessages[4]="The Red dogs still try to harass their enemy!"
	RedMessages[5]="The Red scum pitifully crawled away from defeat!"
	BlueMessages[0]="The Blue army effortlessly subdued their pitiful enemies!"
	BlueMessages[1]="The Blue soldiers fight their way ahead!"
	BlueMessages[2]="The Blue fighters pushed through enemy defences to take the lead!"
	BlueMessages[3]="The Blue zealots refuse to fall back!"
	BlueMessages[4]="The Blue jackals snap at the heels of their enemy!"
	BlueMessages[5]="The Blue worms shamefully snaked away from defeat!"
	Lifetime=5
	DrawColor=(R=32,G=64,B=255,A=255)
	PosY=0.2000000
}
