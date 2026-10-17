class CTFMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string ReturnBlue;
var(Message) localized string ReturnRed;
var(Message) localized string ReturnedBlue;
var(Message) localized string ReturnedRed;
var(Message) localized string CaptureBlue;
var(Message) localized string CaptureRed;
var(Message) localized string DroppedBlue;
var(Message) localized string DroppedRed;
var(Message) localized string HasBlue;
var(Message) localized string HasRed;
var Sound ReturnSounds[2];
var Sound DroppedSounds[2];
var Sound TakenSounds[2];
var Sound Riffs[3];
var name ReturnSoundNames[2];
var name DroppedSoundNames[2];
var name TakenSoundNames[2];

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x31
	if(TeamInfo(OptionalObject) == none)
	{
		return;
	}
	switch(Switch)
	{
		// End:0x58
		case 0:
			P.ClientPlaySound(default.Riffs[Rand(3)]);
			// End:0x102
			break;
		// End:0x5C
		case 1:
		// End:0x61
		case 3:
		// End:0x94
		case 5:
			P.PlayStatusAnnouncement(default.ReturnSoundNames[TeamInfo(OptionalObject).TeamIndex], 2, true);
			// End:0x102
			break;
		// End:0xC7
		case 2:
			P.PlayStatusAnnouncement(default.DroppedSoundNames[TeamInfo(OptionalObject).TeamIndex], 2, true);
			// End:0x102
			break;
		// End:0xCC
		case 4:
		// End:0xFF
		case 6:
			P.PlayStatusAnnouncement(default.TakenSoundNames[TeamInfo(OptionalObject).TeamIndex], 2, true);
			// End:0x102
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x13
	if(TeamInfo(OptionalObject) == none)
	{
		return "";
	}
	switch(Switch)
	{
		// End:0x77
		case 0:
			// End:0x2C
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			// End:0x5E
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return RelatedPRI_1.PlayerName @ default.CaptureRed;				
			}
			else
			{
				return RelatedPRI_1.PlayerName @ default.CaptureBlue;
			}
			// End:0x276
			break;
		// End:0xF9
		case 1:
			// End:0xAE
			if(RelatedPRI_1 == none)
			{
				// End:0xA8
				if(TeamInfo(OptionalObject).TeamIndex == 0)
				{
					return default.ReturnedRed;					
				}
				else
				{
					return default.ReturnedBlue;
				}
			}
			// End:0xE0
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return RelatedPRI_1.PlayerName @ default.ReturnRed;				
			}
			else
			{
				return RelatedPRI_1.PlayerName @ default.ReturnBlue;
			}
			// End:0x276
			break;
		// End:0x157
		case 2:
			// End:0x10C
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			// End:0x13E
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return RelatedPRI_1.PlayerName @ default.DroppedRed;				
			}
			else
			{
				return RelatedPRI_1.PlayerName @ default.DroppedBlue;
			}
			// End:0x276
			break;
		// End:0x187
		case 3:
			// End:0x17E
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return default.ReturnedRed;				
			}
			else
			{
				return default.ReturnedBlue;
			}
			// End:0x276
			break;
		// End:0x1E5
		case 4:
			// End:0x19A
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			// End:0x1CC
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return RelatedPRI_1.PlayerName @ default.HasRed;				
			}
			else
			{
				return RelatedPRI_1.PlayerName @ default.HasBlue;
			}
			// End:0x276
			break;
		// End:0x215
		case 5:
			// End:0x20C
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return default.ReturnedRed;				
			}
			else
			{
				return default.ReturnedBlue;
			}
			// End:0x276
			break;
		// End:0x273
		case 6:
			// End:0x228
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			// End:0x25A
			if(TeamInfo(OptionalObject).TeamIndex == 0)
			{
				return RelatedPRI_1.PlayerName @ default.HasRed;				
			}
			else
			{
				return RelatedPRI_1.PlayerName @ default.HasBlue;
			}
			// End:0x276
			break;
		// End:0xFFFF
		default:
			break;
	}
	return "";
	//return;	
}

defaultproperties
{
	ReturnBlue="returned the blue flag!"
	ReturnRed="returned the red flag!"
	ReturnedBlue="The blue flag was returned!"
	ReturnedRed="The red flag was returned!"
	CaptureBlue="captured the blue flag!"
	CaptureRed="captured the red flag!"
	DroppedBlue="dropped the blue flag!"
	DroppedRed="dropped the red flag!"
	HasBlue="took the blue flag!"
	HasRed="took the red flag!"
	Riffs[0]=Sound'GameSounds.Fanfares.UT2K3Fanfare01'
	Riffs[1]=Sound'GameSounds.Fanfares.UT2K3Fanfare04'
	Riffs[2]=Sound'GameSounds.Fanfares.UT2K3Fanfare06'
	ReturnSoundNames[0]="Red_Flag_Returned"
	ReturnSoundNames[1]="Blue_Flag_Returned"
	DroppedSoundNames[0]="Red_Flag_Dropped"
	DroppedSoundNames[1]="Blue_Flag_Dropped"
	TakenSoundNames[0]="Red_Flag_Taken"
	TakenSoundNames[1]="Blue_Flag_Taken"
	StackMode=2
	PosY=0.1000000
}
