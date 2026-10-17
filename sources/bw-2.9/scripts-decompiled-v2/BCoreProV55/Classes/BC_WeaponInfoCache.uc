class BC_WeaponInfoCache extends Object
	abstract
	exportstructs;

struct WeaponInfo
{
	var() config string ClassName;
	var() config string ItemName;
	var() config Material SmallIconMaterial;
	var() config IntBox SmallIconCoords;
	var() config int InventoryGroup;
	var() config Material BigIconMaterial;
	var() config byte InventorySize;
	var() config bool bIsBW;
};

var array< Class<BC_WeaponInfoCache_GameStyle> > CacheClasses;

static final function Class<BC_WeaponInfoCache_GameStyle> CurrentCache()
{
	return default.CacheClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)];
	//return;	
}

static function bool FindWeaponInfo(string cn, out WeaponInfo WI, optional out int Index)
{
	return static.CurrentCache().FindWeaponInfo(cn, WI, Index);
	//return;	
}

static function WeaponInfo AutoWeaponInfo(string WeapClassName, optional out int i)
{
	return static.CurrentCache().AutoWeaponInfo(WeapClassName, i);
	//return;	
}

static function WeaponInfo AddWeaponInfoName(string WeapClassName, optional out int i)
{
	return static.CurrentCache().AddWeaponInfoName(WeapClassName, i);
	//return;	
}

static function WeaponInfo AddWeaponInfo(Class<BallisticWeapon> Weap, optional out int i)
{
	return static.CurrentCache().AddWeaponInfo(Weap, i);
	//return;	
}

static function bool IsValid(coerce string S)
{
	// End:0xE0
	if((((((((InStr(S, "Recolors") != -1) || InStr(S, "Prototypes") != -1) || InStr(S, "WeaponPack") != -1) || InStr(S, "V2") != -1) || InStr(S, "KabPack") != -1) || InStr(S, "Extreme") != -1) || InStr(S, "Fix") != -1) || InStr(S, "OtherPack") != -1)
	{
		return false;
	}
	return true;
	//return;	
}

static function GetBWWeps(out array<WeaponInfo> BWeps)
{
	static.CurrentCache().GetBWWeps(BWeps);
	//return;	
}

static function EndSession()
{
	static.CurrentCache().EndSession();
	//return;	
}

defaultproperties
{
	CacheClasses[0]=Class'BCoreProV55.WeaponInfoCache_Pro'
	CacheClasses[1]=Class'BCoreProV55.WeaponInfoCache_Classic'
	CacheClasses[2]=Class'BCoreProV55.WeaponInfoCache_Realism'
	CacheClasses[3]=Class'BCoreProV55.WeaponInfoCache_Tactical'
}
