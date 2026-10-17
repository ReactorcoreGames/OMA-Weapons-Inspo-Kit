class BC_WeaponInfoCache_GameStyle extends Object
	abstract
	config(BWCache)
	exportstructs;

var() config array<WeaponInfo> Weapons;
var bool bChanged;
var config int SavedRevision;
var int Revision;

static final function CheckRevision()
{
	// End:0x11
	if(default.SavedRevision == default.Revision)
	{
		return;
	}
	default.Weapons.Length = 0;
	default.SavedRevision = default.Revision;
	StaticSaveConfig();
	//return;	
}

static function bool FindWeaponInfo(string cn, out WeaponInfo WI, optional out int Index)
{
	local int i;

	CheckRevision();
	i = 0;
	J0x0D:

	// End:0x5F [Loop If]
	if(i < default.Weapons.Length)
	{
		// End:0x55
		if(default.Weapons[i].ClassName ~= cn)
		{
			Index = i;
			WI = default.Weapons[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	Index = -1;
	return false;
	//return;	
}

static function WeaponInfo AutoWeaponInfo(string WeapClassName, optional out int i)
{
	local WeaponInfo WI;

	CheckRevision();
	// End:0x24
	if(FindWeaponInfo(WeapClassName, WI, i))
	{
		return WI;
	}
	return AddWeaponInfoName(WeapClassName, i);
	//return;	
}

static function WeaponInfo AddWeaponInfoName(string WeapClassName, optional out int i)
{
	local Class<BallisticWeapon> Weap;
	local WeaponInfo WI;

	Weap = Class<BallisticWeapon>(DynamicLoadObject(WeapClassName, Class'Core.Class'));
	// End:0x3F
	if(Weap != none)
	{
		WI = AddWeaponInfo(Weap, i);		
	}
	else
	{
		i = -1;
	}
	return WI;
	//return;	
}

static function WeaponInfo AddWeaponInfo(Class<BallisticWeapon> BW, optional out int i)
{
	local WeaponInfo WI;

	i = -1;
	// End:0x1C
	if(BW == none)
	{
		return WI;
	}
	WI.ClassName = string(BW);
	WI.ItemName = BW.default.ItemName;
	WI.SmallIconMaterial = BW.default.IconMaterial;
	WI.SmallIconCoords = BW.default.IconCoords;
	WI.InventoryGroup = int(BW.default.InventoryGroup);
	WI.BigIconMaterial = BW.default.BigIconMaterial;
	WI.InventorySize = byte(BW.static.GetInventorySize());
	WI.bIsBW = true;
	i = default.Weapons.Length;
	default.Weapons[default.Weapons.Length] = WI;
	default.bChanged = true;
	return WI;
	//return;	
}

static function GetBWWeps(out array<WeaponInfo> BWeps)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x4D [Loop If]
	if(i < default.Weapons.Length)
	{
		// End:0x43
		if(default.Weapons[i].bIsBW)
		{
			BWeps[BWeps.Length] = default.Weapons[i];
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

static function EndSession()
{
	// End:0x0F
	if(default.bChanged)
	{
		StaticSaveConfig();
	}
	default.bChanged = false;
	//return;	
}

