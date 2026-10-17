class E5SecondaryFire extends BallisticProInstantFire;

var bool bLaserFiring;
var Actor MuzzleFlashBeam;
var Sound FireSoundLoop;
var byte SuccessiveHits;

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashBeam);
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x1C
	if(!super(BallisticFire).AllowFire())
	{
		// End:0x1A
		if(bLaserFiring)
		{
			StopFiring();
		}
		return false;
	}
	return true;
	//return;	
}

simulated function bool CheckWeaponMode()
{
	return true;
	//return;	
}

function DoFireEffect()
{
	E5PlasmaRifle(Weapon).SwitchLaser(true);
	super(BallisticInstantFire).DoFireEffect();
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local int AdjustedDamage;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;

	// End:0x57
	if(Instigator != none)
	{
		AdjustedDamage = int((float(Damage) * Instigator.DamageScaling) * DamageType.default.VehicleDamageScaling);
		// End:0x57
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Target);
	// End:0x8B
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Target.Owner);
	}
	// End:0xE2
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedDamage, Instigator.Controller, DamageType);
		return;
	}
	HealVehicle = Vehicle(Target);
	// End:0x149
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedDamage, Instigator.Controller, DamageType);
		return;
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, FMin(float(Damage + int(SuccessiveHits)), 16.0000000), Instigator, HitLocation, MomentumDir, DamageType);
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = MaxRange();
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x5B:

	// End:0x2E6 [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x100
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x2E6;
		}
		// End:0x2CD
		if(Other != none)
		{
			// End:0x172
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2E6;
			}
			LastHitLoc = HitLocation;
			// End:0x26F
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0);
				// End:0x1D6
				if(Pawn(Other) != none)
				{
					++SuccessiveHits;
				}
				// End:0x20A
				if(Vehicle(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);					
				}
				else
				{
					// End:0x26F
					if(Mover(Other) == none)
					{
						bHitWall = true;
						// End:0x255
						if(HitMaterial != none)
						{
							SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));							
						}
						else
						{
							SendFireEffect(Other, HitLocation, HitNormal, 6);
						}
						// [Explicit Break]
						goto J0x2E6;
					}
				}
			}
			// End:0x2BF
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2E6;
			}
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2E6;			
		}
		else
		{
			LastHitLoc = End;
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2E6;
		}
		// [Loop Continue]
		goto J0x5B;
	}
	J0x2E6:

	// End:0x306
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc);
	}
	//return;	
}

function PlayFiring()
{
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	CheckClipFinished();
	// End:0xB4
	if(!bLaserFiring)
	{
		// End:0x42
		if(FireSoundLoop != none)
		{
			Instigator.AmbientSound = FireSoundLoop;
		}
		Instigator.SoundVolume = byte(255);
		Instigator.SoundRadius = 280.0000000;
		// End:0xAC
		if(MuzzleFlashBeam == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashBeam, Class'BWBP_APC_Pro.E5LaserFlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
		}
		bLaserFiring = true;
	}
	//return;	
}

function ServerPlayFiring()
{
	CheckClipFinished();
	// End:0x61
	if((FireSoundLoop != none) && !bLaserFiring)
	{
		Instigator.SoundVolume = byte(255);
		Instigator.SoundRadius = 280.0000000;
		Instigator.AmbientSound = FireSoundLoop;
		bLaserFiring = true;
	}
	//return;	
}

function StopFiring()
{
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashBeam);
	MuzzleFlashBeam = none;
	E5PlasmaRifle(Weapon).SwitchLaser(false);
	bLaserFiring = false;
	Instigator.AmbientSound = none;
	Instigator.SoundVolume = Instigator.default.SoundVolume;
	Instigator.SoundRadius = Instigator.default.SoundRadius;
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	BallisticAttachment(Weapon.ThirdPersonActor).BallisticUpdateHit(Other, HitLocation, HitNormal, Surf, true, WaterHitLoc);
	//return;	
}

defaultproperties
{
	FireSoundLoop=Sound'BW_Core_WeaponSound.VPR.VPR-LaserLoop'
	DamageType=Class'BWBP_APC_Pro.DTE5Laser'
	DamageTypeHead=Class'BWBP_APC_Pro.DTE5LaserHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTE5Laser'
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_E23Cells'
	BotRefireRate=0.9900000
}
