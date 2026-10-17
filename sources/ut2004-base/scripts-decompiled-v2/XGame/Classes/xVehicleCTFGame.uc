class xVehicleCTFGame extends xCTFGame
	config
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var(LoadingHints) private localized array<localized string> VCTFHints;

function bool AllowTransloc()
{
	return false;
	//return;	
}

static function bool NeverAllowTransloc()
{
	return true;
	//return;	
}

static function array<string> GetAllLoadHints(optional bool bThisClassOnly)
{
	local int i;
	local array<string> Hints;

	// End:0x25
	if(!bThisClassOnly || default.VCTFHints.Length == 0)
	{
		Hints = super(CTFGame).GetAllLoadHints();
	}
	i = 0;
	J0x2C:

	// End:0x5E [Loop If]
	if(i < default.VCTFHints.Length)
	{
		Hints[Hints.Length] = default.VCTFHints[i];
		i++;
		// [Loop Continue]
		goto J0x2C;
	}
	return Hints;
	//return;	
}

defaultproperties
{
	VCTFHints[0]="You can't carry the flag in a Manta or a Raptor."
	bAllowTrans=false
	bDefaultTranslocator=false
	bAllowVehicles=true
	MapListType="XInterface.MapListVehicleCTF"
	MapPrefix="VCTF"
	BeaconName="VCTF"
	GameName="Vehicle CTF"
	Description="Like traditional Capture The Flag, only adding vehicles into the mix! Only ground-based vehicles can carry the flag."
	ScreenShotName="UT2004Thumbnails.VCTFShots"
	DecoTextName="XGame.xVehicleCTFGame"
	Acronym="VCTF"
}
