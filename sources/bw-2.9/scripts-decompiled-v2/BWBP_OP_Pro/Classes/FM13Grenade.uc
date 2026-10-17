class FM13Grenade extends BallisticGrenade;

var FM13FireControl FireControl;

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	SetTimer(0.2000000, false);
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	// End:0x2B
	if(!bHasImpacted)
	{
		DetonateOn = 1;		
	}
	else
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0x38
	if(int(Role) == int(ROLE_Authority))
	{
		OilBlowUp(HitLocation, HitNormal);
	}
	// End:0x99
	if(ImpactManager != none)
	{
		// End:0x7A
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x11B
	if(((bTearOnExplode && !bNetTemporary) && int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function OilBlowUp(Vector HitLocation, Vector HitNormal)
{
	local int i, Count;
	local Vector Start, End, HitLoc, HitNorm;
	local Rotator direction;
	local Actor t;
	local FM13GasBurst GF;

	Start = Location + (HitNormal * float(16));
	Count = 0;
	i = 0;
	J0x26:

	// End:0x1B2 [Loop If]
	if((i < 50) && Count < 24)
	{
		// End:0xFC
		if(Count > 0)
		{
			End = VRand();
			// End:0x85
			if(End.Z < 0.2500000)
			{
				End.Z = FMax(Abs(End.Z), 0.2500000);
			}
			direction = Rotator(End);
			End = Start + (End * DamageRadius);
			t = Trace(HitLoc, HitNorm, End, Start);
			// End:0xDF
			if(t == none)
			{
				HitLoc = End;
			}
			GF = Spawn(Class'BWBP_OP_Pro.FM13GasBurst', self,, HitLoc, direction);			
		}
		else
		{
			GF = Spawn(Class'BWBP_OP_Pro.FM13GasBurst', self,, Start, rot(16384, 0, 0));
		}
		// End:0x1A8
		if(GF != none)
		{
			Count++;
			GF.Instigator = Instigator;
			// End:0x194
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				GF.InstigatorController = Instigator.Controller;
			}
			GF.FireControl = FireControl;
		}
		i++;
		// [Loop Continue]
		goto J0x26;
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x25
	if(int(DetonateOn) == int(1))
	{
		Explode(Location, HitNormal);
		return;		
	}
	else
	{
		// End:0x4B
		if((int(DetonateOn) == int(2)) && !bHasImpacted)
		{
			SetTimer(DetonateDelay, false);
		}
	}
	// End:0x73
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.2000000;
		DampenFactorParallel *= 0.2000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0xDD
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity / float(2));
	// End:0x12C
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x129
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x1FC
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C3
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x1FC
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

defaultproperties
{
	DetonateOn=1
	PlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=1.0000000
	ImpactDamage=20
	ImpactDamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	ImpactManager=Class'BWBP_OP_Pro.IM_FM13Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=3500.0000000
	Damage=30.0000000
	DamageRadius=64.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_FM13Shotgun'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade'
	bIgnoreTerminalVelocity=true
}
