class ONSGrenadeAltFire extends WeaponFire;

var ONSGrenadeLauncher Gun;

function PostBeginPlay()
{
	super.PostBeginPlay();
	Gun = ONSGrenadeLauncher(Weapon);
	//return;	
}

simulated function bool AllowFire()
{
	return Gun.CurrentGrenades > 0;
	//return;	
}

function DoFireEffect()
{
	local int X;

	X = 0;
	J0x07:

	// End:0x99 [Loop If]
	if(X < Gun.Grenades.Length)
	{
		// End:0x8F
		if(Gun.Grenades[X] != none)
		{
			Gun.Grenades[X].Explode(Gun.Grenades[X].Location, vect(0.0000000, 0.0000000, 1.0000000));
			// End:0x8F
			if(Gun == none)
			{
				return;
			}
		}
		X++;
		// [Loop Continue]
		goto J0x07;
	}
	Gun.Grenades.Length = 0;
	Gun.CurrentGrenades = 0;
	//return;	
}

defaultproperties
{
	FireRate=1.0000000
	BotRefireRate=0.0000000
}
