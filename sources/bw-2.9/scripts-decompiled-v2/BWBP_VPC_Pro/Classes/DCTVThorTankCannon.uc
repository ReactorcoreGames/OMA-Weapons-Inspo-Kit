class DCTVThorTankCannon extends ONSHoverTankCannon;

var() Sound TurretTurnSound;
var float TurretStopTurnSoundTime;
var int LastTurretYaw;

function Projectile SpawnProjectile(Class<Projectile> ProjClass, bool bAltFire)
{
	local Projectile P;
	local ONSWeaponPawn WeaponPawn;
	local Vector StartLocation, HitLocation, HitNormal, Extent;

	// End:0x19A
	if(bDoOffsetTrace)
	{
		Extent = ProjClass.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
		Extent.Z = ProjClass.default.CollisionHeight;
		WeaponPawn = ONSWeaponPawn(Owner);
		// End:0x111
		if((WeaponPawn != none) && WeaponPawn.VehicleBase != none)
		{
			// End:0xE3
			if(!WeaponPawn.VehicleBase.TraceThisActor(HitLocation, HitNormal, WeaponFireLocation, WeaponFireLocation + (Vector(WeaponFireRotation) * (WeaponPawn.VehicleBase.CollisionRadius * 1.5000000)), Extent))
			{
				StartLocation = HitLocation;				
			}
			else
			{
				StartLocation = WeaponFireLocation + (Vector(WeaponFireRotation) * (ProjClass.default.CollisionRadius * 1.1000000));
			}			
		}
		else
		{
			// End:0x16C
			if(!Owner.TraceThisActor(HitLocation, HitNormal, WeaponFireLocation, WeaponFireLocation + (Vector(WeaponFireRotation) * (Owner.CollisionRadius * 1.5000000)), Extent))
			{
				StartLocation = HitLocation;				
			}
			else
			{
				StartLocation = WeaponFireLocation + (Vector(WeaponFireRotation) * (ProjClass.default.CollisionRadius * 1.1000000));
			}
		}		
	}
	else
	{
		StartLocation = WeaponFireLocation;
	}
	P = Spawn(ProjClass, self,, StartLocation + (vect(0.0000000, 32.0000000, 0.0000000) >> WeaponFireRotation), WeaponFireRotation);
	// End:0x207
	if(P != none)
	{
		// End:0x207
		if(bInheritVelocity)
		{
			P.Velocity = Instigator.Velocity;
		}
	}
	P = Spawn(ProjClass, self,, StartLocation + (vect(0.0000000, -32.0000000, 0.0000000) >> WeaponFireRotation), WeaponFireRotation);
	// End:0x2EB
	if(P != none)
	{
		// End:0x269
		if(bInheritVelocity)
		{
			P.Velocity = Instigator.Velocity;
		}
		FlashMuzzleFlash();
		// End:0x2B3
		if(bAltFire)
		{
			// End:0x28F
			if(bAmbientAltFireSound)
			{
				AmbientSound = AltFireSoundClass;				
			}
			else
			{
				PlayOwnedSound(AltFireSoundClass, 0, FireSoundVolume / 255.0000000,, AltFireSoundRadius,, false);
			}			
		}
		else
		{
			// End:0x2CA
			if(bAmbientFireSound)
			{
				AmbientSound = FireSoundClass;				
			}
			else
			{
				PlayOwnedSound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
			}
		}
	}
	return P;
	//return;	
}

simulated event Tick(float dt)
{
	local Rotator R;

	super.Tick(dt);
	R = GetBoneRotation(YawBone);
	R = Normalize(R - Rotation);
	// End:0x78
	if((Abs(float(R.Yaw - LastTurretYaw)) / dt) > float(2048))
	{
		TurretStopTurnSoundTime = Level.TimeSeconds + 0.1500000;
	}
	LastTurretYaw = R.Yaw;
	// End:0xAA
	if(Level.TimeSeconds >= TurretStopTurnSoundTime)
	{
		AmbientSound = none;		
	}
	else
	{
		AmbientSound = TurretTurnSound;
	}
	//return;	
}

defaultproperties
{
	TurretTurnSound=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankTurret'
	YawBone="Turret"
	PitchBone="Cannon"
	PitchUpLimit=8000
	PitchDownLimit=62000
	WeaponFireAttachmentBone="Muzzle"
	WeaponFireOffset=0.0000000
	RotationsPerSecond=0.0800000
	RedSkin=Texture'BWBP_Vehicles_Tex.ThorTank.Tank'
	BlueSkin=Texture'BWBP_Vehicles_Tex.ThorTank.TankBlue'
	EffectEmitterClass=Class'BWBP_VPC_Pro.DCTVThorMuzzleFlash'
	FireSoundClass=Sound'BWBP_Vehicles_Sound.ThorTank.ThorTankCannon'
	ProjectileClass=Class'BWBP_VPC_Pro.DCTVThorTankShell'
	AIInfo=(bTossed=true,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.7500000,RefireRate=0.8000000)
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.ThorTankTurret'
	SoundVolume=192
	SoundPitch=32
}
