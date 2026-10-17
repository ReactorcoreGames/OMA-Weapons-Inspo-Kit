class SandbagList extends Info
	config(BallisticProV55)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<Sandbag> Bags;
var() globalconfig int MaxBags;

static function SandbagList InitSandbagList(Actor A)
{
	local SandbagList SL;

	// End:0x2D
	if(A != none)
	{
		// End:0x2C
		foreach A.DynamicActors(Class'BallisticProV55.SandbagList', SL)
		{			
			return SL;			
		}		
	}
	SL = A.Spawn(Class'BallisticProV55.SandbagList');
	return SL;
	//return;	
}

static function bool AutoInitBag(Sandbag S)
{
	// End:0x0D
	if(S == none)
	{
		return false;
	}
	S.BagList = InitSandbagList(S.Level);
	// End:0x46
	if(S.BagList == none)
	{
		return false;
	}
	S.BagList.AddBag(S);
	S.BagList.TrimBags();
	return true;
	//return;	
}

function TrimBags()
{
	J0x00:
	// End:0x29 [Loop If]
	if(Bags.Length > MaxBags)
	{
		Bags[0].Destroy();
		Bags.Remove(0, 1);
		// [Loop Continue]
		goto J0x00;
	}
	//return;	
}

function AddBag(Sandbag S)
{
	Bags[Bags.Length] = S;
	//return;	
}

function bool RemoveBag(Sandbag S)
{
	local int i;

	// End:0x0D
	if(S == none)
	{
		return false;
	}
	i = 0;
	J0x14:

	// End:0x51 [Loop If]
	if(i < Bags.Length)
	{
		// End:0x47
		if(Bags[i] == S)
		{
			Bags.Remove(i, 1);
			return true;
		}
		i++;
		// [Loop Continue]
		goto J0x14;
	}
	return false;
	//return;	
}

defaultproperties
{
	MaxBags=30
}
