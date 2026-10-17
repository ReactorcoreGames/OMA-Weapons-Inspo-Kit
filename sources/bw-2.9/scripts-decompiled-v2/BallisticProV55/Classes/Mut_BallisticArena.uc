class Mut_BallisticArena extends Mut_Ballistic
	transient
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config array<string> WeaponClassNames;
var() config bool bRandomPickOne;
var() config bool bRandomPerSpawn;
var array< Class<Weapon> > WeaponClasses;

function PreBeginPlay()
{
	local int i;
	local Class<Weapon> W;

	super.PreBeginPlay();
	// End:0x23
	if(bRandomPickOne)
	{
		DefaultWeaponName = WeaponClassNames[Rand(WeaponClassNames.Length)];
	}
	i = 0;
	J0x2A:

	// End:0x82 [Loop If]
	if(i < WeaponClassNames.Length)
	{
		W = Class<Weapon>(DynamicLoadObject(WeaponClassNames[i], Class'Core.Class'));
		// End:0x78
		if(W != none)
		{
			WeaponClasses[WeaponClasses.Length] = W;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	//return;	
}

function ModifyPlayer(Pawn Other)
{
	local int i;
	local byte LP;
	local Class<Weapon> W;

	super.ModifyPlayer(Other);
	// End:0x10F
	if(bRandomPerSpawn)
	{
		W = WeaponClasses[Rand(WeaponClasses.Length)];
		SpawnWeapon(W, Other);
		SpawnAmmo(W.default.FireModeClass[0].default.AmmoClass, Other);
		// End:0xD8
		if((W.default.FireModeClass[1].default.AmmoClass != none) && W.default.FireModeClass[0].default.AmmoClass != W.default.FireModeClass[1].default.AmmoClass)
		{
			SpawnAmmo(W.default.FireModeClass[1].default.AmmoClass, Other);
		}
		Other.Controller.ClientSwitchToBestWeapon();
		xPawn(Other).RequiredEquipment[0] = string(W);
		return;
	}
	// End:0x11A
	if(bRandomPickOne)
	{
		return;
	}
	i = 0;
	J0x121:

	// End:0x26F [Loop If]
	if(i < WeaponClasses.Length)
	{
		SpawnWeapon(WeaponClasses[i], Other);
		// End:0x1A6
		if(int(WeaponClasses[i].default.Priority) > int(LP))
		{
			LP = WeaponClasses[i].default.Priority;
			xPawn(Other).RequiredEquipment[0] = string(WeaponClasses[i]);
		}
		// End:0x265
		if((xPawn(Other) != none) && Class<BallisticHandGrenade>(WeaponClasses[i]) == none)
		{
			SpawnAmmo(WeaponClasses[i].default.FireModeClass[0].default.AmmoClass, Other);
			// End:0x265
			if(WeaponClasses[i].default.FireModeClass[0].default.AmmoClass != WeaponClasses[i].default.FireModeClass[1].default.AmmoClass)
			{
				SpawnAmmo(WeaponClasses[i].default.FireModeClass[1].default.AmmoClass, Other);
			}
		}
		i++;
		// [Loop Continue]
		goto J0x121;
	}
	Other.Controller.ClientSwitchToBestWeapon();
	//return;	
}

function Class<Weapon> MyDefaultWeapon()
{
	// End:0x18
	if(!bRandomPickOne || bRandomPerSpawn)
	{
		return none;
	}
	return super(Mutator).MyDefaultWeapon();
	//return;	
}

function string GetInventoryClassOverride(string InventoryClassName)
{
	return super(Mutator).GetInventoryClassOverride(InventoryClassName);
	//return;	
}

function ItemPickedUp(Pickup Other)
{
	//return;	
}

function ItemChange(Pickup Other)
{
	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i;

	bSuperRelevant = 0;
	// End:0x8B
	if(((Weapon(Other) != none) && !Weapon(Other).bNoInstagibReplace) && Translauncher(Other) == none)
	{
		i = 0;
		J0x4C:

		// End:0x86 [Loop If]
		if(i < WeaponClasses.Length)
		{
			// End:0x7C
			if(WeaponClasses[i] == Other.Class)
			{
				return true;
			}
			i++;
			// [Loop Continue]
			goto J0x4C;
		}
		return false;		
	}
	else
	{
		// End:0xD0
		if(xPawn(Other) != none)
		{
			xPawn(Other).RequiredEquipment[0] = "";
			xPawn(Other).RequiredEquipment[1] = "";
			return true;			
		}
		else
		{
			// End:0xFB
			if((WeaponPickup(Other) != none) && Other.Owner == none)
			{
				return false;				
			}
			else
			{
				// End:0x136
				if(xWeaponBase(Other) != none)
				{
					Other.bHidden = true;
					SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack');
					return false;					
				}
				else
				{
					// End:0x15A
					if(xPickUpBase(Other) != none)
					{
						Other.bHidden = true;						
					}
					else
					{
						// End:0x181
						if(Ammo(Other) != none)
						{
							// End:0x17C
							if(IP_AmmoPack(Other) != none)
							{
								return true;
							}
							return false;							
						}
						else
						{
							// End:0x1C1
							if(Other.IsA('WeaponLocker'))
							{
								// End:0x1C1
								if(!SpawnNewItem(-1, Other, Class'BallisticProV55.IP_AmmoPack'))
								{
									Other.GotoState('Disabled');
									return false;
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
	WeaponClassNames[0]="BallisticProV55.D49Revolver"
	bRandomPickOne=true
	bRandomPerSpawn=true
	bHideLockers=true
	ConfigMenuClassName="BallisticProV55.ConfigMenu_Inventory"
	FriendlyName="BallisticPro: Arena"
	Description="Like arena, but with all Ballistic items and modifications and the option of multiple/random weapons.||http://www.runestorm.com"
}
