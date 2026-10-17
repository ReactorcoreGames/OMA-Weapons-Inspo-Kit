class MutOnslaughtWeapons extends Mutator
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config string ReplacedWeaponClassNames0;
var() config string ReplacedWeaponClassNames1;
var() config string ReplacedWeaponClassNames2;
var() config bool bConfigUseOnslaughtWeapon0;
var() config bool bConfigUseOnslaughtWeapon1;
var() config bool bConfigUseOnslaughtWeapon2;
var() byte bUseOnslaughtWeapon[3];
var Class<Weapon> ReplacedWeaponClasses[3];
var Class<WeaponPickup> ReplacedWeaponPickupClasses[3];
var Class<Ammo> ReplacedAmmoPickupClasses[3];
var Class<Weapon> OnslaughtWeaponClasses[3];
var string OnslaughtWeaponPickupClassNames[3];
var string OnslaughtAmmoPickupClassNames[3];
var localized string ONSWeaponDisplayText[6];
var localized string ONSWeaponDescText[6];

function PostBeginPlay()
{
	local int FireMode, X;
	local string ReplacedWeaponPickupClassName;

	X = 0;
	J0x07:

	// End:0x1B6 [Loop If]
	if(X < 3)
	{
		bUseOnslaughtWeapon[X] = byte(bool(GetPropertyText("bConfigUseOnslaughtWeapon" $ string(X))));
		ReplacedWeaponClasses[X] = Class<Weapon>(DynamicLoadObject(GetPropertyText("ReplacedWeaponClassNames" $ string(X)), Class'Core.Class'));
		ReplacedWeaponPickupClassName = string(ReplacedWeaponClasses[X].default.PickupClass);
		FireMode = 0;
		J0xB5:

		// End:0x18A [Loop If]
		if(FireMode < 2)
		{
			// End:0x180
			if(((ReplacedWeaponClasses[X].default.FireModeClass[FireMode] != none) && ReplacedWeaponClasses[X].default.FireModeClass[FireMode].default.AmmoClass != none) && ReplacedWeaponClasses[X].default.FireModeClass[FireMode].default.AmmoClass.default.PickupClass != none)
			{
				ReplacedAmmoPickupClasses[X] = Class<Ammo>(ReplacedWeaponClasses[X].default.FireModeClass[FireMode].default.AmmoClass.default.PickupClass);
				// [Explicit Break]
				goto J0x18A;
			}
			FireMode++;
			// [Loop Continue]
			goto J0xB5;
		}
		J0x18A:

		OnslaughtWeaponPickupClassNames[X] = string(OnslaughtWeaponClasses[X].default.PickupClass);
		X++;
		// [Loop Continue]
		goto J0x07;
	}
	super(Actor).PostBeginPlay();
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int X, i;
	local WeaponLocker L;

	bSuperRelevant = 0;
	// End:0x8F
	if(xWeaponBase(Other) != none)
	{
		X = 0;
		J0x1F:

		// End:0x8C [Loop If]
		if(X < 3)
		{
			// End:0x82
			if((int(bUseOnslaughtWeapon[X]) == 1) && xWeaponBase(Other).WeaponType == ReplacedWeaponClasses[X])
			{
				xWeaponBase(Other).WeaponType = OnslaughtWeaponClasses[X];
			}
			X++;
			// [Loop Continue]
			goto J0x1F;
		}		
	}
	else
	{
		// End:0x10A
		if(Weapon(Other) != none)
		{
			// End:0xB5
			if(Other.IsA('BallLauncher'))
			{
				return true;
			}
			X = 0;
			J0xBC:

			// End:0x107 [Loop If]
			if(X < 3)
			{
				// End:0xFD
				if((int(bUseOnslaughtWeapon[X]) == 1) && Other.Class == ReplacedWeaponClasses[X])
				{
					return false;
				}
				X++;
				// [Loop Continue]
				goto J0xBC;
			}			
		}
		else
		{
			// End:0x185
			if(WeaponPickup(Other) != none)
			{
				X = 0;
				J0x121:

				// End:0x182 [Loop If]
				if(X < 3)
				{
					// End:0x178
					if((int(bUseOnslaughtWeapon[X]) == 1) && Other.Class == ReplacedWeaponPickupClasses[X])
					{
						ReplaceWith(Other, OnslaughtWeaponPickupClassNames[X]);
						return false;
					}
					X++;
					// [Loop Continue]
					goto J0x121;
				}				
			}
			else
			{
				// End:0x200
				if(Ammo(Other) != none)
				{
					X = 0;
					J0x19C:

					// End:0x1FD [Loop If]
					if(X < 3)
					{
						// End:0x1F3
						if((int(bUseOnslaughtWeapon[X]) == 1) && Other.Class == ReplacedAmmoPickupClasses[X])
						{
							ReplaceWith(Other, OnslaughtAmmoPickupClassNames[X]);
							return false;
						}
						X++;
						// [Loop Continue]
						goto J0x19C;
					}					
				}
				else
				{
					// End:0x2C8
					if(WeaponLocker(Other) != none)
					{
						L = WeaponLocker(Other);
						X = 0;
						J0x227:

						// End:0x2C8 [Loop If]
						if(X < 3)
						{
							// End:0x2BE
							if(int(bUseOnslaughtWeapon[X]) == 1)
							{
								i = 0;
								J0x24D:

								// End:0x2BE [Loop If]
								if(i < L.Weapons.Length)
								{
									// End:0x2B4
									if(L.Weapons[i].WeaponClass == ReplacedWeaponClasses[X])
									{
										L.Weapons[i].WeaponClass = OnslaughtWeaponClasses[X];
									}
									i++;
									// [Loop Continue]
									goto J0x24D;
								}
							}
							X++;
							// [Loop Continue]
							goto J0x227;
						}
					}
				}
			}
		}
	}
	return true;
	//return;	
}

function string GetInventoryClassOverride(string InventoryClassName)
{
	local int X;

	X = 0;
	J0x07:

	// End:0x42 [Loop If]
	if(X < 3)
	{
		// End:0x38
		if(InventoryClassName ~= string(ReplacedWeaponClasses[X]))
		{
			return string(OnslaughtWeaponClasses[X]);
		}
		X++;
		// [Loop Continue]
		goto J0x07;
	}
	return super.GetInventoryClassOverride(InventoryClassName);
	//return;	
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
	local array<WeaponRecord> Recs;
	local string WeaponOptions;
	local int i;

	super(Info).FillPlayInfo(PlayInfo);
	Class'Engine.CacheManager'.static.GetWeaponList(Recs);
	i = 0;
	J0x23:

	// End:0x85 [Loop If]
	if(i < Recs.Length)
	{
		// End:0x4B
		if(WeaponOptions != "")
		{
			WeaponOptions $= ";";
		}
		WeaponOptions $= ((Recs[i].ClassName $ ";") $ Recs[i].FriendlyName);
		i++;
		// [Loop Continue]
		goto J0x23;
	}
	PlayInfo.AddSetting(default.RulesGroup, "bConfigUseOnslaughtWeapon0", default.ONSWeaponDisplayText[0], 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "ReplacedWeaponClassNames0", default.ONSWeaponDisplayText[1], 0, 1, "Select", WeaponOptions);
	PlayInfo.AddSetting(default.RulesGroup, "bConfigUseOnslaughtWeapon1", default.ONSWeaponDisplayText[2], 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "ReplacedWeaponClassNames1", default.ONSWeaponDisplayText[3], 0, 1, "Select", WeaponOptions);
	PlayInfo.AddSetting(default.RulesGroup, "bConfigUseOnslaughtWeapon2", default.ONSWeaponDisplayText[4], 0, 1, "Check");
	PlayInfo.AddSetting(default.RulesGroup, "ReplacedWeaponClassNames2", default.ONSWeaponDisplayText[5], 0, 1, "Select", WeaponOptions);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	// End:0x2E
	if(PropName == "bConfigUseOnslaughtWeapon0")
	{
		return default.ONSWeaponDescText[0];
	}
	// End:0x5B
	if(PropName == "ReplacedWeaponClassNames0")
	{
		return default.ONSWeaponDescText[1];
	}
	// End:0x8A
	if(PropName == "bConfigUseOnslaughtWeapon1")
	{
		return default.ONSWeaponDescText[2];
	}
	// End:0xB8
	if(PropName == "ReplacedWeaponClassNames1")
	{
		return default.ONSWeaponDescText[3];
	}
	// End:0xE7
	if(PropName == "bConfigUseOnslaughtWeapon2")
	{
		return default.ONSWeaponDescText[4];
	}
	// End:0x115
	if(PropName == "ReplacedWeaponClassNames2")
	{
		return default.ONSWeaponDescText[5];
	}
	return super(Info).GetDescriptionText(PropName);
	//return;	
}

defaultproperties
{
	ReplacedWeaponClassNames0="XWeapons.RocketLauncher"
	ReplacedWeaponClassNames1="XWeapons.BioRifle"
	ReplacedWeaponClassNames2="XWeapons.FlakCannon"
	bConfigUseOnslaughtWeapon1=true
	bConfigUseOnslaughtWeapon2=true
	OnslaughtWeaponClasses[0]=Class'Onslaught.ONSAVRiL'
	OnslaughtWeaponClasses[1]=Class'Onslaught.ONSMineLayer'
	OnslaughtWeaponClasses[2]=Class'Onslaught.ONSGrenadeLauncher'
	OnslaughtAmmoPickupClassNames[0]="Onslaught.ONSAVRiLAmmoPickup"
	OnslaughtAmmoPickupClassNames[1]="Onslaught.ONSMineAmmoPickup"
	OnslaughtAmmoPickupClassNames[2]="Onslaught.ONSGrenadeAmmoPickup"
	ONSWeaponDisplayText[0]="Include AVRiL"
	ONSWeaponDisplayText[1]="Replace this with AVRiL"
	ONSWeaponDisplayText[2]="Include Mine Layer"
	ONSWeaponDisplayText[3]="Replace this with Mine Layer"
	ONSWeaponDisplayText[4]="Include Grenade Launcher"
	ONSWeaponDisplayText[5]="Replace this with Grenade Launcher"
	ONSWeaponDescText[0]="Choose if the AVRiL will be added to the game"
	ONSWeaponDescText[1]="Replace this weapon with the AVRiL"
	ONSWeaponDescText[2]="Choose if the Mine Layer will be added to the game"
	ONSWeaponDescText[3]="Replace this weapon with the Mine Layer"
	ONSWeaponDescText[4]="Choose if the Grenade Launcher will be added to the game"
	ONSWeaponDescText[5]="Replace this weapon with the Grenade Launcher"
	GroupName="Arena"
	FriendlyName="Onslaught Weapons"
	Description="Add the Onslaught weapons to other gametypes."
}
