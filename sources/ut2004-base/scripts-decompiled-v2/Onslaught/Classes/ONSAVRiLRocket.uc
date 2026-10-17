class ONSAVRiLRocket extends Projectile;

var Emitter SmokeTrail;
var Effects Corona;
var float AccelerationAddPerSec;
var bool bLockedOn;
var float LeadTargetDelay;
var float LeadTargetStartTime;
var Actor OverrideTarget;
var Vehicle HomingTarget;

replication
{
	// Pos:0x000
	reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
		HomingTarget, OverrideTarget, 
		bLockedOn;
}

simulated function Destroyed()
{
	// End:0x1A
	if(SmokeTrail != none)
	{
		SmokeTrail.Kill();
	}
	// End:0x31
	if(Corona != none)
	{
		Corona.Destroy();
	}
	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 2.5000000 * TransientSoundVolume);
	// End:0x80
	if(!bNoFX && EffectIsRelevant(Location, false))
	{
		Spawn(Class'Onslaught.ONSAVRiLRocketExplosion',,, Location, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
	}
	// End:0xEC
	if((((Instigator != none) && Instigator.IsLocallyControlled()) && Instigator.Weapon != none) && !Instigator.Weapon.HasAmmo())
	{
		Instigator.Weapon.DoAutoSwitch();
	}
	// End:0x11F
	if(ONSAVRiL(Owner) != none)
	{
		ONSAVRiL(Owner).PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3', 3, 0.0100000,, TransientSoundRadius);
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	Dir = Vector(Rotation);
	// End:0x64
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrail = Spawn(Class'Onslaught.ONSAvrilSmokeTrail',,, Location - (float(15) * Dir));
		SmokeTrail.SetBase(self);
		Corona = Spawn(Class'XEffects.RocketCorona', self);
	}
	Velocity = Speed * Dir;
	Acceleration = Dir;
	// End:0xA5
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	// End:0xC7
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	SetTimer(0.1000000, true);
	LeadTargetStartTime = Level.TimeSeconds + LeadTargetDelay;
	super.PostBeginPlay();
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

simulated function Timer()
{
	local Vector Dir, ForceDir;
	local float VelMag, LowestDesiredZ;
	local array<Vehicle> TargetPawns;
	local bool bLastLockedOn;
	local int i;
	local Actor NewTarget;

	// End:0x19D
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xED
		if(OverrideTarget == none)
		{
			// End:0xE2
			if(((Instigator != none) && Instigator.Controller != none) && ONSAVRiL(Owner) != none)
			{
				bLastLockedOn = bLockedOn;
				bLockedOn = ONSAVRiL(Owner).bLockedOn;
				HomingTarget = ONSAVRiL(Owner).HomingTarget;
				// End:0xDF
				if(!bLastLockedOn && bLockedOn)
				{
					// End:0xDF
					if((HomingTarget != none) && HomingTarget.Controller != none)
					{
						HomingTarget.Controller.ReceiveProjectileWarning(self);
					}
				}				
			}
			else
			{
				bLockedOn = false;
			}			
		}
		else
		{
			bLockedOn = true;
		}
		// End:0x19D
		if(HomingTarget != none)
		{
			// End:0x128
			if(!HomingTarget.VerifyLock(self, NewTarget))
			{
				OverrideTarget = NewTarget;				
			}
			else
			{
				OverrideTarget = none;
				HomingTarget.IncomingMissile(self);
				TargetPawns = HomingTarget.GetTurrets();
				TargetPawns[TargetPawns.Length] = HomingTarget;
				i = 0;
				J0x16D:

				// End:0x19D [Loop If]
				if(i < TargetPawns.Length)
				{
					TargetPawns[i].ShouldTargetMissile(self);
					i++;
					// [Loop Continue]
					goto J0x16D;
				}
			}
		}
	}
	// End:0x3DA
	if(bLockedOn && (HomingTarget != none) || OverrideTarget != none)
	{
		// End:0x221
		if(OverrideTarget != none)
		{
			// End:0x213
			if(VSize(OverrideTarget.Location - Location) < float(256))
			{
				OverrideTarget.Destroy();
				TakeDamage(20000, none, Location, Velocity, none);
				return;
			}
			NewTarget = OverrideTarget;			
		}
		else
		{
			NewTarget = HomingTarget;
		}
		// End:0x260
		if(Pawn(NewTarget) != none)
		{
			Dir = Pawn(NewTarget).GetTargetLocation() - Location;			
		}
		else
		{
			Dir = NewTarget.Location - Location;
		}
		VelMag = VSize(Velocity);
		// End:0x37F
		if(Level.TimeSeconds >= LeadTargetStartTime)
		{
			ForceDir = Dir + ((NewTarget.Velocity * VSize(Dir)) / (VelMag * float(2)));
			// End:0x30D
			if(Instigator != none)
			{
				LowestDesiredZ = FMin(Instigator.Location.Z, NewTarget.Location.Z);				
			}
			else
			{
				LowestDesiredZ = NewTarget.Location.Z;
			}
			// End:0x36F
			if((ForceDir.Z + Location.Z) < LowestDesiredZ)
			{
				ForceDir.Z += (LowestDesiredZ - (ForceDir.Z + Location.Z));
			}
			ForceDir = Normal(ForceDir);			
		}
		else
		{
			ForceDir = Dir;
		}
		ForceDir = Normal(((ForceDir * 0.8000000) * VelMag) + Velocity);
		Velocity = VelMag * ForceDir;
		Acceleration += (float(5) * ForceDir);
		SetRotation(Rotator(Velocity));
	}
	//return;	
}

simulated function Tick(float DeltaTime)
{
	// End:0x2E
	if(VSize(Velocity) >= MaxSpeed)
	{
		Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
		Disable('Tick');		
	}
	else
	{
		Acceleration += (Normal(Velocity) * (AccelerationAddPerSec * DeltaTime));
	}
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x23
	if(Damage > 0)
	{
		Explode(HitLocation, vect(0.0000000, 0.0000000, 0.0000000));
	}
	//return;	
}

simulated event PostRender2D(Canvas C, float ScreenLocX, float ScreenLocY)
{
	local PlayerController PC;

	// End:0x87
	if(bLockedOn)
	{
		PC = Level.GetLocalPlayerController();
		// End:0x87
		if(((PC != none) && PC.Pawn != none) && ONSWeaponPawn(PC.Pawn) != none)
		{
			ONSWeaponPawn(PC.Pawn).ProjectilePostRender2D(self, C, ScreenLocX, ScreenLocY);
		}
	}
	//return;	
}

defaultproperties
{
	AccelerationAddPerSec=750.0000000
	LeadTargetDelay=1.0000000
	Speed=550.0000000
	MaxSpeed=2800.0000000
	Damage=125.0000000
	DamageRadius=150.0000000
	MomentumTransfer=50000.0000000
	MyDamageType=Class'Onslaught.DamTypeONSAVRiLRocket'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	bScriptPostRender=true
	DrawType=8
	StaticMesh=StaticMesh'VMWeaponsSM.AVRiLGroup.AVRiLprojectileSM'
	bNetTemporary=false
	bUpdateSimulatedPosition=true
	bIgnoreVehicles=true
	LifeSpan=7.0000000
	DrawScale=0.2000000
	AmbientGlow=96
	bProjTarget=true
	bUseCylinderCollision=false
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
