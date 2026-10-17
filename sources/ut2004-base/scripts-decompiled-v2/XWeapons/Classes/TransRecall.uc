class TransRecall extends WeaponFire;

var() Sound TransFailedSound;
var bool bGibMe;
var Material TransMaterials[2];

simulated function PlayFiring()
{
	// End:0x32
	if(Translauncher(Weapon).bBeaconDeployed)
	{
		Weapon.PlayAnim(FireAnim, FireAnimRate, TweenTime);
	}
	//return;	
}

simulated function bool AllowFire()
{
	local bool success;

	success = Translauncher(Weapon).AmmoChargeF >= 1.0000000;
	// End:0x9D
	if((!success && int(Weapon.Role) == int(ROLE_Authority)) && Translauncher(Weapon).TransBeacon != none)
	{
		// End:0x9D
		if(PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).ClientPlaySound(TransFailedSound);
		}
	}
	return success;
	//return;	
}

function bool AttemptTranslocation(Vector Dest, TransBeacon TransBeacon)
{
	local Vector OldLocation, HitLocation, HitNormal;
	local Actor HitActor;

	OldLocation = Instigator.Location;
	// End:0x2B
	if(!TranslocSucceeded(Dest, TransBeacon))
	{
		return false;
	}
	HitActor = Weapon.Trace(HitLocation, HitNormal, Instigator.Location, Dest, false);
	// End:0x94
	if(((HitActor == none) || !HitActor.bBlockActors) || !HitActor.bBlockNonZeroExtentTraces)
	{
		return true;
	}
	Instigator.SetLocation(OldLocation);
	return false;
	//return;	
}

function bool TranslocSucceeded(Vector Dest, TransBeacon TransBeacon)
{
	local Vector newdest;

	// End:0x21
	if(Instigator.SetLocation(Dest) || BotTranslocation())
	{
		return true;
	}
	// End:0x86
	if(int(TransBeacon.Physics) != int(0))
	{
		newdest = TransBeacon.Location - (Instigator.CollisionRadius * Normal(TransBeacon.Velocity));
		// End:0x86
		if(Instigator.SetLocation(newdest))
		{
			return true;
		}
	}
	// End:0xBF
	if((Dest != TransBeacon.Location) && Instigator.SetLocation(TransBeacon.Location))
	{
		return true;
	}
	newdest = Dest + (Instigator.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000));
	// End:0xFF
	if(Instigator.SetLocation(newdest))
	{
		return true;
	}
	newdest = Dest + (Instigator.CollisionRadius * vect(1.0000000, -1.0000000, 0.0000000));
	// End:0x13F
	if(Instigator.SetLocation(newdest))
	{
		return true;
	}
	newdest = Dest + (Instigator.CollisionRadius * vect(-1.0000000, 1.0000000, 0.0000000));
	// End:0x17F
	if(Instigator.SetLocation(newdest))
	{
		return true;
	}
	newdest = Dest + (Instigator.CollisionRadius * vect(-1.0000000, -1.0000000, 0.0000000));
	// End:0x1BF
	if(Instigator.SetLocation(newdest))
	{
		return true;
	}
	return false;
	//return;	
}

function Translocate()
{
	local TransBeacon TransBeacon;
	local Actor HitActor;
	local Vector HitNormal, HitLocation, Dest, Vel2D, PrevLocation, diff,
		newdest;

	local xPawn xp;
	local Controller C;
	local bool bFailedTransloc;
	local int EffectNum;
	local float DiffZ;

	// End:0x1F
	if((Instigator == none) || Translauncher(Weapon) == none)
	{
		return;
	}
	TransBeacon = Translauncher(Weapon).TransBeacon;
	// End:0x90
	if(TransBeacon.Disrupted())
	{
		UnrealMPGameInfo(Level.Game).SpecialEvent(Instigator.PlayerReplicationInfo, "translocate_gib");
		bGibMe = true;
		return;
	}
	Dest = TransBeacon.Location;
	// End:0xE4
	if(int(TransBeacon.Physics) == int(0))
	{
		Dest += (vect(0.0000000, 0.0000000, 1.0000000) * Instigator.CollisionHeight);		
	}
	else
	{
		Dest += (vect(0.0000000, 0.0000000, 0.5000000) * Instigator.CollisionHeight);
	}
	HitActor = Weapon.Trace(HitLocation, HitNormal, Dest, TransBeacon.Location, true);
	// End:0x157
	if(HitActor != none)
	{
		Dest = TransBeacon.Location;
	}
	TransBeacon.SetCollision(false, false, false);
	// End:0x1B9
	if(Instigator.PlayerReplicationInfo.HasFlag != none)
	{
		Instigator.PlayerReplicationInfo.HasFlag.Drop(0.5000000 * Instigator.Velocity);
	}
	PrevLocation = Instigator.Location;
	C = Level.ControllerList;
	J0x1E1:

	// End:0x419 [Loop If]
	if(C != none)
	{
		// End:0x402
		if((C.Pawn != none) && C.Pawn != Instigator)
		{
			diff = Dest - C.Pawn.Location;
			DiffZ = diff.Z;
			diff.Z = 0.0000000;
			// End:0x402
			if((Abs(DiffZ) < (C.Pawn.CollisionHeight + (float(2) * Instigator.CollisionHeight))) && VSize(diff) < ((C.Pawn.CollisionRadius + Instigator.CollisionRadius) + float(8)))
			{
				// End:0x34A
				if(C.SameTeamAs(Instigator.Controller) || (Level.TimeSeconds - C.Pawn.SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
				{
					bFailedTransloc = true;
					// [Explicit Break]
					goto J0x419;					
				}
				else
				{
					// End:0x3AA
					if(DiffZ > (1.5000000 * C.Pawn.CollisionHeight))
					{
						newdest = Dest;
						newdest.Z += (0.7000000 * C.Pawn.CollisionHeight);						
					}
					else
					{
						newdest = Dest + ((0.5000000 * C.Pawn.CollisionRadius) * Normal(diff));
					}
					// End:0x402
					if(Weapon.FastTrace(newdest, Dest))
					{
						Dest = newdest;
					}
				}
			}
		}
		C = C.nextController;
		// [Loop Continue]
		goto J0x1E1;
	}
	J0x419:

	// End:0x670
	if(!bFailedTransloc && AttemptTranslocation(Dest, TransBeacon))
	{
		Translauncher(Weapon).ReduceAmmo();
		xp = xPawn(Instigator);
		// End:0x47C
		if(xp != none)
		{
			xp.DoTranslocateOut(PrevLocation);
		}
		Vel2D = Instigator.Velocity;
		Vel2D.Z = 0.0000000;
		Vel2D = Normal(Vel2D) * FMin(Instigator.GroundSpeed, VSize(Vel2D));
		Vel2D.Z = Instigator.Velocity.Z;
		Instigator.Velocity = Vel2D;
		// End:0x53B
		if(Instigator.PlayerReplicationInfo.Team != none)
		{
			EffectNum = Instigator.PlayerReplicationInfo.Team.TeamIndex;
		}
		Instigator.SetOverlayMaterial(TransMaterials[EffectNum], 1.0000000, false);
		Instigator.PlayTeleportEffect(false, false);
		// End:0x617
		if(!Instigator.PhysicsVolume.bWaterVolume)
		{
			// End:0x609
			if(Bot(Instigator.Controller) != none)
			{
				Instigator.Velocity.X = 0.0000000;
				Instigator.Velocity.Y = 0.0000000;
				Instigator.Velocity.Z = -150.0000000;
				Instigator.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
			}
			Instigator.SetPhysics(2);
		}
		// End:0x66D
		if(UnrealTeamInfo(Instigator.PlayerReplicationInfo.Team) != none)
		{
			UnrealTeamInfo(Instigator.PlayerReplicationInfo.Team).AI.CallForBall(Instigator);
		}		
	}
	else
	{
		// End:0x6AB
		if(PlayerController(Instigator.Controller) != none)
		{
			PlayerController(Instigator.Controller).ClientPlaySound(TransFailedSound);
		}
	}
	TransBeacon.Destroy();
	Translauncher(Weapon).TransBeacon = none;
	Translauncher(Weapon).ViewPlayer();
	//return;	
}

function ModeDoFire()
{
	local TransBeacon TransBeacon;

	super.ModeDoFire();
	// End:0x9D
	if((int(Weapon.Role) == int(ROLE_Authority)) && bGibMe)
	{
		TransBeacon = Translauncher(Weapon).TransBeacon;
		Translauncher(Weapon).TransBeacon = none;
		Translauncher(Weapon).ViewPlayer();
		Instigator.gibbedBy(TransBeacon.Disruptor);
		TransBeacon.Destroy();
		bGibMe = false;
	}
	//return;	
}

function DoFireEffect()
{
	// End:0x1F
	if(Translauncher(Weapon).TransBeacon != none)
	{
		Translocate();
	}
	//return;	
}

function bool BotTranslocation()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x52
	if(((B == none) || !B.bPreparingMove) || B.RealTranslocationTarget == none)
	{
		return false;
	}
	return Instigator.SetLocation(B.RealTranslocationTarget.Location);
	//return;	
}

defaultproperties
{
	TransFailedSound=Sound'WeaponSounds.BaseGunTech.BSeekLost1'
	TransMaterials[0]=Shader'XGameShaders.PlayerShaders.PlayerTransRed'
	TransMaterials[1]=Shader'XGameShaders.PlayerShaders.PlayerTrans'
	bModeExclusive=false
	FireAnim="Recall"
	FireRate=0.2500000
	BotRefireRate=0.3000000
}
