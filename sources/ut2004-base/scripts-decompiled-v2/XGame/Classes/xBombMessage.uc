class xBombMessage extends CriticalEventPlus
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
	// End:0x25
	if(Switch == 3)
	{
		P.PlayStatusAnnouncement(default.ReturnSoundNames[0], 1, true);
	}
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0x56
	if(TeamInfo(OptionalObject) == none)
	{
		return;
	}
	switch(Switch)
	{
		// End:0x7D
		case 0:
			P.ClientPlaySound(default.Riffs[Rand(3)]);
			// End:0x127
			break;
		// End:0x81
		case 1:
		// End:0x86
		case 3:
		// End:0xB9
		case 5:
			P.PlayStatusAnnouncement(default.ReturnSoundNames[TeamInfo(OptionalObject).TeamIndex], 1, true);
			// End:0x127
			break;
		// End:0xEC
		case 2:
			P.PlayStatusAnnouncement(default.DroppedSoundNames[TeamInfo(OptionalObject).TeamIndex], 2, true);
			// End:0x127
			break;
		// End:0xF1
		case 4:
		// End:0x124
		case 6:
			P.PlayStatusAnnouncement(default.TakenSoundNames[TeamInfo(OptionalObject).TeamIndex], 2, true);
			// End:0x127
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	switch(Switch)
	{
		// End:0x32
		case 0:
			// End:0x19
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return RelatedPRI_1.PlayerName @ default.CaptureBlue;
			// End:0x103
			break;
		// End:0x60
		case 1:
			// End:0x47
			if(RelatedPRI_1 == none)
			{
				return default.ReturnedBlue;
			}
			return RelatedPRI_1.PlayerName @ default.ReturnBlue;
			// End:0x103
			break;
		// End:0x8C
		case 2:
			// End:0x73
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return RelatedPRI_1.PlayerName @ default.DroppedBlue;
			// End:0x103
			break;
		// End:0x9A
		case 3:
			return default.ReturnedBlue;
			// End:0x103
			break;
		// End:0xC6
		case 4:
			// End:0xAD
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return RelatedPRI_1.PlayerName @ default.HasBlue;
			// End:0x103
			break;
		// End:0xD4
		case 5:
			return default.ReturnedBlue;
			// End:0x103
			break;
		// End:0x100
		case 6:
			// End:0xE7
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return RelatedPRI_1.PlayerName @ default.HasBlue;
			// End:0x103
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
	ReturnBlue="returns the ball!"
	ReturnRed="returns the ball!"
	ReturnedBlue="The ball was returned!"
	ReturnedRed="The ball was returned!"
	CaptureBlue="scored the goal!"
	CaptureRed="scored the goal!"
	DroppedBlue="dropped the ball!"
	DroppedRed="dropped the ball!"
	HasBlue="has the ball!"
	HasRed="has the ball!"
	Riffs[0]=Sound'GameSounds.Fanfares.UT2K3Fanfare03'
	Riffs[1]=Sound'GameSounds.Fanfares.UT2K3Fanfare07'
	Riffs[2]=Sound'GameSounds.Fanfares.UT2K3Fanfare08'
	ReturnSoundNames[0]="BallReset"
	ReturnSoundNames[1]="BallReset"
	DroppedSoundNames[0]="Red_Pass_Fumbled"
	DroppedSoundNames[1]="Blue_Pass_Fumbled"
	TakenSoundNames[0]="Red_Team_on_Offence"
	TakenSoundNames[1]="Blue_Team_on_Offence"
	StackMode=2
	PosY=0.1000000
}
