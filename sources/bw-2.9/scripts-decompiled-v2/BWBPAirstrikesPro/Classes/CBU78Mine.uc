class CBU78Mine extends CBU78MineBase;

var xEmitter ProjBeam;
var float mineTraceRange;
var bool bMinePlanted;
var bool bUseRealisticGrenade;

simulated function Destroyed()
{
	// End:0x17
	if(ProjBeam != none)
	{
		ProjBeam.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local PlayerController PC;
	local float InstigatorPitch;
	local Vector OwnerVelocity;

	super(Projectile).PostBeginPlay();
	// End:0x90
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x90
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(65000))
		{
			Trail = Spawn(Class'XEffects.GrenadeSmokeTrail', self,, Location, Rotation);
		}
	}
	Velocity = Speed * Vector(Rotation);
	// End:0xC8
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	// End:0xFC
	if((int(Role) == int(ROLE_Authority)) && Instigator != none)
	{
		Team = byte(Instigator.GetTeamNum());
	}
	// End:0x265
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x12B
		if(Instigator != none)
		{
			OwnerVelocity = Instigator.Velocity;
		}
		// End:0x265
		if((Instigator.IsHumanControlled() && Instigator != none) && PlayerController(Instigator.Controller) != none)
		{
			InstigatorPitch = float(Instigator.Controller.Rotation.Pitch);
			// End:0x1C2
			if((InstigatorPitch > float(49152)) && InstigatorPitch < float(65536))
			{
				InstigatorPitch = 65536.0000000 - InstigatorPitch;				
			}
			else
			{
				InstigatorPitch = 0.0000000;
			}
			// End:0x265
			if(bUseRealisticGrenade)
			{
				Velocity.X += (OwnerVelocity.X * 0.5000000);
				Velocity.Y += (OwnerVelocity.Y * 0.5000000);
				Velocity.Z += ((0.9000000 * ((Sin(((3.1415930 * InstigatorPitch) / float(16384)) + ((float(3) * 3.1415930) / float(2))) + float(1)) * 0.5000000)) * OwnerVelocity.Z);
			}
		}
	}
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	// End:0x1B
	if(bMinePlanted)
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x92
	if((((!bMinePlanted && !bPendingDelete) && Base == none) && Other != IgnoreActor) && (!Other.bWorldGeometry && Other.Class != Class) && (Other != Instigator) || bCanHitOwner)
	{
		Stick(Other, HitLocation);
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local PlayerController PC;
	local Actor HitActor;
	local Vector BeamHitLocation, BeamHitNormal, EndTrace;

	// End:0x2D
	if((Vehicle(Wall) != none) && !bMinePlanted)
	{
		Touch(Wall);
		return;		
	}
	else
	{
		// End:0xDA
		if(!bMinePlanted)
		{
			PlaySound(Sound'MenuSounds.select3',, 2.5000000 * TransientSoundVolume);
			bBounce = false;
			SetPhysics(0);
			bCollideWorld = false;
			SetRotation(Rotator(HitNormal));
			EndTrace = Location + (Vector(Rotation) * mineTraceRange);
			HitActor = Instigator.Trace(BeamHitLocation, BeamHitNormal, EndTrace, Location, false);
			// End:0xDA
			if(HitActor != none)
			{
				// End:0xD2
				if(int(Level.NetMode) != int(NM_DedicatedServer))
				{
				}
				bMinePlanted = true;
			}
		}
	}
	// End:0xF9
	if(Trail != none)
	{
		Trail.mRegen = false;		
	}
	else
	{
		// End:0x12C
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(250))
		{
			PlaySound(ImpactSound, 1);
		}
		// End:0x20E
		if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && (Level.TimeSeconds - LastSparkTime) > 0.5000000) && EffectIsRelevant(Location, false))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x1FA
			if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(15000))
			{
				Spawn(HitEffectClass,,, Location, Rotator(HitNormal));
			}
			LastSparkTime = Level.TimeSeconds;
		}
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	local Actor HitActor;
	local Vector BeamHitLocation, BeamHitNormal, EndTrace;

	// End:0x112
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x112
		if(bMinePlanted)
		{
			EndTrace = Location + (Vector(Rotation) * mineTraceRange);
			HitActor = Trace(BeamHitLocation, BeamHitNormal, EndTrace, Location, true);
			// End:0x112
			if((Pawn(HitActor) != none) && (Pawn(HitActor).GetTeamNum() != int(Team)) || Pawn(HitActor).GetTeamNum() == 255)
			{
				DamageRadius *= 1.1500000;
				// End:0xC8
				if(Vehicle(HitActor) != none)
				{
					Damage *= float(2);
				}
				SetRotation(Rotator(BeamHitLocation - Location));
				SetPhysics(2);
				Velocity = (Vector(Rotation) * float(2)) * Speed;
				bCollideWorld = true;
				Explode(Location, Vector(Rotation));
			}
		}
	}
	// End:0x149
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && ProjBeam != none)
	{
		ProjBeam.SetLocation(Location);
	}
	super(Actor).Tick(DeltaTime);
	//return;	
}

defaultproperties
{
	mineTraceRange=65000.0000000
	Speed=2000.0000000
	MaxSpeed=2000.0000000
	Damage=225.0000000
	DamageRadius=250.0000000
	DrawScale=0.1200000
}
