class MessageTrigger extends Triggers;

enum EMT_MessageType
{
	EMT_Default,                    // 0
	EMT_CriticalEvent,              // 1
	EMT_DeathMessage,               // 2
	EMT_Say,                        // 3
	EMT_TeamSay                     // 4
};

var() MessageTrigger.EMT_MessageType messagetype;
var() localized string Message;
var() byte Team;

event Trigger(Actor Other, Pawn EventInstigator)
{
	local name MsgType;
	local PlayerController P;

	switch(messagetype)
	{
		// End:0x1A
		case 1:
			MsgType = 'CriticalEvent';
			// End:0x64
			break;
		// End:0x2D
		case 2:
			MsgType = 'xDeathMessage';
			// End:0x64
			break;
		// End:0x40
		case 3:
			MsgType = 'SayMessagePlus';
			// End:0x64
			break;
		// End:0x53
		case 4:
			MsgType = 'TeamSayMessagePlus';
			// End:0x64
			break;
		// End:0xFFFF
		default:
			MsgType = 'StringMessagePlus';
			// End:0x64
			break;
			break;
	}
	// End:0xC0
	foreach __NFUN_325__(Class'Engine.PlayerController', P)
	{
		// End:0xBF
		if((P.Player != none) && CheckTeam(P))
		{
			P.TeamMessage(P.PlayerReplicationInfo, Message, MsgType);
		}		
	}	
	//return;	
}

function bool CheckTeam(PlayerController P)
{
	local byte DefendingTeam;

	// End:0x10
	if(int(Team) == 255)
	{
		return true;
	}
	DefendingTeam = byte(Level.Game.GetDefenderNum());
	// End:0x57
	if(int(DefendingTeam) == 255)
	{
		return P.GetTeamNum() == int(Team);
	}
	// End:0x83
	if((int(Team) == 0) && int(DefendingTeam) != P.GetTeamNum())
	{
		return true;
	}
	// End:0xAF
	if((int(Team) == 1) && int(DefendingTeam) == P.GetTeamNum())
	{
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	messagetype=1
	Message="My Message"
	Team=255
}
