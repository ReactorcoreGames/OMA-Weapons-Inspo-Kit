class Game_BallisticDeathmatch extends xDeathMatch
	transient
	config
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const BWHintCount = 21;

var const localized string BallisticGroup;
var globalconfig string InventoryMode;
var() localized array<localized string> InventoryModes;
var() array<string> InventoryMuts;
var globalconfig string ArenaConfigVar;
var globalconfig string BWConfigVar;
var localized string ModeDisplayText;
var localized string ModeDescText;
var localized string ArenaConfigDisplayText;
var localized string ArenaConfigDescText;
var localized string BWConfigDisplayText;
var localized string BWConfigDescText;
var(LoadingHints) private localized string BWHints[21];

function float RatePlayerStart(NavigationPoint N, byte Team, Controller Player)
{
	local PlayerStart P;
	local float Score, dist;
	local Controller OtherPlayer;

	P = PlayerStart(N);
	// End:0x37
	if((P == none) || !P.bEnabled)
	{
		return -10000000.0000000;
	}
	// End:0x54
	if(P.bPrimaryStart)
	{
		Score = 20000.0000000;
	}
	// End:0x83
	if((N == LastStartSpot) || N == LastPlayerStartSpot)
	{
		Score -= 5000.0000000;		
	}
	else
	{
		Score += (float(1000) * FRand());
	}
	OtherPlayer = Level.ControllerList;
	J0xA9:

	// End:0x1EC [Loop If]
	if(OtherPlayer != none)
	{
		// End:0x1D5
		if(OtherPlayer.bIsPlayer && OtherPlayer.Pawn != none)
		{
			// End:0x11B
			if(OtherPlayer.Pawn.Region.Zone == N.Region.Zone)
			{
				Score -= float(100);
			}
			dist = VSize(OtherPlayer.Pawn.Location - N.Location);
			// End:0x192
			if(dist < (OtherPlayer.Pawn.CollisionRadius + OtherPlayer.Pawn.CollisionHeight))
			{
				Score -= float(15000);
			}
			// End:0x1C9
			if(FastTrace(N.Location, OtherPlayer.Pawn.Location))
			{
				dist *= 0.2000000;
			}
			Score += dist;
		}
		OtherPlayer = OtherPlayer.nextController;
		// [Loop Continue]
		goto J0xA9;
	}
	return Score;
	//return;	
}

static function byte BallisticAllowMutator(string MutatorClassName)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x39 [Loop If]
	if(i < default.InventoryMuts.Length)
	{
		// End:0x2F
		if(MutatorClassName ~= default.InventoryMuts[i])
		{
			return 1;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0x58
	if(InStr(MutatorClassName, "Mut_Ballistic") >= 0)
	{
		return 0;
	}
	// End:0x78
	if(InStr(MutatorClassName, "Mut_Outfitting") >= 0)
	{
		return 0;
	}
	// End:0x96
	if(InStr(MutatorClassName, "Mut_Itemizer") >= 0)
	{
		return 0;
	}
	return 2;
	//return;	
}

static function bool AllowMutator(string MutatorClassName)
{
	local byte bAllow;

	bAllow = BallisticAllowMutator(MutatorClassName);
	// End:0x23
	if(int(bAllow) == 1)
	{
		return true;		
	}
	else
	{
		// End:0x32
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

static function FillBallisticPlayInfo(PlayInfo PlayInfo)
{
	local string S;
	local int i;

	i = 0;
	J0x07:

	// End:0x77 [Loop If]
	if(i < default.InventoryMuts.Length)
	{
		// End:0x37
		if(S == "")
		{
			S = default.InventoryMuts[i];			
		}
		else
		{
			S = (S $ ";") $ default.InventoryMuts[i];
		}
		S $= (";" $ default.InventoryModes[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	PlayInfo.AddSetting(default.BallisticGroup, "InventoryMode", default.ModeDisplayText, 0, 1, "Select", S);
	PlayInfo.AddSetting(default.BallisticGroup, "ArenaConfigVar", default.ArenaConfigDisplayText, 60, 2, "Custom", ";;BallisticProV55.BallisticArenaMenu");
	PlayInfo.AddSetting(default.BallisticGroup, "BWConfigVar", default.BWConfigDisplayText, 60, 2, "Custom", ";;BallisticProV55.ConfigMenu_Rules");
	//return;	
}

static function string GetBallisticDescriptionText(string PropName)
{
	switch(PropName)
	{
		// End:0x1F
		case "InventoryMode":
			return default.ModeDescText;
		// End:0x38
		case "ArenaConfigVar":
			return default.ArenaConfigDescText;
		// End:0x4E
		case "BWConfigVar":
			return default.BWConfigDescText;
		// End:0xFFFF
		default:
			return "";
			break;
	}
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(DeathMatch).FillPlayInfo(PlayInfo);
	FillBallisticPlayInfo(PlayInfo);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	local string S;

	S = GetBallisticDescriptionText(PropName);
	// End:0x23
	if(S != "")
	{
		return S;
	}
	return super(DeathMatch).GetDescriptionText(PropName);
	//return;	
}

event InitGame(string Options, out string Error)
{
	super(DeathMatch).InitGame(Options, Error);
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

static function string GetNextLoadHint(string MapName)
{
	local array<string> Hints;

	// End:0x1B
	if(Rand(100) < 90)
	{
		Hints = GetAllLoadHints(true);		
	}
	else
	{
		Hints = GetAllLoadHints();
	}
	// End:0x42
	if(Hints.Length > 0)
	{
		return Hints[Rand(Hints.Length)];
	}
	return "";
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x17
	if(!bThisClassOnly)
	{
		Hints = super(DeathMatch).GetAllLoadHints();
	}
	i = 0;
	J0x1E:

	// End:0x4C [Loop If]
	if(i < 21)
	{
		Hints[Hints.Length] = default.BWHints[i];
		i++;
		// [Loop Continue]
		goto J0x1E;
	}
	return Hints;
	//return;	
}

defaultproperties
{
	BallisticGroup="Ballistic"
	InventoryMode="BallisticProV55.Mut_BallisticDM"
	InventoryModes[0]="Normal"
	InventoryModes[1]="Loadout"
	InventoryModes[2]="Conflict"
	InventoryModes[3]="Arena"
	InventoryModes[4]="Melee"
	InventoryMuts[0]="BallisticProV55.Mut_BallisticDM"
	InventoryMuts[1]="BallisticProV55.Mut_OutfittingDM"
	InventoryMuts[2]="BallisticProV55.Mut_SpatialLoadoutDM"
	InventoryMuts[3]="BallisticProV55.Mut_BallisticArenaDM"
	InventoryMuts[4]="BallisticProV55.Mut_BallisticMeleeDM"
	ModeDisplayText="Inventory Mode"
	ModeDescText="Choose how you want pickups and inventory to be added to game."
	ArenaConfigDisplayText="Configure Arena"
	ArenaConfigDescText="Choose the weapons you want in the match for the Arena inventory mode."
	BWConfigDisplayText="Ballistic Settings"
	BWConfigDescText="Options for Ballistic Weapons."
	BWHints[0]="Reloading:|Most Ballistic weapons have a limited ammo capacity and need to be reloaded. This can be done by pressing %FIRE% when the weapon is empty or reloading it anytime by pressing %RELOAD%."
	BWHints[1]="Heavy Weapons:|Heavier weapons generally have more fire power, but are less manouverable and slow to reload."
	BWHints[2]="Special Functions for Weapons:|Many Ballistic weapons have a Special function which can be used by pressing %WeaponSpecial%."
	BWHints[3]="Fire Modes can help you:|Some Ballistic weapons have various fire modes to limit how a weapon fires. They help to keep a weapon under control and can be cycled by pressing %SwitchWeaponMode%."
	BWHints[4]="Melee Weapons:|Melee weapons have very short range, but they don't need ammo, require little aiming, improve player manouverability and generally have high damage."
	BWHints[5]="How to use Hand Grenades:|Grenades can be tossed by pressing %FIRE% or rolled with %ALTFIRE%. Their throw range can be varied by holding either fire and the clip can be released to time the detonation by pressing %RELOAD% or %WeaponSpecial%."
	BWHints[6]="Chaos is bad for Accuracy:|Running, jumping and sprinting apply chaos to your weapons, making it harder to aim. Crouching, walking and remaining still all improve weapon stability. The crosshair will show you how much chaos is affecting your aim."
	BWHints[7]="Not all Injuries are the same:|Headshots are much more deadly than normal with any weapon while shots to limbs are far less effective than normal."
	BWHints[8]="Machineguns:|Machineguns are powerful and fire continuously with a high ammo capacity, but they are heavy and badly affected by recoil. Their performance can be greatly improved by switching to stand mode with %ALTFIRE%, crouching and remaining stationary while firing."
	BWHints[9]="Sniper Rifles:|The sniper rifle is very powerful, accurate and has very long range, but it has a slow rate of fire and low clip capacity. The scope makes this weapon devastating at long range, but leaves the sniper vulnerable to unseen enemies nearby."
	BWHints[10]="How to use Sniper Scopes:|Several weapons have scopes to help aiming at long range. Pressing %ALTFIRE% will activate a scope and holding it down will zoom in further. Use %NEXTWEAPON% and %PREVWEAPON% to make further adjustments to the zoom level. Press %ALTFIRE% again to deactivate the scope."
	BWHints[11]="Recoil hurts your aim:|When most weapons fire, they create recoil which causes them to aim off. Recoil usually causes a weapon to pitch up and move slightly randomly. The effects of recoil are far worse on rapid fire weapons because they accumulate as the weapon is fired. The crosshair will reflect the recoil level."
	BWHints[12]="Energy Weapons:|Energy weapons are generally unaffected by recoil, but may have other disadvantages such as slow moving and easily visible projectiles or low damage."
	BWHints[13]="Fully Automatic Weapons:|Highly automatic, rapid fire weapons fire many rounds each second, making it easier to hit a target, but they also make it harder by quickly generating lots of recoil, ruining your aim."
	BWHints[14]="Shotguns:|Shotguns are extremely powerful and fire many pellets with a wide spread, making it easy to hit a target, but have a low rate of fire, slow reloading and a relatively short range. The closer the target, the more damage a shotgun will do."
	BWHints[15]="Ballistic Weapons Information can help you:|You can find out lots of information and specific details for each weapon in the weapons section of the game's options menu. You can also find out lots of information about Ballistic Weapons in the mod's manual."
	BWHints[16]="Learn the Recoil Behavior for individual weapons:|Recoil behaves very differently for each weapon. Some weapons will pitch straight up, while others will follow a winding path. Learning how recoil affects individual weapons can give you a real edge."
	BWHints[17]="Special functions for Melee Weapons:|You can use %WeaponSpecial% to throw a knife or block melee attacks with the sword and wrist blades."
	BWHints[18]="Tricks for the G5 Rocket Launcher:|Use the scope on the G5 to lock on to enemies. When the targeting box is active, rockets will be guided towards the target. Use the %WeaponSpecial% key to see a Rocket's Eye View of things. If an enemy rocket has locked on to you, shoot it down to avoid death."
	BWHints[19]="Mine Sweeping:|You can avoid triggering enemy mines by facing them and moving very slowly or crouching."
	BWHints[20]="The FP9 has many secrets:|The FP9A5 is a highly versatile explosive device that can be tossed or deployed on surfaces. It can be detonated by remote control or by means of its own trip laser. Master this device by learning all its controls and you will be able to set up very effective traps."
	DefaultPlayerClassName="BallisticProV55.BallisticPawn"
	DeathMessageClass=Class'BallisticProV55.Ballistic_DeathMessage'
	PlayerControllerClassName="BallisticProV55.BallisticPlayer"
	GameName="BallisticPro: DeathMatch"
	Description="Standard Deathmatch, but with Ballistic Weapons. Inventory acquisition can be via swapping, Loadout, Conflict Loadout or Arena. Alternatively, a melee-only game can be played. When playing Ballistic gametypes, Simple Death Messages will notify you of when players are using iron sights or scopes to kill each other."
	DecoTextName="BallisticProV55.Game_BallisticDeathmatch"
}
