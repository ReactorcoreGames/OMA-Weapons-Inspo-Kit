class ONSOnslaughtMessage extends CriticalEventPlus
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(Message) localized string RedTeamDominatesString;
var(Message) localized string BlueTeamDominatesString;
var(Message) localized string RedTeamPowerCoreString;
var(Message) localized string BlueTeamPowerCoreString;
var(Message) localized string VehicleLockedString;
var(Message) localized string InvincibleCoreString;
var(Message) localized string UnattainableNodeString;
var(Message) localized string RedPowerCoreAttackedString;
var(Message) localized string BluePowerCoreAttackedString;
var(Message) localized string RedPowerNodeAttackedString;
var(Message) localized string BluePowerNodeAttackedString;
var(Message) localized string InWayOfVehicleSpawnString;
var(Message) localized string MissileLockOnString;
var(Message) localized string UnpoweredString;
var(Message) localized string RedPowerCoreDestroyedString;
var(Message) localized string BluePowerCoreDestroyedString;
var(Message) localized string RedPowerNodeDestroyedString;
var(Message) localized string BluePowerNodeDestroyedString;
var(Message) localized string RedPowerCoreCriticalString;
var(Message) localized string BluePowerCoreCriticalString;
var(Message) localized string PressUseToTeleportString;
var(Message) localized string RedPowerCoreVulnerableString;
var(Message) localized string BluePowerCoreVulnerableString;
var(Message) localized string RedPowerNodeUnderConstructionString;
var(Message) localized string BluePowerNodeUnderConstructionString;
var(Message) localized string RedPowerCoreDamagedString;
var(Message) localized string BluePowerCoreDamagedString;
var(Message) localized string RedPowerNodeSeveredString;
var(Message) localized string BluePowerNodeSeveredString;
var(Message) localized string PowerCoresAreDrainingString;
var(Message) localized string UnhealablePowerCoreString;
var(Message) localized string AvrilLockOnString;
var(Message) localized string CameraDeploy;
var(Message) localized string MoveReticle;
var(Message) localized string SPMAAcquiredString;
var name MessageAnnouncements[35];
var Sound VictorySound;
var Color RedColor;
var Color YellowColor;

static simulated function ClientReceive(PlayerController P, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	// End:0x14
	if(P.bViewingMatineeCinematic)
	{
		return;
	}
	super(LocalMessage).ClientReceive(P, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
	// End:0xA8
	if(ONSPowerCore(OptionalObject) != none)
	{
		// End:0x7D
		if(P.Level.TimeSeconds < (ONSPowerCore(OptionalObject).LastAttackAnnouncementTime + float(10)))
		{
			return;			
		}
		else
		{
			ONSPowerCore(OptionalObject).LastAttackAnnouncementTime = P.Level.TimeSeconds;
		}
	}
	// End:0xDA
	if(default.MessageAnnouncements[Switch] != 'None')
	{
		P.PlayStatusAnnouncement(default.MessageAnnouncements[Switch], 2, true);
	}
	// End:0x14D
	if(((P.PlayerReplicationInfo != none) && P.PlayerReplicationInfo.Team != none) && P.PlayerReplicationInfo.Team.TeamIndex == Switch)
	{
		P.ClientPlaySound(default.VictorySound);
	}
	//return;	
}

static function string GetString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
	switch(Switch)
	{
		// End:0x14
		case 0:
			return default.RedTeamDominatesString;
			// End:0x1F2
			break;
		// End:0x21
		case 1:
			return default.BlueTeamDominatesString;
			// End:0x1F2
			break;
		// End:0x2F
		case 2:
			return default.RedTeamPowerCoreString;
			// End:0x1F2
			break;
		// End:0x3D
		case 3:
			return default.BlueTeamPowerCoreString;
			// End:0x1F2
			break;
		// End:0x4B
		case 4:
			return default.VehicleLockedString;
			// End:0x1F2
			break;
		// End:0x59
		case 5:
			return default.InvincibleCoreString;
			// End:0x1F2
			break;
		// End:0x67
		case 6:
			return default.UnattainableNodeString;
			// End:0x1F2
			break;
		// End:0x75
		case 7:
			return default.RedPowerCoreAttackedString;
			// End:0x1F2
			break;
		// End:0x83
		case 8:
			return default.BluePowerCoreAttackedString;
			// End:0x1F2
			break;
		// End:0x91
		case 9:
			return default.RedPowerNodeAttackedString;
			// End:0x1F2
			break;
		// End:0x9F
		case 10:
			return default.BluePowerNodeAttackedString;
			// End:0x1F2
			break;
		// End:0xAD
		case 11:
			return default.InWayOfVehicleSpawnString;
			// End:0x1F2
			break;
		// End:0xBB
		case 12:
			return default.MissileLockOnString;
			// End:0x1F2
			break;
		// End:0xC9
		case 13:
			return default.UnpoweredString;
			// End:0x1F2
			break;
		// End:0xD7
		case 14:
			return default.RedPowerCoreDestroyedString;
			// End:0x1F2
			break;
		// End:0xE5
		case 15:
			return default.BluePowerCoreDestroyedString;
			// End:0x1F2
			break;
		// End:0xF3
		case 16:
			return default.RedPowerNodeDestroyedString;
			// End:0x1F2
			break;
		// End:0x101
		case 17:
			return default.BluePowerNodeDestroyedString;
			// End:0x1F2
			break;
		// End:0x10F
		case 18:
			return default.RedPowerCoreCriticalString;
			// End:0x1F2
			break;
		// End:0x11D
		case 19:
			return default.BluePowerCoreCriticalString;
			// End:0x1F2
			break;
		// End:0x12B
		case 20:
			return default.RedPowerCoreVulnerableString;
			// End:0x1F2
			break;
		// End:0x139
		case 21:
			return default.BluePowerCoreVulnerableString;
			// End:0x1F2
			break;
		// End:0x147
		case 22:
			return default.PressUseToTeleportString;
			// End:0x1F2
			break;
		// End:0x155
		case 23:
			return default.RedPowerNodeUnderConstructionString;
			// End:0x1F2
			break;
		// End:0x163
		case 24:
			return default.BluePowerNodeUnderConstructionString;
			// End:0x1F2
			break;
		// End:0x171
		case 25:
			return default.RedPowerCoreDamagedString;
			// End:0x1F2
			break;
		// End:0x17F
		case 26:
			return default.BluePowerCoreDamagedString;
			// End:0x1F2
			break;
		// End:0x18D
		case 27:
			return default.RedPowerNodeSeveredString;
			// End:0x1F2
			break;
		// End:0x19B
		case 28:
			return default.BluePowerNodeSeveredString;
			// End:0x1F2
			break;
		// End:0x1A9
		case 29:
			return default.PowerCoresAreDrainingString;
			// End:0x1F2
			break;
		// End:0x1B7
		case 30:
			return default.UnhealablePowerCoreString;
			// End:0x1F2
			break;
		// End:0x1C5
		case 31:
			return default.AvrilLockOnString;
			// End:0x1F2
			break;
		// End:0x1D3
		case 32:
			return default.SPMAAcquiredString;
			// End:0x1F2
			break;
		// End:0x1E1
		case 33:
			return default.MoveReticle;
			// End:0x1F2
			break;
		// End:0x1EF
		case 34:
			return default.CameraDeploy;
			// End:0x1F2
			break;
		// End:0xFFFF
		default:
			break;
	}
	return "";
	//return;	
}

static function Color GetColor(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
	// End:0x5B
	if(((((Switch > 6) && Switch < 11) || Switch == 12) || (Switch > 17) && Switch < 22) || Switch > 24)
	{
		return default.RedColor;		
	}
	else
	{
		// End:0x70
		if(Switch == 11)
		{
			return default.YellowColor;			
		}
		else
		{
			return default.DrawColor;
		}
	}
	//return;	
}

static function GetPos(int Switch, out Object.EDrawPivot OutDrawPivot, out LocalMessage.EStackMode OutStackMode, out float OutPosX, out float OutPosY)
{
	super(LocalMessage).GetPos(Switch, OutDrawPivot, OutStackMode, OutPosX, OutPosY);
	// End:0x55
	if(((Switch == 12) || Switch == 31) || Switch == 32)
	{
		OutPosY = 0.7500000;		
	}
	else
	{
		// End:0x6F
		if(Switch == 29)
		{
			OutPosY = 0.9000000;			
		}
		else
		{
			// End:0x86
			if(Switch == 30)
			{
				OutPosY = 0.3000000;
			}
		}
	}
	//return;	
}

static function float GetLifeTime(int Switch)
{
	// End:0x12
	if(Switch == 29)
	{
		return 4.0000000;
	}
	return float(default.Lifetime);
	//return;	
}

static function bool IsConsoleMessage(int Switch)
{
	// End:0x62
	if((((Switch < 5) || (Switch > 12) && Switch < 18) || ((Switch > 19) && Switch < 24) && Switch != 22) || Switch > 25)
	{
		return true;
	}
	return false;
	//return;	
}

defaultproperties
{
	RedTeamDominatesString="Red Team Achieves Victory!"
	BlueTeamDominatesString="Blue Team Achieves Victory!"
	RedTeamPowerCoreString="Red Team PowerNode Constructed!"
	BlueTeamPowerCoreString="Blue Team PowerNode Constructed!"
	VehicleLockedString="Vehicle is Locked!"
	InvincibleCoreString="You Are Unable To Damage Unlinked PowerNodes!"
	UnattainableNodeString="You Are Unable To Obtain Unlinked PowerNodes!"
	RedPowerCoreAttackedString="Red Team PowerCore is under Attack!"
	BluePowerCoreAttackedString="Blue Team PowerCore is under Attack!"
	RedPowerNodeAttackedString="Red Team PowerNode is under Attack!"
	BluePowerNodeAttackedString="Blue Team PowerNode is under Attack!"
	InWayOfVehicleSpawnString="You are in the way of a vehicle spawning!"
	MissileLockOnString="Missile Lock-On!"
	UnpoweredString="Turret is Unpowered!"
	RedPowerCoreDestroyedString="Red PowerCore Destroyed"
	BluePowerCoreDestroyedString="Blue PowerCore Destroyed"
	RedPowerNodeDestroyedString="Red PowerNode Destroyed"
	BluePowerNodeDestroyedString="Blue PowerNode Destroyed"
	RedPowerCoreCriticalString="Red PowerCore is Critical!"
	BluePowerCoreCriticalString="Blue PowerCore is Critical!"
	PressUseToTeleportString="Press Use to teleport to another node"
	RedPowerCoreVulnerableString="Red PowerCore is Vulnerable!"
	BluePowerCoreVulnerableString="Blue PowerCore is Vulnerable!"
	RedPowerNodeUnderConstructionString="Red PowerNode under Construction!"
	BluePowerNodeUnderConstructionString="Blue PowerNode under Construction!"
	RedPowerCoreDamagedString="Red PowerCore is at 50%!"
	BluePowerCoreDamagedString="Blue PowerCore is at 50%!"
	RedPowerNodeSeveredString="Red PowerNode Isolated!"
	BluePowerNodeSeveredString="Blue PowerNode Isolated!"
	PowerCoresAreDrainingString="PowerCores are draining!"
	UnhealablePowerCoreString="You can't heal your PowerCore!"
	AvrilLockOnString="Incoming Heat-Seeking Missile!"
	CameraDeploy="Press Alt-Fire to deploy camera!"
	MoveReticle="Use Forward and Strafe to Aim Reticle"
	SPMAAcquiredString="SPMA Acquired"
	MessageAnnouncements[7]="Red_Powercore_under_attack"
	MessageAnnouncements[8]="Blue_Powercore_under_attack"
	MessageAnnouncements[14]="Red_Powercore_destroyed"
	MessageAnnouncements[15]="Blue_Powercore_destroyed"
	MessageAnnouncements[16]="Red_powernode_destroyed"
	MessageAnnouncements[17]="Blue_powernode_destroyed"
	MessageAnnouncements[18]="Red_Powercore_critical"
	MessageAnnouncements[19]="Blue_Powercore_critical"
	MessageAnnouncements[20]="Red_PowerCore_vulnerable"
	MessageAnnouncements[21]="Blue_Powercore_vulnerable"
	MessageAnnouncements[23]="Red_powernode_under_construction"
	MessageAnnouncements[24]="Blue_powernode_under_construction"
	MessageAnnouncements[25]="Red_Powercore_damaged"
	MessageAnnouncements[26]="Blue_Powercore_damaged"
	MessageAnnouncements[27]="Red_powernode_isolated"
	MessageAnnouncements[28]="Blue_powernode_isolated"
	VictorySound=Sound'GameSounds.Fanfares.UT2K3Fanfare04'
	RedColor=(R=255,G=0,B=0,A=255)
	YellowColor=(R=255,G=255,B=0,A=255)
	bIsUnique=false
	bIsPartiallyUnique=true
	Lifetime=2
	StackMode=2
	PosY=0.1000000
}
