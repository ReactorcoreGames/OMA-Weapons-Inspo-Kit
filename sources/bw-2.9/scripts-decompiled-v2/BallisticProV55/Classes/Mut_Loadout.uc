class Mut_Loadout extends Mut_Ballistic
	transient
	config(BallisticProV55)
	exportstructs
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct LORequirements
{
	var() config byte InTeam;
	var() config float MatchTime;
	var() config float Frags;
	var() config float Efficiency;
	var() config float DamageRate;
	var() config float SniperEff;
	var() config float ShotgunEff;
	var() config float HazardEff;
};

struct LOItem
{
	var() config string ItemName;
	var() config int Groups;
	var() config LORequirements Requirements;
};

var() config array<LOItem> items;
var() config string LoadOut[5];
var array<ClientLoadoutInterface> COIPond;
var PlayerController PCPendingCOI;
var Rules_Loadout LoadoutRules;

function bool WeaponRequirementsOk(int ItemIndex, PlayerReplicationInfo PRI)
{
	// End:0x1F
	if((ItemIndex < 0) || ItemIndex >= items.Length)
	{
		return false;
	}
	// End:0x5D
	if(float(Level.Game.GameReplicationInfo.ElapsedTime) < items[ItemIndex].Requirements.MatchTime)
	{
		return false;
	}
	// End:0x87
	if(PRI.Score < items[ItemIndex].Requirements.Frags)
	{
		return false;
	}
	// End:0x18E
	if(PRI.Deaths == float(0))
	{
		// End:0xCE
		if((PRI.Score / 0.1000000) < items[ItemIndex].Requirements.Efficiency)
		{
			return false;
		}
		// End:0x10D
		if((LoadoutRules.GetSniperEff(PRI.PlayerID) * float(2)) < items[ItemIndex].Requirements.SniperEff)
		{
			return false;
		}
		// End:0x14C
		if((LoadoutRules.GetShotgunEff(PRI.PlayerID) * float(2)) < items[ItemIndex].Requirements.ShotgunEff)
		{
			return false;
		}
		// End:0x18B
		if((LoadoutRules.GetHazardEff(PRI.PlayerID) * float(2)) < items[ItemIndex].Requirements.HazardEff)
		{
			return false;
		}		
	}
	else
	{
		// End:0x1C8
		if((PRI.Score / PRI.Deaths) < items[ItemIndex].Requirements.Efficiency)
		{
			return false;
		}
		// End:0x243
		if((LoadoutRules.GetSniperEff(PRI.PlayerID) / (((LoadoutRules.GetDeathsHoldingSniper(PRI.PlayerID) + float(1)) / 1.3000000) + (PRI.Deaths / 4.0000000))) < items[ItemIndex].Requirements.SniperEff)
		{
			return false;
		}
		// End:0x2BE
		if((LoadoutRules.GetShotgunEff(PRI.PlayerID) / (((LoadoutRules.GetDeathsHoldingShotgun(PRI.PlayerID) + float(1)) / 1.3000000) + (PRI.Deaths / 4.0000000))) < items[ItemIndex].Requirements.ShotgunEff)
		{
			return false;
		}
		// End:0x339
		if((LoadoutRules.GetHazardEff(PRI.PlayerID) / (((LoadoutRules.GetDeathsHoldingHazard(PRI.PlayerID) + float(1)) / 1.3000000) + (PRI.Deaths / 4.0000000))) < items[ItemIndex].Requirements.HazardEff)
		{
			return false;
		}
	}
	// End:0x36F
	if(PRI.Kills == 0)
	{
		// End:0x36C
		if(float(0) < items[ItemIndex].Requirements.DamageRate)
		{
			return false;
		}		
	}
	else
	{
		// End:0x3BC
		if((float(LoadoutRules.GetPlayerDamage(PRI.PlayerID)) / float(PRI.Kills)) < items[ItemIndex].Requirements.DamageRate)
		{
			return false;
		}
	}
	return true;
	//return;	
}

function bool ValidateWeapon(string WeaponName, int Group, PlayerReplicationInfo PRI)
{
	local int i, GroupIndex;

	GroupIndex = 1 << Group;
	i = 0;
	J0x15:

	// End:0x7F [Loop If]
	if(i < items.Length)
	{
		// End:0x75
		if(items[i].ItemName ~= WeaponName)
		{
			// End:0x73
			if(((items[i].Groups & GroupIndex) > 0) && WeaponRequirementsOk(i, PRI))
			{
				return true;
			}
			return false;
		}
		i++;
		// [Loop Continue]
		goto J0x15;
	}
	return false;
	//return;	
}

function string GetValidWeapon(int Group, PlayerReplicationInfo PRI)
{
	local int i, GroupIndex;

	GroupIndex = 1 << Group;
	i = 0;
	J0x15:

	// End:0x8B [Loop If]
	if(i < items.Length)
	{
		// End:0x81
		if((((items[i].Groups & GroupIndex) > 0) && items[i].ItemName != "") && WeaponRequirementsOk(i, PRI))
		{
			return items[i].ItemName;
		}
		i++;
		// [Loop Continue]
		goto J0x15;
	}
	return "";
	//return;	
}

function string GetRandomWeapon(int Group, PlayerReplicationInfo PRI)
{
	local int i, GroupIndex;
	local array<string> Potentials;

	GroupIndex = 1 << Group;
	i = 0;
	J0x15:

	// End:0x97 [Loop If]
	if(i < items.Length)
	{
		// End:0x8D
		if((((items[i].Groups & GroupIndex) > 0) && items[i].ItemName != "") && WeaponRequirementsOk(i, PRI))
		{
			Potentials[Potentials.Length] = items[i].ItemName;
		}
		i++;
		// [Loop Continue]
		goto J0x15;
	}
	// End:0xA6
	if(Potentials.Length < 1)
	{
		return "";
	}
	return Potentials[Rand(Potentials.Length)];
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local int i;
	local Class<Weapon> W;
	local string Stuff[5];

	xPawn(Other).RequiredEquipment[0] = Stuff[1];
	xPawn(Other).RequiredEquipment[1] = Stuff[0];
	super.ModifyPlayer(Other);
	// End:0x1E4
	if((Other.Controller != none) && Bot(Other.Controller) != none)
	{
		i = 0;
		J0x7B:

		// End:0xB6 [Loop If]
		if(i < 5)
		{
			Stuff[i] = GetRandomWeapon(i, Other.PlayerReplicationInfo);
			i++;
			// [Loop Continue]
			goto J0x7B;
		}
		ChangeLoadOut(Other, Stuff);
		i = 0;
		J0xCD:

		// End:0x1E1 [Loop If]
		if(i < 5)
		{
			// End:0xEE
			if(Stuff[i] == "")
			{
				// [Explicit Continue]
				goto J0x1D7;
			}
			W = Class<Weapon>(DynamicLoadObject(Stuff[i], Class'Core.Class'));
			// End:0x11D
			if(W == none)
			{
				// [Explicit Continue]
				goto J0x1D7;
			}
			SpawnWeapon(W, Other);
			// End:0x1D7
			if((Class<BallisticWeapon>(W) != none) && !Class<BallisticWeapon>(W).default.bNoMag)
			{
				SpawnAmmo(W.default.FireModeClass[0].default.AmmoClass, Other);
				// End:0x1D7
				if(W.default.FireModeClass[0].default.AmmoClass != W.default.FireModeClass[1].default.AmmoClass)
				{
					SpawnAmmo(W.default.FireModeClass[1].default.AmmoClass, Other);
				}
			}
			J0x1D7:

			i++;
			// [Loop Continue]
			goto J0xCD;
		}		
	}
	else
	{
		// End:0x272
		if((Other.Controller != none) && PlayerController(Other.Controller) != none)
		{
			i = 0;
			J0x21A:

			// End:0x272 [Loop If]
			if(i < COIPond.Length)
			{
				// End:0x268
				if(COIPond[i].PC == Other.Controller)
				{
					COIPond[i].ClientStartLoadout();
					return;
				}
				i++;
				// [Loop Continue]
				goto J0x21A;
			}
		}
	}
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	local int i;

	// End:0xAA
	if((MutateString ~= "Loadout") && Sender != none)
	{
		i = 0;
		J0x27:

		// End:0x76 [Loop If]
		if(i < COIPond.Length)
		{
			// End:0x6C
			if(COIPond[i].PC == Sender)
			{
				COIPond[i].OpenLoadoutMenu();
				return;
			}
			i++;
			// [Loop Continue]
			goto J0x27;
		}
		COIPond[i] = Spawn(Class'BallisticProV55.ClientLoadoutInterface', Sender);
		COIPond[i].Initialize(self, Sender);
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

function ChangeLoadOut(Pawn P, out string Stuff[5], optional string OldStuff[5])
{
	local Inventory Inv;
	local int Count, i, j;
	local array<Inventory> BadInv;

	Inv = P.Inventory;
	J0x14:

	// End:0x12A [Loop If]
	if((Inv != none) && Count < 1000)
	{
		// End:0x10C
		if((Weapon(Inv) != none) && Translauncher(Inv) == none)
		{
			i = 0;
			J0x59:

			// End:0x10C [Loop If]
			if(i < 5)
			{
				// End:0x102
				if(OldStuff[i] ~= string(Inv.Class))
				{
					j = 0;
					J0x8C:

					// End:0xD3 [Loop If]
					if(j < 5)
					{
						// End:0xC9
						if(Stuff[j] ~= string(Inv.Class))
						{
							Stuff[j] = "";
							// [Explicit Break]
							goto J0xD3;
						}
						j++;
						// [Loop Continue]
						goto J0x8C;
					}
					J0xD3:

					// End:0xF1
					if(j >= 5)
					{
						BadInv[BadInv.Length] = Inv;
					}
					OldStuff[i] = "";
					// [Explicit Break]
					goto J0x10C;
				}
				i++;
				// [Loop Continue]
				goto J0x59;
			}
		}
		J0x10C:

		Count++;
		Inv = Inv.Inventory;
		// [Loop Continue]
		goto J0x14;
	}
	J0x12A:

	// End:0x15C [Loop If]
	if(BadInv.Length > 0)
	{
		// End:0x151
		if(BadInv[0] != none)
		{
			BadInv[0].Destroy();
		}
		BadInv.Remove(0, 1);
		// [Loop Continue]
		goto J0x12A;
	}
	//return;	
}

function OutfitPlayer(Pawn Other, string Stuff[5], optional string OldStuff[5])
{
	local int i;
	local Class<Weapon> W;

	// End:0x44
	if((Vehicle(Other) != none) && Vehicle(Other).Driver != none)
	{
		Other = Vehicle(Other).Driver;
	}
	i = 0;
	J0x4B:

	// End:0xAF [Loop If]
	if(i < 5)
	{
		// End:0xA5
		if(!ValidateWeapon(Stuff[i], i, Other.PlayerReplicationInfo))
		{
			Stuff[i] = GetValidWeapon(i, Other.PlayerReplicationInfo);
		}
		i++;
		// [Loop Continue]
		goto J0x4B;
	}
	ChangeLoadOut(Other, Stuff, OldStuff);
	// End:0x10E
	if(xPawn(Other) != none)
	{
		xPawn(Other).RequiredEquipment[0] = Stuff[1];
		xPawn(Other).RequiredEquipment[1] = Stuff[0];
	}
	i = 3;
	J0x116:

	// End:0x288 [Loop If]
	if(i < 5)
	{
		// End:0x24E
		if(Stuff[i] != "")
		{
			W = Class<Weapon>(DynamicLoadObject(Stuff[i], Class'Core.Class'));
			// End:0x194
			if(W == none)
			{
				Log("Could not load outfitted weapon " $ Stuff[i]);				
			}
			else
			{
				SpawnWeapon(W, Other);
				// End:0x24E
				if((Class<BallisticWeapon>(W) != none) && !Class<BallisticWeapon>(W).default.bNoMag)
				{
					SpawnAmmo(W.default.FireModeClass[0].default.AmmoClass, Other);
					// End:0x24E
					if(W.default.FireModeClass[0].default.AmmoClass != W.default.FireModeClass[1].default.AmmoClass)
					{
						SpawnAmmo(W.default.FireModeClass[1].default.AmmoClass, Other);
					}
				}
			}
		}
		// End:0x264
		if(i == 0)
		{
			i = 4;			
		}
		else
		{
			// End:0x276
			if(i == 4)
			{
				// [Explicit Break]
				goto J0x288;				
			}
			else
			{
				i--;
			}
		}
		i += 0;
		// [Loop Continue]
		goto J0x116;
	}
	J0x288:

	//return;	
}

static function Weapon SpawnWeapon(Class<Weapon> NewClass, Pawn P)
{
	local Weapon newWeapon;

	// End:0x92
	if(((NewClass != none) && P != none) && (P.FindInventoryType(NewClass) == none) || Class<BallisticHandgun>(NewClass) != none)
	{
		newWeapon = P.Spawn(NewClass,,, P.Location);
		// End:0x8C
		if(newWeapon != none)
		{
			newWeapon.GiveTo(P);
		}
		return newWeapon;
	}
	return none;
	//return;	
}

function Class<Weapon> MyDefaultWeapon()
{
	return none;
	//return;	
}

function Class<Inventory> GetInventoryClass(string InventoryClassName)
{
	return none;
	//return;	
}

function PostBeginPlay()
{
	local int i;

	super.PostBeginPlay();
	LoadoutRules = Spawn(Class'BallisticProV55.Rules_Loadout');
	// End:0x51
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = LoadoutRules;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(LoadoutRules);
	}
	i = 0;
	J0x7E:

	// End:0x19B [Loop If]
	if(i < items.Length)
	{
		items[i].Requirements.MatchTime *= Class'BallisticProV55.Mut_LoadoutConfig'.default.TimeScale;
		items[i].Requirements.Frags *= Class'BallisticProV55.Mut_LoadoutConfig'.default.FragScale;
		items[i].Requirements.Efficiency *= Class'BallisticProV55.Mut_LoadoutConfig'.default.EffyScale;
		items[i].Requirements.DamageRate *= Class'BallisticProV55.Mut_LoadoutConfig'.default.DmRtScale;
		items[i].Requirements.ShotgunEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.SgEfScale;
		items[i].Requirements.SniperEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.SrEfScale;
		items[i].Requirements.HazardEff *= Class'BallisticProV55.Mut_LoadoutConfig'.default.HzEfScale;
		i++;
		// [Loop Continue]
		goto J0x7E;
	}
	//return;	
}

simulated event Timer()
{
	super.Timer();
	// End:0x13
	if(PCPendingCOI == none)
	{
		return;
	}
	COIPond[COIPond.Length] = Spawn(Class'BallisticProV55.ClientLoadoutInterface', PCPendingCOI);
	COIPond[COIPond.Length - 1].Initialize(self, PCPendingCOI);
	PCPendingCOI = none;
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i;

	bSuperRelevant = 0;
	// End:0x45
	if(PlayerController(Other) != none)
	{
		// End:0x29
		if(PCPendingCOI != none)
		{
			Timer();
		}
		SetTimer(0.1000000, false);
		PCPendingCOI = PlayerController(Other);		
	}
	else
	{
		// End:0x8A
		if(xPawn(Other) != none)
		{
			xPawn(Other).RequiredEquipment[0] = "";
			xPawn(Other).RequiredEquipment[1] = "";
			return true;			
		}
		else
		{
			// End:0x114
			if(((Weapon(Other) != none) && !Weapon(Other).bNoInstagibReplace) && Translauncher(Other) == none)
			{
				i = 0;
				J0xCE:

				// End:0x10F [Loop If]
				if(i < items.Length)
				{
					// End:0x105
					if(items[i].ItemName ~= string(Other.Class))
					{
						return true;
					}
					i++;
					// [Loop Continue]
					goto J0xCE;
				}
				return false;				
			}
			else
			{
				// End:0x13F
				if((WeaponPickup(Other) != none) && Other.Owner == none)
				{
					return false;					
				}
				else
				{
					// End:0x166
					if((Ammo(Other) != none) && IP_AmmoPack(Other) == none)
					{
						return false;						
					}
					else
					{
						// End:0x1A5
						if(WeaponLocker(Other) != none)
						{
							// End:0x1A2
							if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
							{
								Other.GotoState('Disabled');
								return false;
							}							
						}
						else
						{
							// End:0x1D4
							if(xWeaponBase(Other) != none)
							{
								// End:0x1D1
								if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
								{
									return false;
								}								
							}
							else
							{
								// End:0x228
								if(xPickUpBase(Other) != none)
								{
									Other.bHidden = true;
									// End:0x228
									if(xPickUpBase(Other).myEmitter != none)
									{
										xPickUpBase(Other).myEmitter.Destroy();
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return super.CheckReplacement(Other, bSuperRelevant);
	//return;	
}

defaultproperties
{
	items[0]=(ItemName="BallisticProV55.MRS138Shotgun",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.5000000,DamageRate=40.0000000,SniperEff=0.0000000,ShotgunEff=1.0000000,HazardEff=-999.0000000))
	items[1]=(ItemName="BallisticProV55.RS8Pistol",Groups=6,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=-5.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=0.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[2]=(ItemName="BallisticProV55.XRS10SubMachinegun",Groups=6,Requirements=(InTeam=0,MatchTime=60.0000000,Frags=5.0000000,Efficiency=0.4000000,DamageRate=-1.0000000,SniperEff=0.0000000,ShotgunEff=0.2000000,HazardEff=-999.0000000))
	items[3]=(ItemName="BallisticProV55.SRS900Rifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=20.0000000,Efficiency=0.9000000,DamageRate=75.0000000,SniperEff=1.0000000,ShotgunEff=0.0000000,HazardEff=-999.0000000))
	items[4]=(ItemName="BallisticProV55.HVCMk9LightningGun",Groups=8,Requirements=(InTeam=0,MatchTime=360.0000000,Frags=40.0000000,Efficiency=1.0000000,DamageRate=90.0000000,SniperEff=0.0000000,ShotgunEff=0.5000000,HazardEff=1.0000000))
	items[5]=(ItemName="BallisticProV55.A42SkrithPistol",Groups=6,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=-15.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=-999.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[6]=(ItemName="BallisticProV55.A73SkrithRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=20.0000000,Efficiency=0.9000000,DamageRate=80.0000000,SniperEff=0.0000000,ShotgunEff=0.4000000,HazardEff=0.1000000))
	items[7]=(ItemName="BallisticProV55.A909SkrithBlades",Groups=1,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=2.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=-999.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[8]=(ItemName="BallisticProV55.AM67Pistol",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=15.0000000,Efficiency=0.8000000,DamageRate=50.0000000,SniperEff=0.0000000,ShotgunEff=0.5000000,HazardEff=-999.0000000))
	items[9]=(ItemName="BallisticProV55.BX5Mine",Groups=16,Requirements=(InTeam=0,MatchTime=260.0000000,Frags=20.0000000,Efficiency=0.6000000,DamageRate=60.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=1.0000000))
	items[10]=(ItemName="BallisticProV55.D49Revolver",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=10.0000000,Efficiency=0.6000000,DamageRate=50.0000000,SniperEff=1.0000000,ShotgunEff=0.0000000,HazardEff=-999.0000000))
	items[11]=(ItemName="BallisticProV55.EKS43Katana",Groups=1,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=10.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=-999.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[12]=(ItemName="BallisticProV55.FP7Grenade",Groups=16,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=5.0000000,Efficiency=-999.0000000,DamageRate=25.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.5000000))
	items[13]=(ItemName="BallisticProV55.FP9Explosive",Groups=16,Requirements=(InTeam=0,MatchTime=180.0000000,Frags=10.0000000,Efficiency=0.4000000,DamageRate=-1.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.5000000))
	items[14]=(ItemName="BallisticProV55.Fifty9MachinePistol",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=10.0000000,Efficiency=0.8000000,DamageRate=40.0000000,SniperEff=0.0000000,ShotgunEff=0.4000000,HazardEff=-999.0000000))
	items[15]=(ItemName="BallisticProV55.G5Bazooka",Groups=12,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=35.0000000,Efficiency=1.0000000,DamageRate=80.0000000,SniperEff=0.8000000,ShotgunEff=0.0000000,HazardEff=1.0000000))
	items[16]=(ItemName="BallisticProV55.M290Shotgun",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=20.0000000,Efficiency=0.5000000,DamageRate=80.0000000,SniperEff=0.0000000,ShotgunEff=1.0000000,HazardEff=0.0000000))
	items[17]=(ItemName="BallisticProV55.M353Machinegun",Groups=12,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=25.0000000,Efficiency=0.7000000,DamageRate=-1.0000000,SniperEff=0.4000000,ShotgunEff=0.4000000,HazardEff=-999.0000000))
	items[18]=(ItemName="BallisticProV55.M50AssaultRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.9000000,DamageRate=80.0000000,SniperEff=0.7000000,ShotgunEff=0.7000000,HazardEff=0.4000000))
	items[19]=(ItemName="BallisticProV55.M75Railgun",Groups=12,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=30.0000000,Efficiency=1.0000000,DamageRate=80.0000000,SniperEff=1.0000000,ShotgunEff=0.0000000,HazardEff=0.0000000))
	items[20]=(ItemName="BallisticProV55.M763Shotgun",Groups=12,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=20.0000000,Efficiency=0.7000000,DamageRate=50.0000000,SniperEff=0.0000000,ShotgunEff=0.5000000,HazardEff=0.0000000))
	items[21]=(ItemName="BallisticProV55.M806Pistol",Groups=6,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=8.0000000,Efficiency=-999.0000000,DamageRate=25.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=-999.0000000))
	items[22]=(ItemName="BallisticProV55.M925Machinegun",Groups=12,Requirements=(InTeam=0,MatchTime=360.0000000,Frags=30.0000000,Efficiency=0.8000000,DamageRate=40.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.0000000))
	items[23]=(ItemName="BallisticProV55.MRT6Shotgun",Groups=6,Requirements=(InTeam=0,MatchTime=180.0000000,Frags=10.0000000,Efficiency=-999.0000000,DamageRate=25.0000000,SniperEff=0.0000000,ShotgunEff=0.8000000,HazardEff=-999.0000000))
	items[24]=(ItemName="BallisticProV55.NRP57Grenade",Groups=16,Requirements=(InTeam=0,MatchTime=60.0000000,Frags=5.0000000,Efficiency=0.2500000,DamageRate=30.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.4000000))
	items[25]=(ItemName="BallisticProV55.R78Rifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.5000000,DamageRate=60.0000000,SniperEff=10.0000000,ShotgunEff=0.0000000,HazardEff=0.0000000))
	items[26]=(ItemName="BallisticProV55.RX22AFlamer",Groups=8,Requirements=(InTeam=0,MatchTime=360.0000000,Frags=50.0000000,Efficiency=0.9600000,DamageRate=90.0000000,SniperEff=0.0000000,ShotgunEff=0.3000000,HazardEff=1.0000000))
	items[27]=(ItemName="BallisticProV55.T10Grenade",Groups=16,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=0.0000000,Efficiency=0.0000000,DamageRate=-1.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.0000000))
	items[28]=(ItemName="BallisticProV55.X3Knife",Groups=1,Requirements=(InTeam=0,MatchTime=0.0000000,Frags=-999.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=-999.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[29]=(ItemName="BallisticProV55.XK2SubMachinegun",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=10.0000000,Efficiency=0.6000000,DamageRate=60.0000000,SniperEff=0.3000000,ShotgunEff=0.1000000,HazardEff=-999.0000000))
	items[30]=(ItemName="BallisticProV55.XMV850Minigun",Groups=8,Requirements=(InTeam=0,MatchTime=480.0000000,Frags=60.0000000,Efficiency=2.0000000,DamageRate=100.0000000,SniperEff=0.5000000,ShotgunEff=0.5000000,HazardEff=0.5000000))
	items[31]=(ItemName="BallisticProV55.R9RangerRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.5000000,DamageRate=50.0000000,SniperEff=1.0000000,ShotgunEff=0.2000000,HazardEff=0.0000000))
	items[32]=(ItemName="BallisticProV55.SARAssaultRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.8000000,DamageRate=90.0000000,SniperEff=0.0000000,ShotgunEff=1.0000000,HazardEff=0.0000000))
	items[33]=(ItemName="BallisticProV55.A500Reptile",Groups=12,Requirements=(InTeam=0,MatchTime=210.0000000,Frags=30.0000000,Efficiency=0.9500000,DamageRate=80.0000000,SniperEff=0.0000000,ShotgunEff=0.8000000,HazardEff=0.8000000))
	items[34]=(ItemName="BallisticProV55.BOGPPistol",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=20.0000000,Efficiency=0.8000000,DamageRate=40.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=0.6000000))
	items[35]=(ItemName="BallisticProV55.E23PlasmaRifle",Groups=12,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=25.0000000,Efficiency=0.9000000,DamageRate=80.0000000,SniperEff=0.2000000,ShotgunEff=0.4000000,HazardEff=0.1000000))
	items[36]=(ItemName="BallisticProV55.GRS9Pistol",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=8.0000000,Efficiency=-999.0000000,DamageRate=25.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=-999.0000000))
	items[37]=(ItemName="BallisticProV55.M46AssaultRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.9000000,DamageRate=70.0000000,SniperEff=0.9000000,ShotgunEff=0.2000000,HazardEff=0.7000000))
	items[38]=(ItemName="BallisticProV55.MACWeapon",Groups=8,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=40.0000000,Efficiency=1.0000000,DamageRate=90.0000000,SniperEff=0.8000000,ShotgunEff=0.0000000,HazardEff=1.2000000))
	items[39]=(ItemName="BallisticProV55.MD24Pistol",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=10.0000000,Efficiency=-999.0000000,DamageRate=25.0000000,SniperEff=0.0000000,ShotgunEff=0.0000000,HazardEff=-999.0000000))
	items[40]=(ItemName="BallisticProV55.MRocketLauncher",Groups=8,Requirements=(InTeam=0,MatchTime=480.0000000,Frags=60.0000000,Efficiency=1.5000000,DamageRate=100.0000000,SniperEff=0.8000000,ShotgunEff=2.0000000,HazardEff=1.5000000))
	items[41]=(ItemName="BallisticProV55.MarlinRifle",Groups=12,Requirements=(InTeam=0,MatchTime=240.0000000,Frags=25.0000000,Efficiency=0.6000000,DamageRate=50.0000000,SniperEff=1.0000000,ShotgunEff=0.5000000,HazardEff=-999.0000000))
	items[42]=(ItemName="BallisticProV55.RSDarkStar",Groups=8,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=40.0000000,Efficiency=1.0000000,DamageRate=80.0000000,SniperEff=0.0000000,ShotgunEff=1.0000000,HazardEff=1.0000000))
	items[43]=(ItemName="BallisticProV55.RSNovaStaff",Groups=8,Requirements=(InTeam=0,MatchTime=300.0000000,Frags=40.0000000,Efficiency=1.0000000,DamageRate=80.0000000,SniperEff=1.0000000,ShotgunEff=0.0000000,HazardEff=1.0000000))
	items[44]=(ItemName="BallisticProV55.X4Knife",Groups=1,Requirements=(InTeam=0,MatchTime=180.0000000,Frags=6.0000000,Efficiency=-999.0000000,DamageRate=-1.0000000,SniperEff=-999.0000000,ShotgunEff=-999.0000000,HazardEff=-999.0000000))
	items[45]=(ItemName="BallisticProV55.XMK5SubMachinegun",Groups=12,Requirements=(InTeam=0,MatchTime=180.0000000,Frags=15.0000000,Efficiency=0.7000000,DamageRate=60.0000000,SniperEff=0.1000000,ShotgunEff=0.4000000,HazardEff=-999.0000000))
	items[46]=(ItemName="BallisticProV55.leMatRevolver",Groups=6,Requirements=(InTeam=0,MatchTime=120.0000000,Frags=15.0000000,Efficiency=0.6000000,DamageRate=50.0000000,SniperEff=0.9000000,ShotgunEff=0.5000000,HazardEff=-999.0000000))
	LoadOut[0]="BallisticProV55.X3Knife"
	LoadOut[1]="BallisticProV55.M806Pistol"
	LoadOut[2]="BallisticProV55.M763Shotgun"
	LoadOut[3]="BallisticProV55.M50AssaultRifle"
	LoadOut[4]="BallisticProV55.NRP57Grenade"
	bHideLockers=true
	FriendlyName="BallisticPro: Evolution Loadout"
	Description="Play Ballistic Weapons like normal Loadout, but to access more weapons, you will need to reach certain levels of acheivement:|Match Time: Some weapons are only accesable when the match has played for a while|Frags: Your basic frag count|Efficency: How efficiently you use your lives (frags divided by deaths)|Damage Rage: How much you actually contribute to each of your kills (Total Damage Dealt divided by Kills)|Sniper Efficiency: Your efficiency at taking headshots and long range fighting (Headshots+RangeBonus divided by Deaths using Sniper weapons)|Shotgun Efficiency: Your efficiency at close range gun combat (Close range gun Frags divided by Deaths with Shotguns)|Hazard Efficiency: Your efficiency with hazardous weapons (Frags with hazardous weapons divided by deaths with hazardous weapons)||http://www.runestorm.com"
}
