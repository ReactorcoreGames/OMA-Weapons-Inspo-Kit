class ONSRVWebLauncher extends ONSWeapon
	notplaceable;

var() float SpreadAngle;
var() float InheritVelocityScale;
var() float MinProjectiles;
var() float MaxProjectiles;
var() float MaxHoldTime;
var float StartHoldTime;
var bool bHoldingFire;
var Sound ChargeUpSound;
var Sound ChargeLoop;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.PowerBolt');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.ElecPanels');
	L.AddPrecacheMaterial(Texture'EpicParticles.Beams.HotBolt03aw');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.HardSpot');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.PowerBolt');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Energy.ElecPanels');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Beams.HotBolt03aw');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.HardSpot');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'AW-2004Particles.Weapons.ONSMuzzleFlash');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

simulated function SetFireRateModifier(float Modifier)
{
	super.SetFireRateModifier(Modifier);
	MaxHoldTime = default.MaxHoldTime / Modifier;
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

simulated function float MaxRange()
{
	AimTraceRange = 6000.0000000;
	return AimTraceRange;
	//return;	
}

simulated function float ChargeBar()
{
	// End:0x30
	if(bHoldingFire)
	{
		return FMin(Level.TimeSeconds - StartHoldTime, MaxHoldTime) / MaxHoldTime;		
	}
	else
	{
		return 0.0000000;
	}
	//return;	
}

state ProjectileFireMode
{
	simulated function OwnerEffects()
	{
		// End:0x46
		if(((int(Role) < int(ROLE_Authority)) && !bHoldingFire) && !bIsAltFire)
		{
			bHoldingFire = true;
			StartHoldTime = Level.TimeSeconds;
		}
		//return;		
	}

	simulated function ClientStopFire(Controller C, bool bWasAltFire)
	{
		super(ONSWeapon).ClientStopFire(C, bWasAltFire);
		// End:0x38
		if(FireCountdown <= float(0))
		{
			ClientPlayForceFeedback("BioRifleFire");
			ShakeView();
		}
		// End:0xAE
		if(int(Role) < int(ROLE_Authority))
		{
			bHoldingFire = false;
			// End:0xAE
			if(FireCountdown <= float(0))
			{
				// End:0x74
				if(bIsAltFire)
				{
					FireCountdown = AltFireInterval;					
				}
				else
				{
					FireCountdown = FireInterval;
				}
				FlashMuzzleFlash();
				// End:0xAE
				if(!bIsAltFire)
				{
					PlaySound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
				}
			}
		}
		//return;		
	}

	function Fire(Controller C)
	{
		// End:0x3B
		if(!bHoldingFire)
		{
			StartHoldTime = Level.TimeSeconds;
			bHoldingFire = true;
			AmbientSound = ChargeUpSound;
			SetTimer(MaxHoldTime, false);
		}
		//return;		
	}

	function Timer()
	{
		// End:0x14
		if(bHoldingFire)
		{
			AmbientSound = ChargeLoop;
		}
		//return;		
	}

	function CeaseFire(Controller C)
	{
		local Vector GunDir, RightDir, FireDir;
		local int i, NumProjectiles;
		local float SpreadAngleRad, FireAngleRad;
		local ONSRVWebProjectileLeader Leader;
		local ONSRVWebProjectile P;

		// End:0x0D
		if(!bHoldingFire)
		{
			return;
		}
		ClientPlayForceFeedback("BioRifleFire");
		AmbientSound = none;
		CalcWeaponFire();
		// End:0x44
		if(bCorrectAim)
		{
			WeaponFireRotation = AdjustAim(false);
		}
		GunDir = Vector(WeaponFireRotation);
		RightDir = Normal(GunDir Cross vect(0.0000000, 0.0000000, 1.0000000));
		NumProjectiles = int(MinProjectiles + ((MaxProjectiles - MinProjectiles) * (FMin(Level.TimeSeconds - StartHoldTime, MaxHoldTime) / MaxHoldTime)));
		bHoldingFire = false;
		SpreadAngleRad = SpreadAngle * (3.1415930 / 180.0000000);
		i = 0;
		J0xD5:

		// End:0x27F [Loop If]
		if(i < NumProjectiles)
		{
			FireAngleRad = ((-0.5000000 * SpreadAngleRad) * float(NumProjectiles - 1)) + (float(i) * SpreadAngleRad);
			FireDir = (Cos(FireAngleRad) * GunDir) + (Sin(FireAngleRad) * RightDir);
			// End:0x1FF
			if(i == 0)
			{
				Leader = Spawn(Class'Onslaught.ONSRVWebProjectileLeader', self,, WeaponFireLocation, Rotator(FireDir));
				// End:0x1FC
				if(Leader != none)
				{
					Leader.Velocity += (InheritVelocityScale * Instigator.Velocity);
					Leader.Projectiles.Length = NumProjectiles;
					Leader.ProjTeam = byte(C.GetTeamNum());
					Leader.Projectiles[0] = Leader;
					Leader.ProjNumber = 0;
					Leader.Leader = Leader;
				}
				// [Explicit Continue]
				goto J0x275;
			}
			P = Spawn(Class'Onslaught.ONSRVWebProjectile', self,, WeaponFireLocation, Rotator(FireDir));
			// End:0x275
			if((P != none) && Leader != none)
			{
				Leader.Projectiles[i] = P;
				P.ProjNumber = i;
				P.Leader = Leader;
			}
			J0x275:

			i++;
			// [Loop Continue]
			goto J0xD5;
		}
		ShakeView();
		FlashMuzzleFlash();
		// End:0x2A2
		if(bAmbientFireSound)
		{
			AmbientSound = FireSoundClass;			
		}
		else
		{
			PlayOwnedSound(FireSoundClass, 0, FireSoundVolume / 255.0000000,, FireSoundRadius,, false);
		}
		FireCountdown = FireInterval;
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpreadAngle=10.0000000
	MinProjectiles=3.0000000
	MaxProjectiles=7.0000000
	MaxHoldTime=2.0000000
	ChargeUpSound=Sound'ONSVehicleSounds-S.RV.RVChargeUp01'
	ChargeLoop=Sound'ONSVehicleSounds-S.RV.RVChargeLoop01'
	YawBone="rvGUNTurret"
	PitchBone="rvGUNbody"
	WeaponFireAttachmentBone="RVfirePoint"
	bShowChargingBar=true
	bDoOffsetTrace=true
	FireInterval=1.0000000
	FlashEmitterClass=Class'Onslaught.ONSRVWebLauncherMuzzleFlash'
	FireSoundClass=Sound'ONSVehicleSounds-S.WebLauncher.WebFire'
	FireSoundVolume=255.0000000
	DamageType=Class'Onslaught.DamTypeONSChainGun'
	ProjectileClass=Class'Onslaught.ONSRVWebProjectile'
	AIInfo=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=true,aimerror=600.0000000,WarnTargetPct=0.5000000,RefireRate=0.6500000)
	CullDistance=7500.0000000
	Mesh=SkeletalMesh'ONSWeapons-A.RVnewGun'
	SoundVolume=150
}
