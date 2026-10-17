class BallisticPlayerReplicationInfo extends LinkedReplicationInfo
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct HitStat
{
	var int Fired;
	var int Hit;
	var int Damage;
	var int Kills;
	var int DeathsWith;
};

var HitStat HitStats[10];
var int SGDamage;
var int HeadShots;
var float AveragePercent;
var byte NadeCount;
var PlayerController MyOwner;

simulated function PostNetBeginPlay()
{
	local bool plrDirty;
	local int tcpMaxInternetRate, tcpMaxRate;

	// End:0x250
	if(int(Level.NetMode) == int(NM_Client))
	{
		MyOwner = Level.GetLocalPlayerController();
		// End:0x242
		if(MyOwner != none)
		{
			// End:0x87
			if((Class'Engine.Player'.default.ConfiguredInternetSpeed < 20000) && Class'Engine.Player'.default.ConfiguredInternetSpeed > 9500)
			{
				Class'Engine.Player'.default.ConfiguredInternetSpeed = 20000;
				plrDirty = true;
			}
			// End:0xBB
			if(Class'Engine.Player'.default.ConfiguredLanSpeed < 20000)
			{
				Class'Engine.Player'.default.ConfiguredLanSpeed = 20000;
				plrDirty = true;
			}
			// End:0xD3
			if(plrDirty)
			{
				Class'Engine.Player'.static.StaticSaveConfig();
			}
			tcpMaxInternetRate = int(MyOwner.ConsoleCommand("get TcpNetDriver MaxInternetClientRate"));
			// End:0x15F
			if(tcpMaxInternetRate < 20000)
			{
				MyOwner.ConsoleCommand("set TcpNetDriver MaxInternetClientRate 20000");
			}
			tcpMaxRate = int(MyOwner.ConsoleCommand("get TcpNetDriver MaxClientRate"));
			// End:0x1DB
			if(tcpMaxRate < 20000)
			{
				MyOwner.ConsoleCommand("set TcpNetDriver MaxClientRate 20000");
			}
			// End:0x23F
			if((MyOwner.Player.CurrentNetSpeed < 20000) && MyOwner.Player.CurrentNetSpeed > 9500)
			{
				MyOwner.ConsoleCommand("netspeed 20000");
			}			
		}
		else
		{
			Enable('Tick');
			GotoState('ClientNotInitialized');
		}
	}
	//return;	
}

function AddFireStat(int load, int InventoryGroup)
{
	HitStats[InventoryGroup].Fired += load;
	//return;	
}

function ProcessHitStats()
{
	local int Count, i;
	local bool bInc;

	AveragePercent = 0.0000000;
	i = 0;
	J0x12:

	// End:0x1AE [Loop If]
	if(i < 10)
	{
		switch(i)
		{
			// End:0x43
			case 0:
				bInc = HitStats[0].Fired > 2;
				// End:0x163
				break;
			// End:0x61
			case 1:
				bInc = HitStats[1].Fired > 2;
				// End:0x163
				break;
			// End:0x81
			case 2:
				bInc = HitStats[2].Fired > 9;
				// End:0x163
				break;
			// End:0xA0
			case 3:
				bInc = HitStats[3].Fired > 0;
				// End:0x163
				break;
			// End:0xC0
			case 4:
				bInc = HitStats[4].Fired > 4;
				// End:0x163
				break;
			// End:0xE0
			case 5:
				bInc = HitStats[5].Fired > 9;
				// End:0x163
				break;
			// End:0x100
			case 6:
				bInc = HitStats[6].Fired > 19;
				// End:0x163
				break;
			// End:0x120
			case 7:
				bInc = HitStats[7].Fired > 19;
				// End:0x163
				break;
			// End:0x140
			case 8:
				bInc = HitStats[8].Fired > 2;
				// End:0x163
				break;
			// End:0x160
			case 9:
				bInc = HitStats[9].Fired > 2;
				// End:0x163
				break;
			// End:0xFFFF
			default:
				break;
		}
		// End:0x1A4
		if(bInc)
		{
			AveragePercent += (GetPercentage(float(HitStats[i].Fired), float(HitStats[i].Hit)));
			Count++;
		}
		i++;
		// [Loop Continue]
		goto J0x12;
	}
	// End:0x1C7
	if(Count > 0)
	{
		AveragePercent /= float(Count);
	}
	//return;	
}

function float GetPercentage(float f1, float f2)
{
	// End:0x15
	if(f1 == 0.0000000)
	{
		return 0.0000000;
	}
	return FMin(100.0000000, (f2 / f1) * 100.0000000);
	//return;	
}

state ClientNotInitialized
{
	simulated function Tick(float DeltaTime)
	{
		MyOwner = Level.GetLocalPlayerController();
		// End:0x34
		if(MyOwner != none)
		{
			PostNetBeginPlay();
			Disable('Tick');
			GotoState('None');
		}
		//return;		
	}
	stop;	
}

