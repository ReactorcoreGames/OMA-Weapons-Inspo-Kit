class AP_NovaCrystal extends BallisticAmmoPickup;

var Actor GlowA;
var Actor GlowB;
var bool bRemove;
var bool bSleep;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bRemove, bSleep;
}

simulated event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	GlowA = Spawn(Class'BallisticProV55.RSNovaAmmoGlowA', self,, Location);
	GlowB = Spawn(Class'BallisticProV55.RSNovaAmmoGlowB', self,, Location);
	GlowA.SetBase(self);
	GlowB.SetBase(self);
	//return;	
}

simulated event Destroyed()
{
	// End:0x17
	if(GlowA != none)
	{
		GlowA.Destroy();
	}
	// End:0x2E
	if(GlowB != none)
	{
		GlowB.Destroy();
	}
	super(Pickup).Destroyed();
	//return;	
}

simulated function PostNetReceive()
{
	// End:0x44
	if(bSleep)
	{
		// End:0x25
		if(GlowA != none)
		{
			GlowA.bHidden = true;
		}
		// End:0x41
		if(GlowB != none)
		{
			GlowB.bHidden = true;
		}		
	}
	else
	{
		// End:0xD1
		if(!bDeleteMe)
		{
			// End:0x7F
			if(GlowA == none)
			{
				GlowA = Spawn(Class'BallisticProV55.RSNovaAmmoGlowA', self,, Location);
				GlowA.SetBase(self);				
			}
			else
			{
				GlowA.bHidden = false;
			}
			// End:0xC0
			if(GlowB == none)
			{
				GlowB = Spawn(Class'BallisticProV55.RSNovaAmmoGlowB', self,, Location);
				GlowB.SetBase(self);				
			}
			else
			{
				GlowB.bHidden = false;
			}
		}
	}
	// End:0x108
	if(bRemove)
	{
		// End:0xF1
		if(GlowA != none)
		{
			GlowA.Destroy();
		}
		// End:0x108
		if(GlowB != none)
		{
			GlowB.Destroy();
		}
	}
	//return;	
}

state Sleeping
{
	simulated function BeginState()
	{
		// End:0x1C
		if(GlowA != none)
		{
			GlowA.bHidden = true;
		}
		// End:0x38
		if(GlowB != none)
		{
			GlowB.bHidden = true;
		}
		bSleep = true;
		super.BeginState();
		//return;		
	}

	simulated function EndState()
	{
		super.EndState();
		bSleep = false;
		// End:0x9B
		if(!bDeleteMe)
		{
			// End:0x49
			if(GlowA == none)
			{
				GlowA = Spawn(Class'BallisticProV55.RSNovaAmmoGlowA', self,, Location);
				GlowA.SetBase(self);				
			}
			else
			{
				GlowA.bHidden = false;
			}
			// End:0x8A
			if(GlowB == none)
			{
				GlowB = Spawn(Class'BallisticProV55.RSNovaAmmoGlowB', self,, Location);
				GlowB.SetBase(self);				
			}
			else
			{
				GlowB.bHidden = false;
			}
		}
		//return;		
	}
	stop;	
}

state Disabled
{
	simulated function BeginState()
	{
		super.BeginState();
		// End:0x1D
		if(GlowA != none)
		{
			GlowA.Destroy();
		}
		// End:0x34
		if(GlowB != none)
		{
			GlowB.Destroy();
		}
		bRemove = true;
		//return;		
	}
	stop;	
}

defaultproperties
{
	AmmoAmount=21
	InventoryType=Class'BallisticProV55.Ammo_NovaCrystal'
	PickupMessage="You picked up a Nova crystal."
	PickupSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-AmmoPickup'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Nova-Ammo'
	DrawScale=2.5000000
	CollisionRadius=8.0000000
	CollisionHeight=14.2000000
}
