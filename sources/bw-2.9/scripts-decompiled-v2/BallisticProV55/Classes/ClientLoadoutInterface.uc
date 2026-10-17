class ClientLoadoutInterface extends Actor
	config
	notplaceable;

struct LoadoutInfo
{
	var() float DamageRate;
	var() float SniperEff;
	var() float ShotgunEff;
	var() float HazardEff;
};

var Mut_Loadout mut;
var PlayerController PC;
var float LastLoadoutTime;
var() config float ChangeInterval;
var array<string> Group0;
var array<string> Group1;
var array<string> Group2;
var array<string> Group3;
var array<string> Group4;
var() array<LOItem> items;
var bool bWeaponsReady;
var int ElapsedTime;
var float LastTimeUT;
var LoadoutInfo MyLoadoutInfo;
var string LastLoadout[5];

replication
{
	// Pos:0x000
	reliable if(int(Role) < int(ROLE_Authority))
		ServerLoadoutChanged, ServerSetLoadout;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		ClientOpenLoadoutMenu, ClientStartLoadout, 
		ReceiveWeapon, ReceiveWeaponEnd;

	// Pos:0x01A
	reliable if(int(Role) == int(ROLE_Authority))
		PC;

	// Pos:0x027
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		ElapsedTime;
}

simulated function int GetItemsLength()
{
	// End:0x23
	if(int(Role) == int(ROLE_Authority))
	{
		return mut.items.Length;		
	}
	else
	{
		return items.Length;
	}
	return -1;
	//return;	
}

simulated function LOItem GetItem(int ItemNum)
{
	// End:0x25
	if(int(Role) == int(ROLE_Authority))
	{
		return mut.items[ItemNum];
	}
	return items[ItemNum];
	//return;	
}

simulated function ReceiveWeaponEnd()
{
	bWeaponsReady = true;
	//return;	
}

simulated function ReceiveWeapon(LOItem Item)
{
	items[items.Length] = Item;
	//return;	
}

function SendWeapons()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x67 [Loop If]
	if(i < mut.items.Length)
	{
		// End:0x43
		if(mut.items[i].ItemName == "")
		{
			// [Explicit Continue]
			goto J0x5D;
		}
		ReceiveWeapon(mut.items[i]);
		J0x5D:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	ReceiveWeaponEnd();
	//return;	
}

function Initialize(Mut_Loadout Mo, PlayerController P)
{
	mut = Mo;
	PC = P;
	bWeaponsReady = true;
	// End:0x58
	if((int(Level.NetMode) != int(NM_Standalone)) && Viewport(P.Player) == none)
	{
		SendWeapons();
	}
	OpenLoadoutMenu();
	SetTimer(1.0000000, true);
	//return;	
}

function OpenLoadoutMenu()
{
	// End:0x30
	if(PC.PlayerReplicationInfo.Kills == 0)
	{
		MyLoadoutInfo.DamageRate = 0.0000000;		
	}
	else
	{
		MyLoadoutInfo.DamageRate = float(mut.LoadoutRules.GetPlayerDamage(PC.PlayerReplicationInfo.PlayerID)) / float(PC.PlayerReplicationInfo.Kills);
	}
	// End:0x169
	if(PC.PlayerReplicationInfo.Deaths < float(1))
	{
		MyLoadoutInfo.SniperEff = mut.LoadoutRules.GetSniperEff(PC.PlayerReplicationInfo.PlayerID) * float(2);
		MyLoadoutInfo.ShotgunEff = mut.LoadoutRules.GetShotgunEff(PC.PlayerReplicationInfo.PlayerID) * float(2);
		MyLoadoutInfo.HazardEff = mut.LoadoutRules.GetHazardEff(PC.PlayerReplicationInfo.PlayerID) * float(2);		
	}
	else
	{
		MyLoadoutInfo.SniperEff = mut.LoadoutRules.GetSniperEff(PC.PlayerReplicationInfo.PlayerID) / PC.PlayerReplicationInfo.Deaths;
		MyLoadoutInfo.ShotgunEff = mut.LoadoutRules.GetShotgunEff(PC.PlayerReplicationInfo.PlayerID) / PC.PlayerReplicationInfo.Deaths;
		MyLoadoutInfo.HazardEff = mut.LoadoutRules.GetHazardEff(PC.PlayerReplicationInfo.PlayerID) / PC.PlayerReplicationInfo.Deaths;
	}
	ClientOpenLoadoutMenu(MyLoadoutInfo);
	//return;	
}

simulated function ClientOpenLoadoutMenu(LoadoutInfo LOI)
{
	MyLoadoutInfo = LOI;
	// End:0x2E
	if((PC == none) || PC.Player == none)
	{
		return;
	}
	PC.ClientOpenMenu("BallisticProV55.BallisticLoadOutMenu");
	// End:0xB5
	if(PC.Player.GUIController != none)
	{
		BallisticLoadOutMenu(GUIController(PC.Player.GUIController).ActivePage).COI = self;
	}
	//return;	
}

event Tick(float dt)
{
	// End:0x6A
	if((int(Role) == int(ROLE_Authority)) && (Level.TimeSeconds - LastTimeUT) > float(5))
	{
		ElapsedTime = Level.Game.GameReplicationInfo.ElapsedTime;
		LastTimeUT = Level.TimeSeconds;
	}
	//return;	
}

event Timer()
{
	// End:0x0E
	if(PC == none)
	{
		Destroy();
	}
	//return;	
}

event Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x5C [Loop If]
	if(i < mut.COIPond.Length)
	{
		// End:0x52
		if(mut.COIPond[i] == self)
		{
			mut.COIPond.Remove(i, 1);
			// [Explicit Break]
			goto J0x5C;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	J0x5C:

	super.Destroyed();
	//return;	
}

simulated function LoadoutChanged(string Stuff[5])
{
	ServerLoadoutChanged(Stuff[0], Stuff[1], Stuff[2], Stuff[3], Stuff[4]);
	//return;	
}

function ServerLoadoutChanged(string Stuff0, string Stuff1, string Stuff2, string Stuff3, string Stuff4)
{
	local int i;

	// End:0x35
	if((PC.Pawn == none) || PC.Pawn.Health < 1)
	{
		return;
	}
	// End:0x1CA
	if(((((Level.TimeSeconds - PC.Pawn.SpawnTime) < (DeathMatch(Level.Game).SpawnProtectionTime * float(5))) || (Level.TimeSeconds - LastLoadoutTime) > ChangeInterval) || (Invasion(Level.Game) != none) && !Invasion(Level.Game).bWaveInProgress) || ((CTFGame(Level.Game) != none) && PC.GetTeamNum() < 2) && VSize(CTFTeamAI(CTFGame(Level.Game).Teams[PC.GetTeamNum()].AI).FriendlyFlag.HomeBase.Location - PC.Pawn.Location) < float(384))
	{
		ServerSetLoadout(Stuff0, Stuff1, Stuff2, Stuff3, Stuff4);
		LastLoadoutTime = Level.TimeSeconds;		
	}
	else
	{
		// End:0x330
		if(ONSOnslaughtGame(Level.Game) != none)
		{
			i = 0;
			J0x1EA:

			// End:0x330 [Loop If]
			if(i < ONSOnslaughtGame(Level.Game).PowerCores.Length)
			{
				// End:0x326
				if((ONSOnslaughtGame(Level.Game).PowerCores[i].bPoweredByRed && PC.GetTeamNum() == 0) || ONSOnslaughtGame(Level.Game).PowerCores[i].bPoweredByBlue && PC.GetTeamNum() == 1)
				{
					// End:0x326
					if(VSize(ONSOnslaughtGame(Level.Game).PowerCores[i].Location - PC.Pawn.Location) < float(384))
					{
						ServerSetLoadout(Stuff0, Stuff1, Stuff2, Stuff3, Stuff4);
						LastLoadoutTime = Level.TimeSeconds;
						return;
					}
				}
				i++;
				// [Loop Continue]
				goto J0x1EA;
			}
		}
	}
	//return;	
}

simulated function ClientStartLoadout()
{
	ServerSetLoadout(Class'BallisticProV55.Mut_Loadout'.default.LoadOut[0], Class'BallisticProV55.Mut_Loadout'.default.LoadOut[1], Class'BallisticProV55.Mut_Loadout'.default.LoadOut[2], Class'BallisticProV55.Mut_Loadout'.default.LoadOut[3], Class'BallisticProV55.Mut_Loadout'.default.LoadOut[4]);
	//return;	
}

function ServerSetLoadout(string Stuff0, string Stuff1, string Stuff2, string Stuff3, string Stuff4)
{
	local string Stuff[5];

	Stuff[0] = Stuff0;
	Stuff[1] = Stuff1;
	Stuff[2] = Stuff2;
	Stuff[3] = Stuff3;
	Stuff[4] = Stuff4;
	// End:0x7F
	if(PC.Pawn != none)
	{
		mut.OutfitPlayer(PC.Pawn, Stuff, LastLoadout);
	}
	LastLoadout[0] = Stuff[0];
	LastLoadout[1] = Stuff[1];
	LastLoadout[2] = Stuff[2];
	LastLoadout[3] = Stuff[3];
	LastLoadout[4] = Stuff[4];
	//return;	
}

defaultproperties
{
	ChangeInterval=60.0000000
	bHidden=true
	bOnlyRelevantToOwner=true
	bAlwaysRelevant=true
	bReplicateMovement=false
	bSkipActorPropertyReplication=true
	RemoteRole=2
}
