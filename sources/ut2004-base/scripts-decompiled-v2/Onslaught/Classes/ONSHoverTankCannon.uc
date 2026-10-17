class ONSHoverTankCannon extends ONSWeapon
	notplaceable;

var Vector oldDir;
var Rotator OldRot;

static function StaticPrecache(LevelInfo L)
{
	L.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	L.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	L.AddPrecacheMaterial(Texture'XEffects.SmokeAlphab_t');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TankTrail');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	L.AddPrecacheMaterial(Texture'ONSInterface-TX.tankBarrelAligned');
	L.AddPrecacheMaterial(Texture'VMparticleTextures.TankFiringP.TankDustKick1');
	L.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	L.AddPrecacheMaterial(Texture'EpicParticles.Smoke.SparkCloud_01aw');
	L.AddPrecacheMaterial(Texture'BenTex01.Textures.SmokePuff01');
	L.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2');
	L.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.HardSpot');
	//return;	
}

simulated function UpdatePrecacheMaterials()
{
	Level.AddPrecacheMaterial(Texture'WeaponSkins.Skins.RocketShellTex');
	Level.AddPrecacheMaterial(Texture'XEffects.RocketFlare');
	Level.AddPrecacheMaterial(Texture'XEffects.SmokeAlphab_t');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.TankTrail');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.SmokePanels2');
	Level.AddPrecacheMaterial(Texture'ONSInterface-TX.tankBarrelAligned');
	Level.AddPrecacheMaterial(Texture'VMparticleTextures.TankFiringP.TankDustKick1');
	Level.AddPrecacheMaterial(Texture'EmitterTextures.MultiFrame.rockchunks02');
	Level.AddPrecacheMaterial(Texture'EpicParticles.Smoke.SparkCloud_01aw');
	Level.AddPrecacheMaterial(Texture'BenTex01.Textures.SmokePuff01');
	Level.AddPrecacheMaterial(Texture'AW-2004Explosions.Fire.Part_explode2');
	Level.AddPrecacheMaterial(Texture'AW-2004Particles.Weapons.HardSpot');
	super(Actor).UpdatePrecacheMaterials();
	//return;	
}

simulated function UpdatePrecacheStaticMeshes()
{
	Level.AddPrecacheStaticMesh(StaticMesh'WeaponStaticMesh.RocketProj');
	super(Actor).UpdatePrecacheStaticMeshes();
	//return;	
}

function byte BestMode()
{
	return 0;
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	oldDir = Vector(CurrentAim);
	//return;	
}

function Tick(float Delta)
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

defaultproperties
{
	YawBone="TankTurret"
	PitchBone="TankBarrel"
	PitchUpLimit=6000
	PitchDownLimit=61500
	WeaponFireAttachmentBone="TankBarrel"
	WeaponFireOffset=200.0000000
	RotationsPerSecond=0.1800000
	Spread=0.0150000
	RedSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalRED'
	BlueSkin=Shader'VMVehicles-TX.HoverTankGroup.HoverTankChassisFinalBLUE'
	FireInterval=2.5000000
	EffectEmitterClass=Class'Onslaught.ONSTankFireEffect'
	FireSoundClass=Sound'ONSVehicleSounds-S.Tank.TankFire01'
	FireSoundVolume=512.0000000
	FireForce="Explosion05"
	ProjectileClass=Class'Onslaught.ONSRocketProjectile'
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	AIInfo=(bTossed=false,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.7500000,RefireRate=0.8000000)
	Mesh=SkeletalMesh'ONSWeapons-A.HoverTankCannon'
}
