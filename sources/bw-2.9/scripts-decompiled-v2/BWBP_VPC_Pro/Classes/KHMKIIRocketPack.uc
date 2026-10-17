class KHMKIIRocketPack extends ONSWeapon
	config(BWBP_VPC_Pro);

var Vector oldDir;
var Rotator OldRot;
var(Rockets) float VelocitySpreadFactor;
var(Rockets) config float MaxLockRange;
var(Rockets) config float LockAim;
var(Rockets) config int LoadedShotCount;
var(Rockets) config int MaxShotCount;
var bool bReloaded;
var(Rockets) config float ReloadTime;
var(Rockets) config bool bRequiresReloading;
var(Rockets) config bool bRequiresFullLoad;
var(Rockets) config int LoadRate;
var(Rockets) Sound LoadSound;
var(Rockets) float LoadSoundVolume;
var(Rockets) float LoadSoundRadius;
var(Rockets) config int EjectRate;
var(Rockets) Sound EjectSound;
var(Rockets) float EjectSoundVolume;
var(Rockets) float EjectSoundRadius;
var float InitialSpread;
var float NewDualFireOffset;

replication
{
	// Pos:0x000
	reliable if((int(Role) < int(ROLE_Authority)) || int(Role) == int(ROLE_Authority))
		LoadedShotCount, NewDualFireOffset;

	// Pos:0x01F
	reliable if((int(Role) < int(ROLE_Authority)) || int(Role) == int(ROLE_Authority))
		bReloaded;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Enable('Timer');
	SetTimer(ReloadTime, true);
	NewDualFireOffset = DualFireOffset;
	InitialSpread = Spread;
	oldDir = Vector(CurrentAim);
	//return;	
}

simulated function Tick(float Delta)
{
	local int i;
	local xPawn P;
	local Vector NewDir, PawnDir;
	local Coords WeaponBoneCoords;

	super(Actor).Tick(Delta);
	// End:0x2CD
	if((int(Role) == int(ROLE_Authority)) && Base != none)
	{
		WeaponBoneCoords = GetBoneCoords(YawBone);
		NewDir = WeaponBoneCoords.XAxis;
		// End:0x2C2
		if((Vehicle(Base).Controller != none) && NewDir.Z < 0.9000000)
		{
			i = 0;
			J0x7F:

			// End:0x2C2 [Loop If]
			if(i < Base.Attached.Length)
			{
				P = xPawn(Base.Attached[i]);
				// End:0x2B8
				if(((P != none) && int(P.Physics) != int(0)) && P != Vehicle(Base).Driver)
				{
					PawnDir = P.Location - WeaponBoneCoords.Origin;
					PawnDir.Z = 0.0000000;
					PawnDir = Normal(PawnDir);
					// End:0x2B8
					if(((PawnDir.X <= NewDir.X) && PawnDir.X > oldDir.X) || (PawnDir.X >= NewDir.X) && PawnDir.X < oldDir.X)
					{
						// End:0x2B8
						if(((PawnDir.Y <= NewDir.Y) && PawnDir.Y > oldDir.Y) || (PawnDir.Y >= NewDir.Y) && PawnDir.X < oldDir.Y)
						{
							P.SetPhysics(2);
							P.Velocity = WeaponBoneCoords.YAxis;
							// End:0x26B
							if(((NewDir - oldDir) Dot WeaponBoneCoords.YAxis) < float(0))
							{
								P.Velocity *= float(-1);
							}
							P.Velocity = float(500) * (P.Velocity + (0.3000000 * NewDir));
							P.Velocity.Z = 200.0000000;
						}
					}
				}
				i++;
				// [Loop Continue]
				goto J0x7F;
			}
		}
		oldDir = NewDir;
	}
	//return;	
}

simulated function SetSpread(float VehicleSpeed)
{
	Spread = InitialSpread + (VehicleSpeed / VelocitySpreadFactor);
	//return;	
}

simulated event bool AttemptFire(Controller C, bool bAltFire)
{
	// End:0x1D
	if((int(Role) != int(ROLE_Authority)) || bForceCenterAim)
	{
		return false;
	}
	CalcWeaponFire();
	NewDualFireOffset *= float(-1);
	// End:0x4B
	if(LoadedShotCount >= MaxShotCount)
	{
		bReloaded = true;		
	}
	else
	{
		// End:0x5E
		if(LoadedShotCount <= 0)
		{
			bReloaded = false;
		}
	}
	// End:0x134
	if(bRequiresReloading)
	{
		// End:0xD0
		if(bRequiresFullLoad)
		{
			// End:0x9F
			if(bAltFire && bReloaded)
			{
				FireSingle(C, true, true);
				FireCountdown = AltFireInterval;				
			}
			else
			{
				// End:0xCD
				if(!bAltFire && bReloaded)
				{
					FireSingle(C, false, true);
					FireCountdown = FireInterval;
				}
			}			
		}
		else
		{
			// End:0x101
			if(bAltFire && LoadedShotCount > 0)
			{
				FireSingle(C, true, true);
				FireCountdown = AltFireInterval;				
			}
			else
			{
				// End:0x131
				if(!bAltFire && LoadedShotCount > 0)
				{
					FireSingle(C, false, true);
					FireCountdown = FireInterval;
				}
			}
		}		
	}
	else
	{
		// End:0x186
		if(!bRequiresReloading)
		{
			// End:0x163
			if(bAltFire)
			{
				FireSingle(C, true, false);
				FireCountdown = AltFireInterval;				
			}
			else
			{
				// End:0x186
				if(!bAltFire)
				{
					FireSingle(C, false, false);
					FireCountdown = FireInterval;
				}
			}
		}
	}
	return false;
	//return;	
}

simulated function Timer()
{
	// End:0x1A
	if(LoadedShotCount >= MaxShotCount)
	{
		bReloaded = true;		
	}
	else
	{
		// End:0x2D
		if(LoadedShotCount <= 0)
		{
			bReloaded = false;
		}
	}
	// End:0x7A
	if((LoadedShotCount < MaxShotCount) && !bReloaded)
	{
		LoadedShotCount += LoadRate;
		PlaySound(LoadSound,, LoadSoundVolume,, LoadSoundRadius);
		Instigator.MakeNoise(LoadSoundVolume);
	}
	// End:0xAC
	if(Bot(Instigator.Controller) != none)
	{
		Vehicle(Instigator).Rise = 0.0000000;
	}
	//return;	
}

function byte BestMode()
{
	// End:0x36
	if((Instigator.Controller == none) || Instigator.Controller.Target == none)
	{
		return 1;
	}
	// End:0xBD
	if(((Pawn(Instigator.Controller.Target) != none) && !Pawn(Instigator.Controller.Target).bStationary) && Instigator.Controller.Focus == Instigator.Controller.Target)
	{
		return 0;
	}
	return 1;
	//return;	
}

simulated function FireSingle(Controller C, bool bAltFire, optional bool bKill)
{
	// End:0x53
	if(bAltFire && bKill)
	{
		AltFire(C);
		LoadedShotCount -= EjectRate;
		PlaySound(EjectSound,, EjectSoundVolume,, EjectSoundRadius);
		Instigator.MakeNoise(EjectSoundVolume);		
	}
	else
	{
		// End:0xA8
		if(!bAltFire && bKill)
		{
			Fire(C);
			LoadedShotCount -= EjectRate;
			PlaySound(EjectSound,, EjectSoundVolume,, EjectSoundRadius);
			Instigator.MakeNoise(EjectSoundVolume);			
		}
		else
		{
			// End:0xF1
			if(bAltFire && !bKill)
			{
				AltFire(C);
				PlaySound(EjectSound,, EjectSoundVolume,, EjectSoundRadius);
				Instigator.MakeNoise(EjectSoundVolume);				
			}
			else
			{
				// End:0x139
				if(!bAltFire && !bKill)
				{
					Fire(C);
					PlaySound(EjectSound,, EjectSoundVolume,, EjectSoundRadius);
					Instigator.MakeNoise(EjectSoundVolume);
				}
			}
		}
	}
	//return;	
}

simulated function CalcWeaponFire()
{
	local Coords WeaponBoneCoords;
	local Vector CurrentFireOffset;

	WeaponBoneCoords = GetBoneCoords(WeaponFireAttachmentBone);
	CurrentFireOffset = (WeaponFireOffset * vect(1.0000000, 0.0000000, 0.0000000)) + (NewDualFireOffset * vect(0.0000000, 1.0000000, 0.0000000));
	WeaponFireRotation = Rotator(Vector(CurrentAim) >> Rotation);
	WeaponFireLocation = WeaponBoneCoords.Origin + (CurrentFireOffset >> WeaponFireRotation);
	// End:0x94
	if(bDualIndependantTargeting)
	{
		WeaponFireRotation = Rotator(CurrentHitLocation - WeaponFireLocation);
	}
	//return;	
}

simulated state ProjectileFireMode
{
	function Fire(Controller C)
	{
		local KHMKIITrackRocket R;
		local float bestAim, BestDist;

		R = KHMKIITrackRocket(SpawnProjectile(ProjectileClass, false));
		// End:0x93
		if(R != none)
		{
			// End:0x52
			if(AIController(C) != none)
			{
				R.HomingTarget = C.Enemy;				
			}
			else
			{
				bestAim = LockAim;
				R.HomingTarget = C.PickTarget(bestAim, BestDist, Vector(WeaponFireRotation), WeaponFireLocation, MaxLockRange);
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	VelocitySpreadFactor=5000.0000000
	MaxLockRange=18000.0000000
	LockAim=0.8750000
	LoadedShotCount=8
	MaxShotCount=8
	ReloadTime=2.0000000
	bRequiresReloading=true
	bRequiresFullLoad=true
	LoadRate=2
	LoadSound=SoundGroup'BWBP_Vehicles_Sound.Cobra.CobraLoadRockets'
	LoadSoundVolume=255.0000000
	LoadSoundRadius=15.0000000
	EjectRate=1
	EjectSound=Sound'BWBP_Vehicles_Sound.Cobra.CobraEjectRocket'
	EjectSoundVolume=0.5000000
	EjectSoundRadius=600.0000000
	YawStartConstraint=-3000.0000000
	YawEndConstraint=3000.0000000
	PitchBone="KHMKIIRocketPack"
	PitchUpLimit=3000
	PitchDownLimit=55500
	WeaponFireAttachmentBone="FireBone"
	DualFireOffset=192.0000000
	RotationsPerSecond=0.0750000
	bDualIndependantTargeting=true
	Spread=0.0350000
	FireInterval=0.7500000
	AltFireInterval=0.4000000
	FireSoundClass=Sound'BWBP_Vehicles_Sound.Effects.MissileLaunch'
	FireSoundVolume=1024.0000000
	FireSoundRadius=100.0000000
	FireSoundPitch=64.0000000
	AltFireSoundClass=Sound'BWBP_Vehicles_Sound.Effects.MissileLaunch'
	AltFireSoundVolume=1024.0000000
	AltFireSoundRadius=100.0000000
	ProjectileClass=Class'BWBP_VPC_Pro.KHMKIITrackRocket'
	AltFireProjectileClass=Class'BWBP_VPC_Pro.KHMKIIRocket'
	AIInfo=(bTossed=false,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.7500000,RefireRate=0.8000000)
	CullDistance=7000.0000000
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.KHMKIIRocketPack'
	ScaleGlow=0.7500000
	bFullVolume=true
	CollisionRadius=0.0000000
}
