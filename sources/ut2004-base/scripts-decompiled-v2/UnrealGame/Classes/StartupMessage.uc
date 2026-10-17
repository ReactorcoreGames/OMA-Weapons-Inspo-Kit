class StartupMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var localized string Stage[8];
var localized string NotReady;
var localized string SinglePlayer;
var Sound Riff;

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x6C
	if(Switch < 7)
	{
		P.Level.FillPrecacheMaterialsArray(false);
		P.Level.FillPrecacheStaticMeshesArray(false);
		P.PrecacheAnnouncements();
	}
	// End:0x158
	if(((((Switch == 5) && P != none) && P.Level != none) && P.Level.Game != none) && !P.Level.Game.IsA('DeathMatch') || !DeathMatch(P.Level.Game).bQuickStart && !DeathMatch(P.Level.Game).bSkipPlaySound)
	{
		P.PlayStatusAnnouncement('Play', 1, true);		
	}
	else
	{
		// End:0x183
		if((Switch > 1) && Switch < 5)
		{
			P.PlayBeepSound();			
		}
		else
		{
			// End:0x1A3
			if(Switch == 7)
			{
				P.ClientPlaySound(default.Riff);
			}
		}
	}
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	local int i, PlayerCount;
	local GameReplicationInfo GRI;

	// End:0x94
	if((RelatedPRI_1 != none) && int(RelatedPRI_1.Level.NetMode) == int(NM_Standalone))
	{
		// End:0x7F
		if((DeathMatch(RelatedPRI_1.Level.Game) != none) && DeathMatch(RelatedPRI_1.Level.Game).bQuickStart)
		{
			return "";
		}
		// End:0x91
		if(Switch < 2)
		{
			return default.SinglePlayer;
		}		
	}
	else
	{
		// End:0x1DD
		if((Switch == 0) && RelatedPRI_1 != none)
		{
			GRI = RelatedPRI_1.Level.GRI;
			// End:0xDC
			if(GRI == none)
			{
				return default.Stage[0];
			}
			i = 0;
			J0xE3:

			// End:0x194 [Loop If]
			if(i < GRI.PRIArray.Length)
			{
				// End:0x18A
				if(((GRI.PRIArray[i] != none) && !GRI.PRIArray[i].bOnlySpectator) && !GRI.PRIArray[i].bIsSpectator || GRI.PRIArray[i].bWaitingPlayer)
				{
					PlayerCount++;
				}
				i++;
				// [Loop Continue]
				goto J0xE3;
			}
			// End:0x1DA
			if((GRI.MinNetPlayers - PlayerCount) > 0)
			{
				return ((default.Stage[0] @ "(") $ string(GRI.MinNetPlayers - PlayerCount)) $ ")";
			}			
		}
		else
		{
			// End:0x237
			if(Switch == 1)
			{
				// End:0x214
				if((RelatedPRI_1 == none) || !RelatedPRI_1.bWaitingPlayer)
				{
					return default.Stage[0];					
				}
				else
				{
					// End:0x231
					if(RelatedPRI_1.bReadyToPlay)
					{
						return default.Stage[1];						
					}
					else
					{
						return default.NotReady;
					}
				}
			}
		}
	}
	return default.Stage[Switch];
	//return;	
}

defaultproperties
{
	Stage[0]="Waiting for other players."
	Stage[1]="Waiting for ready signals. You are READY."
	Stage[2]="The match is about to begin...3"
	Stage[3]="The match is about to begin...2"
	Stage[4]="The match is about to begin...1"
	Stage[5]="The match has begun!"
	Stage[6]="The match has begun!"
	Stage[7]="OVER TIME!"
	NotReady="You are NOT READY. Press Fire!"
	SinglePlayer="Press FIRE to start!"
	Riff=Sound'GameSounds.Fanfares.UT2K3Fanfare11'
	bIsConsoleMessage=false
	DrawColor=(R=32,G=64,B=255,A=255)
}
