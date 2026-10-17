class AlbatrossBomber extends ONSWeapon;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	L.AddPrecacheMaterial(Texture'AS_FX_TX.Trails.Trail_Blue');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlickerFlare');
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	L.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	L.AddPrecacheMaterial(Texture'AS_FX_TX.Trails.Trail_Blue');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	L.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	L.AddPrecacheMaterial(Texture'XEffects.Skins.Rexpt');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	L.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	Level.AddPrecacheMaterial(Texture'AS_FX_TX.Trails.Trail_Blue');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlickerFlare');
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	Level.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	Level.AddPrecacheMaterial(Texture'AS_FX_TX.Trails.Trail_Blue');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.SmokeReOrdered');
	Level.AddPrecacheMaterial(Texture'ExplosionTex.Framed.exp2_frames');
	Level.AddPrecacheMaterial(Texture'XEffects.Skins.Rexpt');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

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
	StartLocation += ((Vector(Base.Rotation) * float(-32)) + vect(0.0000000, 0.0000000, -32.0000000));
	P = Spawn(ProjClass, self,, StartLocation, Base.Rotation);
	// End:0x2AA
	if(P != none)
	{
		// End:0x228
		if(bInheritVelocity)
		{
			P.Velocity = Instigator.Velocity;
		}
		FlashMuzzleFlash();
		// End:0x272
		if(bAltFire)
		{
			// End:0x24E
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
			// End:0x289
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

defaultproperties
{
	YawBone="GatlingGun"
	PitchBone="GatlingGun"
	PitchUpLimit=2000
	PitchDownLimit=-16000
	WeaponFireAttachmentBone="GatlingGunFirePoint"
	FireInterval=0.4000000
	FireSoundClass=SoundGroup'BW_Core_WeaponSound.FP9A5.FP9-Bounce'
	FireForce="RocketLauncherFire"
	ProjectileClass=Class'BWBP_VPC_Pro.AlbatrossBomb'
	AIInfo=(bTossed=false,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	Mesh=SkeletalMesh'ONSBPAnimations.DualAttackCraftGatlingGunMesh'
	CollisionRadius=60.0000000
}
