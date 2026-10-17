class Mut_Killstreak extends Mutator
	transient
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NUM_GROUPS = 2;

var() array<string> Streak1s;
var() array<string> Streak2s;

function PreBeginPlay()
{
	local int i;
	local Class<BC_GameStyle> game_style;
	local WeaponList_Killstreak streaks;

	super.PreBeginPlay();
	game_style = Class'BCoreProV55.BallisticGameStyles'.static.GetReplicatedStyle();
	Log("Loading killstreak weapon list from " $ game_style.default.StyleName);
	streaks = new (none, game_style.default.StyleName) Class'BallisticProV55.WeaponList_Killstreak';
	Streak1s.Length = streaks.Streak1s.Length;
	Streak2s.Length = streaks.Streak2s.Length;
	i = 0;
	J0xA2:

	// End:0xE5 [Loop If]
	if(i < streaks.Streak1s.Length)
	{
		Streak1s[i] = streaks.Streak1s[i];
		++i;
		// [Loop Continue]
		goto J0xA2;
	}
	i = 0;
	J0xEC:

	// End:0x12F [Loop If]
	if(i < streaks.Streak2s.Length)
	{
		Streak2s[i] = streaks.Streak2s[i];
		++i;
		// [Loop Continue]
		goto J0xEC;
	}
	//return;	
}

function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x28
	if(Invasion(Level.Game) != none)
	{
		SpawnInvStreakGR();		
	}
	else
	{
		SpawnStreakGR();
	}
	//return;	
}

function SpawnStreakGR()
{
	local BallisticKillstreakRules G;

	G = Spawn(Class'BallisticProV55.BallisticKillstreakRules');
	// End:0x4B
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = G;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(G);
	}
	G.mut = self;
	//return;	
}

function SpawnInvStreakGR()
{
	local BallisticInvKillstreakRules H;

	H = Spawn(Class'BallisticProV55.BallisticInvKillstreakRules');
	// End:0x4B
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = H;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(H);
	}
	H.mut = self;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local KillstreakLRI KLRI;
	local LinkedReplicationInfo LPRI;

	bSuperRelevant = 0;
	// End:0xE3
	if(PlayerReplicationInfo(Other) != none)
	{
		KLRI = Spawn(Class'BallisticProV55.KillstreakLRI', Other.Owner);
		// End:0xCA
		if(PlayerReplicationInfo(Other).CustomReplicationInfo != none)
		{
			LPRI = PlayerReplicationInfo(Other).CustomReplicationInfo;
			PlayerReplicationInfo(Other).CustomReplicationInfo = KLRI;
			// End:0xB3
			if(KLRI.NextReplicationInfo != none)
			{
				KLRI.NextReplicationInfo.NextReplicationInfo = LPRI;				
			}
			else
			{
				KLRI.NextReplicationInfo = LPRI;
			}			
		}
		else
		{
			PlayerReplicationInfo(Other).CustomReplicationInfo = KLRI;
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

simulated function string GetGroupItem(byte GroupNum, int ItemNum)
{
	switch(GroupNum)
	{
		// End:0x18
		case 0:
			return Streak1s[ItemNum];
		// End:0x29
		case 1:
			return Streak2s[ItemNum];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

simulated function array<string> GetGroup(byte GroupNum)
{
	switch(GroupNum)
	{
		// End:0x12
		case 0:
			return Streak1s;
		// End:0x1D
		case 1:
			return Streak2s;
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

static function KillstreakLRI GetKLRI(PlayerReplicationInfo PRI)
{
	local LinkedReplicationInfo LPRI;

	// End:0x27
	if(PRI.CustomReplicationInfo == none)
	{
		Log("No Custom PRI");
		return none;
	}
	// End:0x54
	if(KillstreakLRI(PRI.CustomReplicationInfo) != none)
	{
		return KillstreakLRI(PRI.CustomReplicationInfo);
	}
	LPRI = PRI.CustomReplicationInfo.NextReplicationInfo;
	J0x71:

	// End:0xFE [Loop If]
	if(LPRI != none)
	{
		// End:0x97
		if(KillstreakLRI(LPRI) != none)
		{
			return KillstreakLRI(LPRI);
		}
		// End:0xE7
		if(LPRI == LPRI.NextReplicationInfo)
		{
			Log("A LinkedReplicationInfo links to itself, aborting");
			// [Explicit Break]
			goto J0xFE;
		}
		LPRI = LPRI.NextReplicationInfo;
		// [Loop Continue]
		goto J0x71;
	}
	J0xFE:

	Log("Couldn't find a KLRI");
	return none;
	//return;	
}

function byte GetStreakLevel(PlayerController C)
{
	return GetKLRI(C.PlayerReplicationInfo).RewardLevel;
	//return;	
}

function FlagStreak(PlayerController C, byte Level)
{
	GetKLRI(C.PlayerReplicationInfo).RewardLevel = byte(int(GetKLRI(C.PlayerReplicationInfo).RewardLevel) | int(Level));
	//return;	
}

function ResetActiveStreaks(PlayerController C)
{
	local KillstreakLRI KLRI;

	KLRI = GetKLRI(C.PlayerReplicationInfo);
	// End:0x46
	if(KLRI != none)
	{
		KLRI.ActiveStreak = 0;
		KLRI.InvKillScore = 0;
	}
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local KillstreakLRI KLRI;
	local int i, j;
	local Class<Inventory> InventoryClass;
	local Inventory Inv;
	local xPawn Pawn;

	super.ModifyPlayer(Other);
	// End:0x34
	if(Other.LastStartTime > (Level.TimeSeconds + float(2)))
	{
		return;
	}
	KLRI = GetKLRI(Other.PlayerReplicationInfo);
	// End:0x5B
	if(KLRI == none)
	{
		return;
	}
	// End:0x8A
	if(Other.PlayerReplicationInfo.bBot || xPawn(Other) == none)
	{
		return;
	}
	Pawn = xPawn(Other);
	// End:0x338
	if(int(KLRI.ActiveStreak) > 0)
	{
		i = 0;
		J0xB7:

		// End:0x338 [Loop If]
		if(i < 2)
		{
			// End:0x32E
			if(bool(int(KLRI.ActiveStreak) & int(float(2) ** float(i))))
			{
				j = 0;
				J0xF0:

				// End:0x21D [Loop If]
				if(j <= GetGroup(byte(i)).Length)
				{
					// End:0x1E4
					if(j == GetGroup(byte(i)).Length)
					{
						PlayerController(Pawn.Controller).ClientMessage(("The selected Killstreak reward weapon (" $ KLRI.Killstreaks[i]) $ ") is not available on this server, giving the default weapon.");
						KLRI.Killstreaks[i] = GetGroup(byte(i))[0];
						// [Explicit Break]
						goto J0x21D;
					}
					// End:0x213
					if(GetGroup(byte(i))[j] ~= KLRI.Killstreaks[i])
					{
						// [Explicit Break]
						goto J0x21D;
					}
					j++;
					// [Loop Continue]
					goto J0xF0;
				}
				J0x21D:

				InventoryClass = Level.Game.BaseMutator.GetInventoryClass(KLRI.Killstreaks[i]);
				Inv = Spawn(InventoryClass);
				// End:0x308
				if(Inv != none)
				{
					Inv.GiveTo(Pawn);
					// End:0x2E9
					if(((Weapon(Inv) != none) && Pawn.PendingWeapon == none) && Pawn.Weapon == none)
					{
						Pawn.PendingWeapon = Weapon(Inv);
						Pawn.ChangedWeapon();
					}
					// End:0x308
					if(Inv != none)
					{
						Inv.PickupFunction(Pawn);
					}
				}
				// End:0x32E
				if(BallisticPawn(Pawn) != none)
				{
					BallisticPawn(Pawn).bActiveKillstreak = true;
				}
			}
			i++;
			// [Loop Continue]
			goto J0xB7;
		}
	}
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local KillstreakLRI KLRI;
	local int Count;
	local array<string> split_string;

	// End:0x7C
	if((MutateString ~= "Killstreak") && Sender != none)
	{
		KLRI = GetKLRI(Sender.PlayerReplicationInfo);
		// End:0x79
		if((KLRI != none) && int(KLRI.RewardLevel) > 0)
		{
			GrantKillstreakReward(Sender.Pawn, KLRI);
		}		
	}
	else
	{
		Count = Split(MutateString, " ", split_string);
		// End:0xC5
		if(split_string[0] ~= "AddKillstreakWeapon")
		{
			AddWeapon(Sender, split_string);			
		}
		else
		{
			// End:0xF9
			if(split_string[0] ~= "RemoveKillstreakWeapon")
			{
				RemoveWeapon(Sender, split_string);
			}
		}
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

function AddWeapon(PlayerController Sender, array<string> split_string)
{
	local int i, loadout_group;
	local array<string> Weapons;
	local WeaponInfo WI;

	// End:0x89
	if((int(Level.NetMode) != int(NM_Standalone)) && !Sender.PlayerReplicationInfo.bAdmin)
	{
		Sender.ClientMessage("Mutate AddKillstreakWeapon: Administrator permissions required");
		return;
	}
	// End:0x110
	if(split_string.Length != 3)
	{
		Sender.ClientMessage("Mutate AddKillstreakWeapon: Usage: mutate addkillstreakweapon <loadout_group_index> <weapon_class_name>");
		return;
	}
	WI = Class'BCoreProV55.BC_WeaponInfoCache'.static.AutoWeaponInfo(split_string[2]);
	// End:0x190
	if(!WI.ClassName ~= split_string[2])
	{
		Sender.ClientMessage("Mutate AddKillstreakWeapon: Weapon not found:" @ split_string[2]);
		return;
	}
	loadout_group = int(split_string[1]);
	// End:0x1F8
	if(loadout_group >= 2)
	{
		Sender.ClientMessage("Mutate AddKillstreakWeapon: Invalid loadout group" @ string(loadout_group));
		return;
	}
	Weapons = GetGroup(byte(loadout_group));
	i = 0;
	J0x212:

	// End:0x2AB [Loop If]
	if(i < Weapons.Length)
	{
		// End:0x2A1
		if(Weapons[i] ~= WI.ClassName)
		{
			Sender.ClientMessage((("Mutate AddKillstreakWeapon: Loadout group" @ string(loadout_group)) @ "already contains") @ WI.ClassName);
			return;
		}
		++i;
		// [Loop Continue]
		goto J0x212;
	}
	Weapons[Weapons.Length] = split_string[2];
	switch(loadout_group)
	{
		// End:0x2E2
		case 0:
			Class'BallisticProV55.Mut_Killstreak'.default.Streak1s = Weapons;
			// End:0x300
			break;
		// End:0x2FD
		case 1:
			Class'BallisticProV55.Mut_Killstreak'.default.Streak2s = Weapons;
			// End:0x300
			break;
		// End:0xFFFF
		default:
			break;
	}
	Sender.ClientMessage((("Mutate AddKillstreakWeapon: Success - added" @ WI.ClassName) @ "to loadout group") @ string(loadout_group));
	Class'BallisticProV55.Mut_Killstreak'.static.StaticSaveConfig();
	//return;	
}

function RemoveWeapon(PlayerController Sender, array<string> split_string)
{
	local bool success;
	local int i, loadout_group;
	local array<string> Weapons;

	success = false;
	// End:0x94
	if((int(Level.NetMode) != int(NM_Standalone)) && !Sender.PlayerReplicationInfo.bAdmin)
	{
		Sender.ClientMessage("Mutate RemoveKillstreakWeapon: Administrator permissions required");
		return;
	}
	// End:0x121
	if(split_string.Length != 3)
	{
		Sender.ClientMessage("Mutate RemoveKillstreakWeapon: Usage: mutate removekillstreakweapon <loadout_group_index> <weapon_class_name>");
		return;
	}
	loadout_group = int(split_string[1]);
	// End:0x18C
	if(loadout_group >= 2)
	{
		Sender.ClientMessage("Mutate RemoveKillstreakWeapon: Invalid loadout group" @ string(loadout_group));
		return;
	}
	Weapons = GetGroup(byte(loadout_group));
	i = 0;
	J0x1A6:

	// End:0x1F3 [Loop If]
	if(i < Weapons.Length)
	{
		// End:0x1E9
		if(Weapons[i] ~= split_string[2])
		{
			Weapons.Remove(i, 1);
			--i;
			success = true;
		}
		++i;
		// [Loop Continue]
		goto J0x1A6;
	}
	// End:0x2B8
	if(success)
	{
		switch(loadout_group)
		{
			// End:0x21E
			case 0:
				Class'BallisticProV55.Mut_Killstreak'.default.Streak1s = Weapons;
				// End:0x23C
				break;
			// End:0x239
			case 1:
				Class'BallisticProV55.Mut_Killstreak'.default.Streak2s = Weapons;
				// End:0x23C
				break;
			// End:0xFFFF
			default:
				break;
		}
		Class'BallisticProV55.Mut_Killstreak'.static.StaticSaveConfig();
		Sender.ClientMessage((("Mutate RemoveKillstreakWeapon: Success - removed" @ split_string[2]) @ "from loadout group") @ string(loadout_group));		
	}
	else
	{
		Sender.ClientMessage((("Mutate RemoveKillstreakWeapon:" @ split_string[2]) @ "not found in loadout group") @ string(loadout_group));
	}
	//return;	
}

function GrantKillstreakReward(Pawn Other, KillstreakLRI KLRI)
{
	local string S;
	local byte Index;

	// End:0x24
	if(bool(int(KLRI.RewardLevel) & 2))
	{
		Index = 1;		
	}
	else
	{
		Index = 0;
	}
	S = SpawnStreakWeapon(KLRI.Killstreaks[int(Index)], KLRI.Layouts[int(Index)], KLRI.Camos[int(Index)], Other, Index);
	// End:0x184
	if(S != "")
	{
		// End:0x128
		if((InStr(S, "FMD") == -1) && InStr(S, "MAU") == -1)
		{
			Level.Game.Broadcast(self, (((Other.PlayerReplicationInfo.PlayerName @ "received a Level") @ string(int(Index) + 1)) @ "spree reward:") @ S);
		}
		KLRI.ActiveStreak = byte(int(KLRI.ActiveStreak) | (int(Index) + 1));
		KLRI.RewardLevel = byte(int(KLRI.RewardLevel) & ~int(Index) + 1);
	}
	//return;	
}

function string SpawnStreakWeapon(string WeaponString, byte LI, byte CI, Pawn Other, byte GroupSlot)
{
	local Class<Weapon> KR;
	local int j;

	j = 0;
	J0x07:

	// End:0xFF [Loop If]
	if(j <= GetGroup(GroupSlot).Length)
	{
		// End:0xD7
		if(j == GetGroup(GroupSlot).Length)
		{
			PlayerController(Other.Controller).ClientMessage(("The selected Killstreak reward weapon (" $ WeaponString) $ ") is not available on this server, giving the default weapon.");
			WeaponString = GetGroup(GroupSlot)[0];
			// [Explicit Break]
			goto J0xFF;
		}
		// End:0xF5
		if(GetGroup(GroupSlot)[j] ~= WeaponString)
		{
			// [Explicit Break]
			goto J0xFF;
		}
		j++;
		// [Loop Continue]
		goto J0x07;
	}
	J0xFF:

	KR = Class<Weapon>(DynamicLoadObject(WeaponString, Class'Core.Class'));
	// End:0x128
	if(KR == none)
	{
		return "";
	}
	SpawnWeapon(KR, Other, LI, CI);
	// End:0x1FE
	if((Class<BallisticWeapon>(KR) != none) && !Class<BallisticWeapon>(KR).default.bNoMag)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.SpawnAmmo(KR.default.FireModeClass[0].default.AmmoClass, Other);
		// End:0x1FE
		if(KR.default.FireModeClass[0].default.AmmoClass != KR.default.FireModeClass[1].default.AmmoClass)
		{
			Class'BallisticProV55.Mut_Ballistic'.static.SpawnAmmo(KR.default.FireModeClass[1].default.AmmoClass, Other);
		}
	}
	// End:0x224
	if(BallisticPawn(Other) != none)
	{
		BallisticPawn(Other).bActiveKillstreak = true;
	}
	return KR.default.ItemName;
	//return;	
}

static function Weapon SpawnWeapon(Class<Weapon> NewClass, Pawn P, byte LayoutIndex, byte CamoIndex)
{
	local Weapon newWeapon;

	// End:0x26A
	if((NewClass != none) && P != none)
	{
		newWeapon = Weapon(P.FindInventoryType(NewClass));
		// End:0x1A3
		if((newWeapon == none) || BallisticHandgun(newWeapon) != none)
		{
			newWeapon = P.Spawn(NewClass,,, P.Location);
			// End:0xDC
			if(newWeapon != none)
			{
				// End:0xC8
				if(BallisticWeapon(newWeapon) != none)
				{
					BallisticWeapon(newWeapon).GenerateLayout(LayoutIndex);
					BallisticWeapon(newWeapon).GenerateCamo(CamoIndex);
				}
				newWeapon.GiveTo(P);
			}
			// End:0x132
			if(BallisticHandgun(newWeapon) != none)
			{
				newWeapon = P.Spawn(NewClass,,, P.Location);
				// End:0x132
				if(newWeapon != none)
				{
					newWeapon.GiveTo(P);
				}
			}
			// End:0x19A
			if(((Bot(P.Controller) != none) && P.Weapon == none) && P.PendingWeapon == none)
			{
				P.PendingWeapon = newWeapon;
				P.ChangedWeapon();
			}
			return newWeapon;			
		}
		else
		{
			newWeapon.AddAmmo(NewClass.default.AmmoClass[0].default.InitialAmount, 0);
			newWeapon.AddAmmo(NewClass.default.AmmoClass[1].default.InitialAmount, 1);
			// End:0x26A
			if(BallisticWeapon(newWeapon) != none)
			{
				BallisticWeapon(newWeapon).MagAmmo = BallisticWeapon(newWeapon).default.MagAmmo;
				BallisticWeapon(newWeapon).bNeedReload = false;
				// End:0x26A
				if(!P.IsLocallyControlled())
				{
					BallisticWeapon(newWeapon).ClientWeaponReloaded();
				}
			}
		}
	}
	return none;
	//return;	
}

defaultproperties
{
	FriendlyName="BallisticPro: Killstreaks"
	Description="Enables special weapons and effects which are granted when a certain kill streak has been obtained.||http://www.runestorm.com"
}
