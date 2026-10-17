class Mut_ItemizerTool extends Mutator
	transient
	config(ItemizerV21)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct ClassGroup
{
	var() config array<string> PickupClasses;
};

var() config array<string> ClassGroup0;
var() config array<string> ClassGroup1;
var() config array<string> ClassGroup2;
var() config array<string> ClassGroup3;
var() config array<string> ClassGroup4;
var() config array<string> ClassGroup5;
var() config array<string> ClassGroup6;
var int SelectedGroup;
var int SelectedScroll;
var Class<Actor> SelectedClass;
var() string NumberText[10];
var() string MainPageText[10];
var() string UtilPageText[10];
var() string BackText;
var() string MoreText;
var bool bMore;
var string MenuText[10];
var int SelectedItem;
var() string SwapOnText;
var() string SwapOffText;
var bool bSwapMode;
var() string ControlPlayerText;
var() string ControlTraceText;
var bool bPlayerPosMode;
var bool bUprightWeapons;
var string CurrentMapName;
var Actor RotatingItem;
var Actor HeldItem;
var Vector HeldOldLocation;
var ItemizerDB IDB;
var() config string ItemGroup;
var() string GroupDisplayText;
var() string GroupDescText;

function int GetGroupLength(int Group)
{
	switch(Group)
	{
		// End:0x12
		case 0:
			return ClassGroup0.Length;
		// End:0x1D
		case 1:
			return ClassGroup1.Length;
		// End:0x29
		case 2:
			return ClassGroup2.Length;
		// End:0x35
		case 3:
			return ClassGroup3.Length;
		// End:0x41
		case 4:
			return ClassGroup4.Length;
		// End:0x4D
		case 5:
			return ClassGroup5.Length;
		// End:0x59
		case 6:
			return ClassGroup6.Length;
		// End:0xFFFF
		default:
			return -1;
			break;
	}
	//return;	
}

function string GetGroupItem(int Group, int Item)
{
	switch(Group)
	{
		// End:0x17
		case 0:
			return ClassGroup0[Item];
		// End:0x27
		case 1:
			return ClassGroup1[Item];
		// End:0x38
		case 2:
			return ClassGroup2[Item];
		// End:0x49
		case 3:
			return ClassGroup3[Item];
		// End:0x5A
		case 4:
			return ClassGroup4[Item];
		// End:0x6B
		case 5:
			return ClassGroup5[Item];
		// End:0x7C
		case 6:
			return ClassGroup6[Item];
		// End:0xFFFF
		default:
			//return;
			break;
	}	
}

function int GetClassGroupCount()
{
	local int i;

	i = 6;
	J0x08:

	// End:0x37 [Loop If]
	if(i >= 0)
	{
		// End:0x2D
		if((GetGroupLength(i)) > 0)
		{
			return i + 1;
		}
		i--;
		// [Loop Continue]
		goto J0x08;
	}
	return 0;
	//return;	
}

function KeyPress(byte Key)
{
	// End:0x278
	if(SelectedGroup > -1)
	{
		// End:0x31
		if(int(Key) == 0)
		{
			SelectedScroll = 0;
			SelectedGroup = -1;			
		}
		else
		{
			// End:0x93
			if(bMore && int(Key) == 9)
			{
				// End:0x6D
				if(SelectedScroll >= ((GetGroupLength(SelectedGroup)) - 8))
				{
					SelectedScroll = 0;					
				}
				else
				{
					SelectedScroll = Max(0, Min((GetGroupLength(SelectedGroup)) - 8, SelectedScroll + 8));
				}				
			}
			else
			{
				// End:0x1A5
				if(SelectedGroup == 9)
				{
					// End:0xC2
					if(HeldItem != none)
					{
						FinishHolding(Level.GetLocalPlayerController());						
					}
					else
					{
						// End:0xE7
						if(int(Key) == 1)
						{
							GrabItem(Level.GetLocalPlayerController());							
						}
						else
						{
							// End:0x148
							if(int(Key) == 2)
							{
								bPlayerPosMode = !bPlayerPosMode;
								// End:0x12C
								if(bPlayerPosMode)
								{
									UtilPageText[1] = default.UtilPageText[1] $ " Position";									
								}
								else
								{
									UtilPageText[1] = default.UtilPageText[1] $ " Trace";
								}								
							}
							else
							{
								// End:0x1A2
								if(int(Key) == 3)
								{
									bUprightWeapons = !bUprightWeapons;
									// End:0x189
									if(bUprightWeapons)
									{
										UtilPageText[2] = default.UtilPageText[2] $ " On";										
									}
									else
									{
										UtilPageText[2] = default.UtilPageText[2] $ " Off";
									}
								}
							}
						}
					}					
				}
				else
				{
					SelectedItem = int(Key) - 1;
					// End:0x1F7
					if((GetClassGroupCount()) > SelectedGroup)
					{
						SelectedClass = Class<Actor>(DynamicLoadObject(GetGroupItem(SelectedGroup, (SelectedScroll + int(Key)) - 1), Class'Core.Class'));
					}
					// End:0x21F
					if(SelectedClass != none)
					{
						AddItem(SelectedClass, Level.GetLocalPlayerController());						
					}
					else
					{
						Level.GetLocalPlayerController().ClientMessage("Could not add item, bad class" $ (GetGroupItem(SelectedGroup, (SelectedScroll + int(Key)) - 1)));
					}
				}
			}
		}		
	}
	else
	{
		// End:0x29B
		if(RotatingItem != none)
		{
			FinishRotating(Level.GetLocalPlayerController());			
		}
		else
		{
			// End:0x363
			if(SelectedGroup == -1)
			{
				// End:0x2D0
				if(int(Key) == 8)
				{
					RemoveItem(Level.GetLocalPlayerController());					
				}
				else
				{
					// End:0x2F6
					if(int(Key) == 9)
					{
						RotateItem(Level.GetLocalPlayerController());						
					}
					else
					{
						// End:0x30E
						if(int(Key) == 0)
						{
							SelectedGroup = 9;							
						}
						else
						{
							// End:0x363
							if((int(Key) > 0) && int(Key) < 8)
							{
								SelectedGroup = int(Key) - 1;
								bMore = ((GetClassGroupCount()) > SelectedGroup) && (GetGroupLength(SelectedGroup)) > 8;
							}
						}
					}
				}
			}
		}
	}
	GetMenuText(MenuText);
	//return;	
}

function GetMenuText(out string A[10])
{
	local int i;

	i = 0;
	J0x07:

	// End:0x19F [Loop If]
	if(i < 10)
	{
		A[i] = NumberText[i];
		// End:0x62
		if(HeldItem != none)
		{
			// End:0x5F
			if(i == 0)
			{
				A[i] $= "Finish Holding";
			}
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0x9B
		if(RotatingItem != none)
		{
			// End:0x98
			if(i == 0)
			{
				A[i] $= "Finish Rotating";
			}
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0xC7
		if(SelectedGroup == -1)
		{
			A[i] $= MainPageText[i];
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0xEA
		if(i == 9)
		{
			A[i] $= BackText;
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0x113
		if(SelectedGroup == 9)
		{
			A[i] $= UtilPageText[i];
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0x141
		if((i == 8) && bMore)
		{
			A[i] $= MoreText;
			// [Explicit Continue]
			goto J0x195;
		}
		// End:0x195
		if((SelectedGroup < (GetClassGroupCount())) && (SelectedScroll + i) < (GetGroupLength(SelectedGroup)))
		{
			A[i] $= (GetGroupItem(SelectedGroup, SelectedScroll + i));
		}
		J0x195:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

function Actor TraceItem(PlayerController Sender)
{
	local Actor t, A, BestItem;
	local Vector HLoc, HNorm, Start, End;
	local float BestDist, Radius;

	// End:0x34
	if(bPlayerPosMode)
	{
		HLoc = Sender.Pawn.Location;
		Radius = 200.0000000;		
	}
	else
	{
		Start = Sender.Pawn.Location + Sender.Pawn.EyePosition();
		End = Start + (Vector(Sender.GetViewRotation()) * float(5000));
		t = Sender.Trace(HLoc, HNorm, End, Start, true);
		// End:0xFA
		if(t == none)
		{
			Sender.ClientMessage("TraceItem Failed: Trace hit nothing");
			return none;
		}
		// End:0x110
		if(Pickup(t) != none)
		{
			return t;
		}
		Radius = 100.0000000;
	}
	BestDist = 9999.0000000;
	// End:0x19C
	foreach VisibleCollidingActors(Class'Engine.Actor', A, Radius, HLoc)
	{
		// End:0x19B
		if((VSize(A.Location - HLoc) < BestDist) && Pickup(A) != none)
		{
			BestDist = VSize(A.Location - HLoc);
			BestItem = A;
		}		
	}	
	// End:0x1E2
	if(BestItem == none)
	{
		Sender.ClientMessage("TraceItem Failed: Could not find pickup");
		return none;
	}
	return BestItem;
	//return;	
}

function Vector TraceNewSpot(PlayerController Sender, Class<Actor> NewItem, optional bool bMustHit)
{
	local Actor t;
	local Vector HLoc, HNorm, Start, End, Extent;

	// End:0x21
	if(bPlayerPosMode)
	{
		return Sender.Pawn.Location;
	}
	Start = Sender.Pawn.Location + Sender.Pawn.EyePosition();
	End = Start + (Vector(Sender.GetViewRotation()) * float(5000));
	Extent.X = NewItem.default.CollisionRadius;
	Extent.Y = NewItem.default.CollisionRadius;
	Extent.Z = NewItem.default.CollisionHeight;
	t = Trace(HLoc, HNorm, End, Start, false, Extent);
	// End:0x11A
	if(t == none)
	{
		// End:0x10F
		if(bMustHit)
		{
			return vect(0.0000000, 0.0000000, 0.0000000);
		}
		HLoc = End;
	}
	return HLoc;
	//return;	
}

function AddItem(Class<Actor> NewItem, PlayerController Sender)
{
	local Actor A;
	local Vector HitLoc;
	local Rotator R;
	local ItemEntry IE;

	HitLoc = TraceNewSpot(Sender, NewItem, true);
	// End:0x67
	if(HitLoc == vect(0.0000000, 0.0000000, 0.0000000))
	{
		Sender.ClientMessage("AddItem Failed: Could not find surface");
		return;
	}
	// End:0x95
	if(!bUprightWeapons && Class<WeaponPickup>(NewItem) != none)
	{
		R.Roll += 16384;
	}
	// End:0xC5
	if(bPlayerPosMode)
	{
		R.Yaw = Sender.Pawn.Rotation.Yaw;
	}
	A = Spawn(NewItem,,, HitLoc, R);
	// End:0x12C
	if(A == none)
	{
		Sender.ClientMessage("AddItem Failed: Could not spawn item: " $ string(NewItem));
		return;
	}
	Sender.ClientMessage(((("AddItem successfully added " $ string(NewItem)) $ ", in ") $ ItemGroup) $ " Group");
	IE.MapName = GetMap();
	IE.ItemClass = NewItem;
	IE.Spot = HitLoc;
	IE.Angle = R;
	IE.Group = ItemGroup;
	IDB.AddItem(IE);
	//return;	
}

function RemoveItem(PlayerController Sender)
{
	local Actor KilledItem;

	KilledItem = TraceItem(Sender);
	// End:0x1E
	if(KilledItem == none)
	{
		return;
	}
	// End:0x8D
	if(IDB.RemoveItem(KilledItem, GetMap()))
	{
		Sender.ClientMessage("RemoveItem successfully removed " $ string(KilledItem.Class));
		KilledItem.Destroy();		
	}
	else
	{
		Sender.ClientMessage("RemoveItem failed to remove " $ string(KilledItem.Class));
	}
	//return;	
}

function FinishRotating(PlayerController Sender)
{
	local ItemEntry IE;

	IE.MapName = GetMap();
	IE.Group = ItemGroup;
	IE.ItemClass = RotatingItem.Class;
	IE.Spot = RotatingItem.Location;
	IE.Angle = RotatingItem.Rotation;
	IDB.UpdateItem(GetMap(), ItemGroup, IE.ItemClass, IE.Spot, IE);
	RotatingItem = none;
	Sender.ClientMessage("FinishRotating updated " $ string(IE.ItemClass));
	//return;	
}

function RotateItem(PlayerController Sender)
{
	RotatingItem = TraceItem(Sender);
	// End:0x1E
	if(RotatingItem == none)
	{
		return;
	}
	Sender.ClientMessage("RotateItem locked on to " $ string(RotatingItem.Class));
	//return;	
}

function FinishHolding(PlayerController Sender)
{
	local ItemEntry IE;

	IE.MapName = GetMap();
	IE.Group = ItemGroup;
	IE.ItemClass = HeldItem.Class;
	IE.Spot = HeldItem.Location;
	IE.Angle = HeldItem.Rotation;
	IDB.UpdateItem(GetMap(), ItemGroup, IE.ItemClass, HeldOldLocation, IE);
	HeldItem = none;
	Sender.ClientMessage("FinishHolding updated " $ string(IE.ItemClass));
	//return;	
}

function GrabItem(PlayerController Sender)
{
	HeldItem = TraceItem(Sender);
	// End:0x1E
	if(HeldItem == none)
	{
		return;
	}
	HeldOldLocation = HeldItem.Location;
	Sender.ClientMessage("GrabItem locked on to " $ string(HeldItem.Class));
	//return;	
}

function Tick(float dt)
{
	local Rotator R;

	// End:0x67
	if(RotatingItem != none)
	{
		R = Level.GetLocalPlayerController().Rotation;
		R.Roll = RotatingItem.Rotation.Roll;
		R.Pitch = 0;
		RotatingItem.SetRotation(R);		
	}
	else
	{
		// End:0xA1
		if(HeldItem != none)
		{
			HeldItem.SetLocation(TraceNewSpot(Level.GetLocalPlayerController(), HeldItem.Class));
		}
	}
	//return;	
}

function Mutate(string MutateString, PlayerController Sender)
{
	// End:0x29
	if(MutateString ~= "PurgeMap")
	{
		IDB.RemoveAllFor(GetMap());
	}
	super.Mutate(MutateString, Sender);
	//return;	
}

function string GetMap()
{
	// End:0x12
	if(CurrentMapName != "")
	{
		return CurrentMapName;
	}
	CurrentMapName = Class'BallisticProV55.ItemizerDB'.static.GetMap(self);
	return CurrentMapName;
	//return;	
}

function PostBeginPlay()
{
	local GameRules G;

	super(Actor).PostBeginPlay();
	IDB = Class'BallisticProV55.ItemizerDB'.static.SpawnItems(GetMap(), ItemGroup, self);
	UtilPageText[1] = default.UtilPageText[1] @ "Trace";
	UtilPageText[2] = default.UtilPageText[2] @ "Off";
	GetMenuText(MenuText);
	G = Spawn(Class'BallisticProV55.ItemGameRules');
	// End:0xAD
	if(Level.Game.GameRulesModifiers == none)
	{
		Level.Game.GameRulesModifiers = G;		
	}
	else
	{
		Level.Game.GameRulesModifiers.AddGameRules(G);
	}
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	bSuperRelevant = 0;
	// End:0x39
	if((Weapon(Other) != none) && Weapon(Other).Class != DefaultWeapon)
	{
		return false;
	}
	return true;
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	super(Info).FillPlayInfo(PlayInfo);
	PlayInfo.AddSetting(default.RulesGroup, "ItemGroup", default.GroupDisplayText, 0, 1, "Text", "20");
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	// End:0x1B
	if(PropName == "ItemGroup")
	{
		return default.GroupDescText;
	}
	return super(Info).GetDescriptionText(PropName);
	//return;	
}

defaultproperties
{
	ClassGroup0[0]="BallisticProV55.X3Pickup"
	ClassGroup0[1]="BallisticProV55.A909Pickup"
	ClassGroup0[2]="BallisticProV55.EKS43Pickup"
	ClassGroup0[3]="BallisticProV55.M806Pickup"
	ClassGroup0[4]="BallisticProV55.A42Pickup"
	ClassGroup0[5]="BallisticProV55.MRT6Pickup"
	ClassGroup0[6]="BallisticProV55.XK2Pickup"
	ClassGroup0[7]="BallisticProV55.M763Pickup"
	ClassGroup0[8]="BallisticProV55.M290Pickup"
	ClassGroup0[9]="BallisticProV55.A73Pickup"
	ClassGroup0[10]="BallisticProV55.M50Pickup"
	ClassGroup0[11]="BallisticProV55.M353Pickup"
	ClassGroup0[12]="BallisticProV55.M925Pickup"
	ClassGroup0[13]="BallisticProV55.R78Pickup"
	ClassGroup0[14]="BallisticProV55.M75Pickup"
	ClassGroup0[15]="BallisticProV55.G5Pickup"
	ClassGroup0[16]="BallisticProV55.NRP57Pickup"
	ClassGroup0[17]="BallisticProV55.FP7Pickup"
	ClassGroup0[18]="BallisticProV55.FP9Pickup"
	ClassGroup0[19]="BallisticProV55.BX5Pickup"
	ClassGroup0[20]="BallisticProV55.Fifty9Pickup"
	ClassGroup0[21]="BallisticProV55.AM67Pickup"
	ClassGroup0[22]="BallisticProV55.SARPickup"
	ClassGroup0[23]="BallisticProV55.R9Pickup"
	ClassGroup0[24]="BallisticProV55.D49Pickup"
	ClassGroup0[25]="BallisticProV55.T10Pickup"
	ClassGroup0[26]="BallisticProV55.RX22APickup"
	ClassGroup0[27]="BallisticProV55.XMV850Pickup"
	ClassGroup0[28]="BWBPOne.RS8Pickup"
	ClassGroup0[29]="BWBPOne.XRS10Pickup"
	ClassGroup0[30]="BWBPOne.MRS138Pickup"
	ClassGroup0[31]="BWBPTwo.HVCMk9Pickup"
	ClassGroup0[32]="BWBPThree.SRS900Pickup"
	ClassGroup1[0]="BallisticProV55.AP_M806Clip"
	ClassGroup1[1]="BallisticProV55.AP_XK2Clip"
	ClassGroup1[2]="BallisticProV55.AP_12GaugeClips"
	ClassGroup1[3]="BallisticProV55.AP_12GaugeBox"
	ClassGroup1[4]="BallisticProV55.AP_A73Clip"
	ClassGroup1[5]="BallisticProV55.AP_556mmClip"
	ClassGroup1[6]="BallisticProV55.AP_M353Belt"
	ClassGroup1[7]="BallisticProV55.AP_M925Belt"
	ClassGroup1[8]="BallisticProV55.AP_R78Clip"
	ClassGroup1[9]="BallisticProV55.AP_M75Clip"
	ClassGroup1[10]="BallisticProV55.AP_G5Ammo"
	ClassGroup1[11]="BallisticProV55.AP_Fifty9Clip"
	ClassGroup1[12]="BallisticProV55.AP_AM67Clip"
	ClassGroup1[13]="BallisticProV55.AP_SARClip"
	ClassGroup1[14]="BallisticProV55.AP_R9Clip"
	ClassGroup1[15]="BallisticProV55.AP_6Magnum"
	ClassGroup1[16]="BallisticProV55.AP_FlamerGas"
	ClassGroup1[17]="BallisticProV55.AP_XMV850Ammo"
	ClassGroup1[18]="BWBPOne.AP_RS8Clip"
	ClassGroup1[19]="BWBPOne.AP_XRS10Clip"
	ClassGroup1[20]="BWBPOne.AP_MRS138Box"
	ClassGroup1[21]="BWBPTwo.AP_HVCMk9Cell"
	ClassGroup1[22]="BWBPThree.AP_SRS900Clip"
	ClassGroup2[0]="BallisticProV55.IP_HealthKit"
	ClassGroup2[1]="BallisticProV55.IP_Bandage"
	ClassGroup2[2]="BallisticProV55.IP_SuperHealthKit"
	ClassGroup3[0]="BallisticProV55.IP_BigArmor"
	ClassGroup3[1]="BallisticProV55.IP_SmallArmor"
	ClassGroup4[0]="BallisticProV55.IP_Adrenaline"
	ClassGroup4[1]="BallisticProV55.IP_UDamage"
	ClassGroup4[2]="BallisticProV55.IP_AmmoPack"
	SelectedGroup=-1
	NumberText[0]="1: "
	NumberText[1]="2: "
	NumberText[2]="3: "
	NumberText[3]="4: "
	NumberText[4]="5: "
	NumberText[5]="6: "
	NumberText[6]="7: "
	NumberText[7]="8: "
	NumberText[8]="9: "
	NumberText[9]="0: "
	MainPageText[0]="Add Weapons"
	MainPageText[1]="Add Ammo"
	MainPageText[2]="Add Health"
	MainPageText[3]="Add Armor"
	MainPageText[4]="Add Other"
	MainPageText[5]="Add Extra"
	MainPageText[6]="Add Vehicles"
	MainPageText[7]="Remove Item"
	MainPageText[8]="Rotate Item"
	MainPageText[9]="Utils"
	UtilPageText[0]="Grab Item"
	UtilPageText[1]="Control Mode:"
	UtilPageText[2]="Upright Weapons:"
	BackText="Back"
	MoreText="More"
	GroupDisplayText="Itemizer Group"
	GroupDescText="The name of the item layout you want to edit."
	DefaultWeaponName="BallisticProV55.ItemGun"
	GroupName="Itemizer"
	FriendlyName="Itemizer Tool (Pro)"
	Description="Warning: This is not a toy! The Itemizer is a tool to use for manually placing items in maps of any gametype. If you are adding items for a new gametype, you should have prepared an item database before using this tool. In order to play with the items placed by this tool, you will need to use a mutator that uses the Itemizer system, such as Itemizer or Ballistic Weapons."
}
