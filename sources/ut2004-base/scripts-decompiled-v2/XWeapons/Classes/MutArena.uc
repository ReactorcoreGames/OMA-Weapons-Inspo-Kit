class MutArena extends Mutator
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() config string ArenaWeaponClassName;
var bool bInitialized;
var Class<Weapon> ArenaWeaponClass;
var string ArenaWeaponPickupClassName;
var string ArenaAmmoPickupClassName;
var localized string ArenaDisplayText;
var localized string ArenaDescText;

simulated function BeginPlay()
{
	local WeaponLocker L;

	// End:0x21
	foreach AllActors(Class'XWeapons.WeaponLocker', L)
	{
		L.GotoState('Disabled');		
	}	
	super(Actor).BeginPlay();
	//return;	
}

function Initialize()
{
	local int FireMode;

	bInitialized = true;
	DefaultWeaponName = ArenaWeaponClassName;
	ArenaWeaponClass = Class<Weapon>(DynamicLoadObject(ArenaWeaponClassName, Class'Core.Class'));
	DefaultWeapon = ArenaWeaponClass;
	ArenaWeaponPickupClassName = string(ArenaWeaponClass.default.PickupClass);
	FireMode = 0;
	J0x56:

	// End:0x10A [Loop If]
	if(FireMode < 2)
	{
		// End:0x100
		if(((ArenaWeaponClass.default.FireModeClass[FireMode] != none) && ArenaWeaponClass.default.FireModeClass[FireMode].default.AmmoClass != none) && ArenaWeaponClass.default.FireModeClass[FireMode].default.AmmoClass.default.PickupClass != none)
		{
			ArenaAmmoPickupClassName = string(ArenaWeaponClass.default.FireModeClass[FireMode].default.AmmoClass.default.PickupClass);
			// [Explicit Break]
			goto J0x10A;
		}
		FireMode++;
		// [Loop Continue]
		goto J0x56;
	}
	J0x10A:

	//return;	
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	// End:0x11
	if(!bInitialized)
	{
		Initialize();
	}
	bSuperRelevant = 0;
	// End:0x45
	if(xWeaponBase(Other) != none)
	{
		xWeaponBase(Other).WeaponType = ArenaWeaponClass;		
	}
	else
	{
		// End:0x95
		if((Weapon(Other) != none) && Other.Class != ArenaWeaponClass)
		{
			// End:0x90
			if(Weapon(Other).bNoInstagibReplace)
			{
				bSuperRelevant = 0;
				return true;
			}
			return false;			
		}
		else
		{
			// End:0xD4
			if((WeaponPickup(Other) != none) && string(Other.Class) != ArenaWeaponPickupClassName)
			{
				ReplaceWith(Other, ArenaWeaponPickupClassName);				
			}
			else
			{
				// End:0x113
				if((Ammo(Other) != none) && string(Other.Class) != ArenaAmmoPickupClassName)
				{
					ReplaceWith(Other, ArenaAmmoPickupClassName);					
				}
				else
				{
					// End:0x137
					if(Other.IsA('WeaponLocker'))
					{
						Other.GotoState('Disabled');
					}
					return true;
				}
			}
		}
	}
	return false;
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
	PlayInfo.AddSetting(default.RulesGroup, "ArenaWeaponClassName", default.ArenaDisplayText, 0, 1, "Select", WeaponOptions);
	//return;	
}

static event string GetDescriptionText(string PropName)
{
	// End:0x26
	if(PropName == "ArenaWeaponClassName")
	{
		return default.ArenaDescText;
	}
	return super(Info).GetDescriptionText(PropName);
	//return;	
}

defaultproperties
{
	ArenaWeaponClassName="XWeapons.RocketLauncher"
	ArenaDisplayText="Arena Weapon"
	ArenaDescText="Determines which weapon will be used in the arena match"
	GroupName="Arena"
	FriendlyName="Arena"
	Description="Replace weapons and ammo in map."
	bNetTemporary=true
	bAlwaysRelevant=true
	RemoteRole=2
}
