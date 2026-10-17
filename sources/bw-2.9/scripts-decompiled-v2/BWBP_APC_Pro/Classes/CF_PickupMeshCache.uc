class CF_PickupMeshCache extends Object
	config(CrazyFroggersMeshCache)
	exportstructs;

struct PickupMeshInfo
{
	var() config string ClassName;
	var() config Rotator Rotation;
	var() config Vector Location;
	var() config float DrawScale;
	var() config int AnimNo;
	var array<byte> AlphaTex;
};

var() config array<PickupMeshInfo> PickupMeshs;

static function bool FindWeaponInfo(string cn, out PickupMeshInfo PMI, optional out int Index)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x59 [Loop If]
	if(i < default.PickupMeshs.Length)
	{
		// End:0x4F
		if(default.PickupMeshs[i].ClassName ~= cn)
		{
			Index = i;
			PMI = default.PickupMeshs[i];
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	Index = -1;
	return false;
	//return;	
}

static function PickupMeshInfo AutoWeaponInfo(string WeapClassName, optional out int i)
{
	local PickupMeshInfo PMI;

	FindWeaponInfo(WeapClassName, PMI, i);
	return PMI;
	//return;	
}

defaultproperties
{
	PickupMeshs=/* ERROR: System.ArgumentOutOfRangeException */
}
