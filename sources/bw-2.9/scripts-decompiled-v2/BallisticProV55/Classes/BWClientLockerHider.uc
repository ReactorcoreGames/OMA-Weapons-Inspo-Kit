class BWClientLockerHider extends Info
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var bool bHideLockers;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x24
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Destroy();
		return;
	}
	SetTimer(0.0500000, false);
	//return;	
}

simulated function Timer()
{
	local xPickUpBase PB;
	local WeaponLocker W;

	// End:0x5C
	foreach AllActors(Class'Engine.xPickUpBase', PB)
	{
		PB.bHidden = true;
		PB.SetDrawType(0);
		// End:0x5B
		if(PB.myEmitter != none)
		{
			PB.myEmitter.Destroy();
		}		
	}	
	// End:0xA9
	foreach AllActors(Class'XWeapons.WeaponLocker', W)
	{
		// End:0xA8
		if(bHideLockers)
		{
			W.GotoState('Disabled');
			W.bHidden = true;
			W.SetDrawType(0);
		}		
	}	
	Destroy();
	//return;	
}

