class BCTurretList extends Info
	config(BallisticProV55)
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var array<BallisticTurret> Turrets;
var() globalconfig int MaxTurrets;

static function BCTurretList InitTurretList(Actor A)
{
	local BCTurretList TL;

	// End:0x2D
	if(A != none)
	{
		// End:0x2C
		foreach A.DynamicActors(Class'BCoreProV55.BCTurretList', TL)
		{			
			return TL;			
		}		
	}
	TL = A.Spawn(Class'BCoreProV55.BCTurretList');
	return TL;
	//return;	
}

static function bool AutoInitTurret(BallisticTurret t)
{
	// End:0x0D
	if(t == none)
	{
		return false;
	}
	t.TurretList = InitTurretList(t.Level);
	// End:0x46
	if(t.TurretList == none)
	{
		return false;
	}
	t.TurretList.AddTurret(t);
	t.TurretList.CheckTurretLimit();
	return true;
	//return;	
}

function CheckTurretLimit()
{
	local int i, j;
	local BallisticTurret t, Oldest;

	i = 0;
	J0x07:

	// End:0xC3 [Loop If]
	if(i < Turrets.Length)
	{
		// End:0x3E
		if(Turrets[i] == none)
		{
			Turrets.Remove(i, 1);
			i--;
			// [Explicit Continue]
			goto J0xB9;
		}
		t = Turrets[i];
		// End:0xB9
		if(!t.bIgnoreTurretLimit)
		{
			// End:0xB2
			if((t.Controller == none) && (Oldest == none) || t.LastUsedTime < Oldest.LastUsedTime)
			{
				Oldest = t;
			}
			j++;
		}
		J0xB9:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	// End:0xEE
	if((j > default.MaxTurrets) && Oldest != none)
	{
		Oldest.Retire();
	}
	//return;	
}

function AddTurret(BallisticTurret t)
{
	Turrets[Turrets.Length] = t;
	//return;	
}

function bool RemoveTurret(BallisticTurret t)
{
	local int i;

	// End:0x0D
	if(t == none)
	{
		return false;
	}
	i = 0;
	J0x14:

	// End:0x51 [Loop If]
	if(i < Turrets.Length)
	{
		// End:0x47
		if(Turrets[i] == t)
		{
			Turrets.Remove(i, 1);
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
	MaxTurrets=16
}
