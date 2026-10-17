class AkeronWarheadHEBurst extends AkeronWarhead
	config(User);

var() Sound RocketLaunchSound;

simulated function PostBeginPlay()
{
	local Vector Dir;

	Dir = Vector(Rotation);
	InitialControllerRotation = Rotation;
	Velocity = AirSpeed * Dir;
	Acceleration = Velocity;
	FiredAt = Level.TimeSeconds;
	// End:0x91
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'BWBP_OP_Pro.AkeronRocketTrailTriple', self,, Location - (float(40) * Dir));
		SmokeTrail.SetBase(self);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x5E
	if(PlayerController(Controller) != none)
	{
		Controller.SetRotation(Rotation);
		PlayerController(Controller).SetViewTarget(self);
		Controller.GotoState(LandMovementState);
		PlayOwnedSound(RocketLaunchSound, 3, 1.0000000);
	}
	//return;	
}

state NetTrapped
{
	ignores BreathTimer;

	function Fire(optional float F)
	{
		//return;		
	}

	function BlowUp(Vector HitLocation)
	{
		//return;		
	}

	function ServerBlowUp()
	{
		//return;		
	}

	function Timer()
	{
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function BeginState()
	{
		AmbientSound = none;
		bStaticScreen = true;
		bTearOff = true;
		bAlwaysRelevant = true;
		bHidden = true;
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		SetPhysics(0);
		// End:0x5C
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		//return;		
	}
Begin:

	Sleep(6.0000000);
	Destroy();
	stop;					
}

defaultproperties
{
	RocketLaunchSound=Sound'BWBP_SKC_Sounds.Misc.M202-FireDumbTriple'
	Damage=310.0000000
	DamageRadius=350.0000000
	ImpactManager=Class'BWBP_OP_Pro.IM_AkeronHETriple'
	AmbientSound=Sound'BWBP_SKC_Sounds.Misc.M202-ControlCritical'
}
