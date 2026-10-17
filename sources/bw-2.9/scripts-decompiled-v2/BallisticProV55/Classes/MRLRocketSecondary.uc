class MRLRocketSecondary extends MRLRocket;

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	Acceleration = Normal(Velocity) * AccelSpeed;
	SetTimer(0.7000000, false);
	// End:0x38
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x78
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0xCF
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

simulated function Timer()
{
	SetCollision(true, true);
	InitProjectile();
	Velocity = Vector(Rotation) * MaxSpeed;
	//return;	
}

defaultproperties
{
	ModeIndex=1
	AccelSpeed=0.0000000
	Speed=250.0000000
	MaxSpeed=12000.0000000
	bCollideActors=false
}
