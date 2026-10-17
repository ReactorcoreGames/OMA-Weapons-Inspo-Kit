class GameMessage extends LocalMessage
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string SwitchLevelMessage;
var(Message) localized string LeftMessage;
var(Message) localized string FailedTeamMessage;
var(Message) localized string FailedPlaceMessage;
var(Message) localized string FailedSpawnMessage;
var(Message) localized string EnteredMessage;
var(Message) localized string MaxedOutMessage;
var(Message) localized string OvertimeMessage;
var(Message) localized string GlobalNameChange;
var(Message) localized string NewTeamMessage;
var(Message) localized string NewTeamMessageTrailer;
var(Message) localized string NoNameChange;
var(Message) localized string VoteStarted;
var(Message) localized string VotePassed;
var(Message) localized string MustHaveStats;
var(Message) localized string CantBeSpectator;
var(Message) localized string CantBePlayer;
var(Message) localized string BecameSpectator;
var localized string NewPlayerMessage;
var localized string KickWarning;
var localized string NewSpecMessage;
var localized string SpecEnteredMessage;
var localized string SomeoneBecameSpectator;

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	switch(Switch)
	{
		// End:0x14
		case 0:
			return default.OvertimeMessage;
			// End:0x1FE
			break;
		// End:0x42
		case 1:
			// End:0x29
			if(RelatedPRI_1 == none)
			{
				return default.NewPlayerMessage;
			}
			return RelatedPRI_1.PlayerName $ default.EnteredMessage;
			// End:0x1FE
			break;
		// End:0x7E
		case 2:
			// End:0x55
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return (RelatedPRI_1.OldName @ default.GlobalNameChange) @ RelatedPRI_1.PlayerName;
			// End:0x1FE
			break;
		// End:0xD5
		case 3:
			// End:0x91
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			// End:0x9F
			if(OptionalObject == none)
			{
				return "";
			}
			return ((RelatedPRI_1.PlayerName @ default.NewTeamMessage) @ TeamInfo(OptionalObject).GetHumanReadableName()) $ default.NewTeamMessageTrailer;
			// End:0x1FE
			break;
		// End:0x101
		case 4:
			// End:0xE8
			if(RelatedPRI_1 == none)
			{
				return "";
			}
			return RelatedPRI_1.PlayerName $ default.LeftMessage;
			// End:0x1FE
			break;
		// End:0x10F
		case 5:
			return default.SwitchLevelMessage;
			// End:0x1FE
			break;
		// End:0x11D
		case 6:
			return default.FailedTeamMessage;
			// End:0x1FE
			break;
		// End:0x12B
		case 7:
			return default.MaxedOutMessage;
			// End:0x1FE
			break;
		// End:0x139
		case 8:
			return default.NoNameChange;
			// End:0x1FE
			break;
		// End:0x157
		case 9:
			return RelatedPRI_1.PlayerName @ default.VoteStarted;
			// End:0x1FE
			break;
		// End:0x165
		case 10:
			return default.VotePassed;
			// End:0x1FE
			break;
		// End:0x173
		case 11:
			return default.MustHaveStats;
			// End:0x1FE
			break;
		// End:0x181
		case 12:
			return default.CantBeSpectator;
			// End:0x1FE
			break;
		// End:0x18F
		case 13:
			return default.CantBePlayer;
			// End:0x1FE
			break;
		// End:0x1BE
		case 14:
			// End:0x1A5
			if(RelatedPRI_1 == none)
			{
				return default.SomeoneBecameSpectator;
			}
			return RelatedPRI_1.PlayerName @ default.BecameSpectator;
			// End:0x1FE
			break;
		// End:0x1CC
		case 15:
			return default.KickWarning;
			// End:0x1FE
			break;
		// End:0x1FB
		case 16:
			// End:0x1E2
			if(RelatedPRI_1 == none)
			{
				return default.NewSpecMessage;
			}
			return RelatedPRI_1.PlayerName $ default.SpecEnteredMessage;
			// End:0x1FE
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
	SwitchLevelMessage="Switching Levels"
	LeftMessage=" left the game."
	FailedTeamMessage="Could not find team for player"
	FailedPlaceMessage="Could not find a starting spot"
	FailedSpawnMessage="Could not spawn player"
	EnteredMessage=" entered the game."
	MaxedOutMessage="Server is already at capacity."
	OvertimeMessage="Score tied at the end of regulation. Sudden Death Overtime!!!"
	GlobalNameChange="changed name to"
	NewTeamMessage="is now on"
	NoNameChange="Name is already in use."
	VoteStarted="started a vote."
	VotePassed="Vote passed."
	MustHaveStats="Must have stats enabled to join this server."
	CantBeSpectator="Sorry, you cannot become a spectator at this time."
	CantBePlayer="Sorry, you cannot become an active player at this time."
	BecameSpectator="became a spectator."
	NewPlayerMessage="A new player entered the game."
	KickWarning="You are about to be kicked for idling!"
	NewSpecMessage="A spectator entered the game/"
	SpecEnteredMessage=" joined as a spectator."
	SomeoneBecameSpectator="Someone became a spectator."
	bIsSpecial=false
}
