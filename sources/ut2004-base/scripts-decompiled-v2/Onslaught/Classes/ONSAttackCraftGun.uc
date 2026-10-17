class ONSAttackCraftGun extends ONSWeapon
	notplaceable;

var Class<Projectile> TeamProjectileClasses[2];
var float MinAim;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStarRed');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadRed');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadBlue');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	L.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlashFlare1');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaFlare');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStarRed');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadRed');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaHeadBlue');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels1');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaStar2');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Flares.FlashFlare1');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.PlasmaFlare');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

function byte BestMode()
{
	local Bot B;

	B = Bot(Instigator.Controller);
	// End:0x27
	if(B == none)
	{
		return 0;
	}
	// End:0xA7
	if(((Vehicle(B.Enemy) != none) && B.Enemy.bCanFly || B.Enemy.IsA('ONSHoverCraft')) && FRand() < (0.3000000 + (0.1000000 * B.Skill)))
	{
		return 1;		
	}
	else
	{
		return 0;
	}
	//return;	
}

state ProjectileFireMode
{
	function Fire(Controller C)
	{
		// End:0x52
		if((Vehicle(Owner) != none) && int(Vehicle(Owner).Team) < 2)
		{
			ProjectileClass = TeamProjectileClasses[int(Vehicle(Owner).Team)];			
		}
		else
		{
			ProjectileClass = TeamProjectileClasses[0];
		}
		super.Fire(C);
		//return;		
	}

	function AltFire(Controller C)
	{
		local ONSAttackCraftMissle M;
		local Vehicle V, Best;
		local float CurAim, bestAim;

		M = ONSAttackCraftMissle(SpawnProjectile(AltFireProjectileClass, true));
		// End:0x215
		if(M != none)
		{
			// End:0xD6
			if(AIController(Instigator.Controller) != none)
			{
				V = Vehicle(Instigator.Controller.Enemy);
				// End:0xD3
				if(((V != none) && V.bCanFly || V.IsA('ONSHoverCraft')) && Instigator.FastTrace(V.Location, Instigator.Location))
				{
					M.SetHomingTarget(V);
				}				
			}
			else
			{
				bestAim = MinAim;
				V = Level.Game.VehicleList;
				J0xFE:

				// End:0x1F6 [Loop If]
				if(V != none)
				{
					// End:0x1DF
					if(((V.bCanFly || V.IsA('ONSHoverCraft')) && V != Instigator) && Instigator.GetTeamNum() != V.GetTeamNum())
					{
						CurAim = Normal(V.Location - WeaponFireLocation) Dot Vector(WeaponFireRotation);
						// End:0x1DF
						if((CurAim > bestAim) && Instigator.FastTrace(V.Location, Instigator.Location))
						{
							Best = V;
							bestAim = CurAim;
						}
					}
					V = V.NextVehicle;
					// [Loop Continue]
					goto J0xFE;
				}
				// End:0x215
				if(Best != none)
				{
					M.SetHomingTarget(Best);
				}
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	TeamProjectileClasses[0]=Class'Onslaught.ONSAttackCraftPlasmaProjectileRed'
	TeamProjectileClasses[1]=Class'Onslaught.ONSAttackCraftPlasmaProjectileBlue'
	MinAim=0.9000000
	YawBone="PlasmaGunBarrel"
	PitchBone="PlasmaGunBarrel"
	PitchUpLimit=18000
	PitchDownLimit=49153
	WeaponFireAttachmentBone="PlasmaGunBarrel"
	DualFireOffset=50.0000000
	RotationsPerSecond=1.2000000
	FireInterval=0.2000000
	AltFireInterval=3.0000000
	FireSoundClass=Sound'ONSVehicleSounds-S.LaserSounds.Laser01'
	AltFireSoundClass=Sound'ONSVehicleSounds-S.AVRiL.AvrilFire01'
	FireForce="Laser01"
	AltFireForce="Laser01"
	ProjectileClass=Class'Onslaught.ONSAttackCraftPlasmaProjectileRed'
	AltFireProjectileClass=Class'Onslaught.ONSAttackCraftMissle'
	AIInfo[0]=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9500000)
	AIInfo[1]=(bTossed=false,bTrySplash=false,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=400.0000000,WarnTargetPct=0.0000000,RefireRate=0.5000000)
	Mesh=SkeletalMesh'ONSWeapons-A.PlasmaGun'
}
