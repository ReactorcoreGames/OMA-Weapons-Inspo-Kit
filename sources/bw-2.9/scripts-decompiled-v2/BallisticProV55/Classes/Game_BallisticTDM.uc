class Game_BallisticTDM extends xTeamGame
	transient
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig string InventoryMode;
var() localized array<localized string> InventoryModes;
var() array<string> InventoryMuts;
var globalconfig string ArenaConfigVar;
var globalconfig string BWConfigVar;
var localized string ModeDisplayText;
var localized string ModeDescText;

static function bool AllowMutator(string MutatorClassName)
{
	local byte bAllow;

	bAllow = Class'BallisticProV55.Game_BallisticDeathmatch'.static.BallisticAllowMutator(MutatorClassName);
	// End:0x2C
	if(int(bAllow) == 1)
	{
		return true;		
	}
	else
	{
		// End:0x3B
		if(int(bAllow) == 0)
		{
			return false;
		}
	}
	return super(GameInfo).AllowMutator(MutatorClassName);
	//return;	
}

function BroadcastDeathMessage(Controller Killer, Controller Other, Class<DamageType> DamageType)
{
	// End:0x40
	if((Killer == Other) || Killer == none)
	{
		BroadcastLocalized(self, DeathMessageClass, 1, none, Other.PlayerReplicationInfo, DamageType);		
	}
	else
	{
		// End:0xD5
		if(((Killer.Pawn != none) && BallisticWeapon(Killer.Pawn.Weapon) != none) && BallisticWeapon(Killer.Pawn.Weapon).bHasPenetrated)
		{
			BroadcastLocalized(self, DeathMessageClass, 3, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, DamageType);			
		}
		else
		{
			// End:0x16A
			if(((Killer.Pawn != none) && BallisticWeapon(Killer.Pawn.Weapon) != none) && BallisticWeapon(Killer.Pawn.Weapon).bScopeView)
			{
				BroadcastLocalized(self, DeathMessageClass, 2, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, DamageType);				
			}
			else
			{
				BroadcastLocalized(self, DeathMessageClass, 0, Killer.PlayerReplicationInfo, Other.PlayerReplicationInfo, DamageType);
			}
		}
	}
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(TeamGame).FillPlayInfo(PlayInfo);
	Class'BallisticProV55.Game_BallisticDeathmatch'.static.FillBallisticPlayInfo(PlayInfo);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	local string S;

	S = Class'BallisticProV55.Game_BallisticDeathmatch'.static.GetBallisticDescriptionText(PropName);
	// End:0x2C
	if(S != "")
	{
		return S;
	}
	return super(TeamGame).GetDescriptionText(PropName);
	//return;	
}

event InitGame(string Options, out string Error)
{
	super(TeamGame).InitGame(Options, Error);
	// End:0x27
	if(InventoryMode != "")
	{
		AddMutator(InventoryMode);
	}
	//return;	
}

event PlayerController Login(string Portal, string Options, out string Error)
{
	local PlayerController PC;

	PC = super(DeathMatch).Login(Portal, Options, Error);
	// End:0x3A
	if(PC != none)
	{
		PC.PawnClass = Class'BallisticProV55.BallisticPawn';
	}
	return PC;
	//return;	
}

function Bot SpawnBot(optional string botname)
{
	local Bot B;

	B = super(DeathMatch).SpawnBot(botname);
	// End:0x30
	if(B != none)
	{
		B.PawnClass = Class'BallisticProV55.BallisticPawn';
	}
	return B;
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints, Hints2;

	// End:0x17
	if(!bThisClassOnly)
	{
		Hints = super(TeamGame).GetAllLoadHints();
	}
	Hints2 = Class'BallisticProV55.Game_BallisticDeathmatch'.static.GetAllLoadHints();
	i = 0;
	J0x33:

	// End:0x65 [Loop If]
	if(i < Hints2.Length)
	{
		Hints[Hints.Length] = Hints2[i];
		i++;
		// [Loop Continue]
		goto J0x33;
	}
	return Hints;
	//return;	
}

defaultproperties
{
	InventoryMode="BallisticProV55.Mut_BallisticDM"
	InventoryModes[0]="Normal"
	InventoryModes[1]="Loadout"
	InventoryModes[2]="Arena"
	InventoryModes[3]="Melee"
	InventoryMuts[0]="BallisticProV55.Mut_BallisticDM"
	InventoryMuts[1]="BallisticProV55.Mut_OutfittingDM"
	InventoryMuts[2]="BallisticProV55.Mut_BallisticArenaDM"
	InventoryMuts[3]="BallisticProV55.Mut_BallisticMeleeDM"
	ModeDisplayText="Pickup Mode"
	ModeDescText="Choose how you want pickups to be added to game"
	DefaultPlayerClassName="BallisticProV55.BallisticPawn"
	DeathMessageClass=Class'BallisticProV55.Ballistic_DeathMessage'
	PlayerControllerClassName="BallisticProV55.BallisticPlayer"
	GameName="BallisticPro: Team DM"
	Description="Standard Team Deathmatch with Ballistic Weapons in Normal, Loadout, Arena or Melee configuration and other features such as Dark Players."
	DecoTextName="BallisticProV55.Game_BallisticTDM"
}
