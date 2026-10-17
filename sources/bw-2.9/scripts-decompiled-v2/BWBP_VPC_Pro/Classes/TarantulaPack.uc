class TarantulaPack extends ONSWeapon;

var float MaxLockRange;
var float LockAim;

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

state ProjectileFireMode
{
	function Fire(Controller C)
	{
		local ONSMASRocketProjectile R;
		local float bestAim, BestDist;

		R = ONSMASRocketProjectile(SpawnProjectile(ProjectileClass, false));
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
	YawBone="rvGUNTurret"
	PitchBone="rvGUNbody"
	PitchUpLimit=18000
	WeaponFireAttachmentBone="RVfirePoint"
	FireInterval=1.5000000
	FireSoundClass=Sound'BW_Core_WeaponSound.G5.G5-Fire1'
	FireForce="RocketLauncherFire"
	ProjectileClass=Class'BWBP_VPC_Pro.TarantulaProjectile'
	AIInfo=(bTossed=false,bTrySplash=true,bLeadTarget=true,bInstantHit=false,bFireOnRelease=false,aimerror=600.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	Mesh=SkeletalMesh'ONSWeapons-A.RVnewGun'
	CollisionRadius=60.0000000
}
