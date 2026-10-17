class BloodSetHunter extends Object;

struct BloodSetMatch
{
	var() string CharacterName;
	var() Class<BallisticBloodSet> BloodSet;
};

var array<BloodSetMatch> Matches;
var array< Class<BloodSetHunter> > Hunters;
var bool bHuntersLoaded;

static function Class<BallisticBloodSet> GetBloodSetFor(Pawn Victim)
{
	local int i, BestWeight;
	local Class<BallisticBloodSet> bs, BestBS;

	// End:0x23
	if((Victim == none) || Victim.PlayerReplicationInfo == none)
	{
		return none;
	}
	i = 0;
	J0x2A:

	// End:0x9C [Loop If]
	if(i < Class'BCoreProV55.BloodSetHunter'.default.Matches.Length)
	{
		// End:0x92
		if(Class'BCoreProV55.BloodSetHunter'.default.Matches[i].CharacterName ~= Victim.PlayerReplicationInfo.CharacterName)
		{
			return Class'BCoreProV55.BloodSetHunter'.default.Matches[i].BloodSet;
		}
		i++;
		// [Loop Continue]
		goto J0x2A;
	}
	// End:0xBB
	if(!Class'BCoreProV55.BloodSetHunter'.default.bHuntersLoaded)
	{
		LoadHunters(Victim);
	}
	i = 0;
	J0xC2:

	// End:0x129 [Loop If]
	if(i < Class'BCoreProV55.BloodSetHunter'.default.Hunters.Length)
	{
		bs = Class'BCoreProV55.BloodSetHunter'.default.Hunters[i].PickBloodSet(Victim, BestWeight);
		// End:0x11F
		if(bs != none)
		{
			BestBS = bs;
		}
		i++;
		// [Loop Continue]
		goto J0xC2;
	}
	// End:0x142
	if(BestBS != none)
	{
		bs = BestBS;		
	}
	else
	{
		bs = PickBloodSet(Victim, BestWeight);
	}
	Class'BCoreProV55.BloodSetHunter'.default.Matches.Length = i + 1;
	Class'BCoreProV55.BloodSetHunter'.default.Matches[i].CharacterName = Victim.PlayerReplicationInfo.CharacterName;
	Class'BCoreProV55.BloodSetHunter'.default.Matches[i].BloodSet = bs;
	return bs;
	//return;	
}

static function Class<BallisticBloodSet> PickBloodSet(Pawn Victim, out int Weight)
{
	return Class'BCoreProV55.BallisticBloodSet';
	//return;	
}

static function LoadHunters(Pawn Victim)
{
	local int i;
	local array<string> HunterList;
	local Class<BloodSetHunter> HC;

	Victim.GetAllInt("BloodSetHunter", HunterList);
	i = 0;
	J0x2B:

	// End:0x95 [Loop If]
	if(i < HunterList.Length)
	{
		HC = Class<BloodSetHunter>(DynamicLoadObject(HunterList[i], Class'Core.Class'));
		// End:0x8B
		if(HC != none)
		{
			Class'BCoreProV55.BloodSetHunter'.default.Hunters[Class'BCoreProV55.BloodSetHunter'.default.Hunters.Length] = HC;
		}
		i++;
		// [Loop Continue]
		goto J0x2B;
	}
	Class'BCoreProV55.BloodSetHunter'.default.bHuntersLoaded = true;
	//return;	
}

