class BallisticMod extends Info
	config(BallisticProV55)
	exportstructs
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ELLHDetailMode
{
	DM_SuperLow,                    // 0
	DM_Low,                         // 1
	DM_High                         // 2
};

var() globalconfig BallisticMod.ELLHDetailMode EffectsDetailMode;
var() globalconfig bool bEjectBrass;
var() globalconfig bool bMuzzleSmoke;
var() globalconfig bool bBulletFlybys;
var() globalconfig bool bUseMotionBlur;
var BallisticMod BallisticMod;

static function InitializeMod()
{
	Log("Ballistic Core: Initialized Mod: FIXME");
	//return;	
}

static function BallisticMod Get(Actor A)
{
	local BallisticMod BM;

	// End:0x11
	if(default.BallisticMod != none)
	{
		return default.BallisticMod;
	}
	// End:0x48
	foreach A.AllActors(Class'BCoreProV55.BallisticMod', BM)
	{
		// End:0x47
		if(BM != none)
		{
			default.BallisticMod = BM;			
			return default.BallisticMod;
		}		
	}	
	return none;
	//return;	
}

defaultproperties
{
	EffectsDetailMode=2
	bEjectBrass=true
	bMuzzleSmoke=true
	bBulletFlybys=true
	bAlwaysRelevant=true
	RemoteRole=2
}
