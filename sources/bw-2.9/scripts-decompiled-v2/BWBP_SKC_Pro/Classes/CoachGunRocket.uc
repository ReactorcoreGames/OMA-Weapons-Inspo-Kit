class CoachGunRocket extends BallisticGrenade;

var Sound ImpactSounds[6];
var int ImpactKickForce;
var Vector StartLoc;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		StartLoc;
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x21
	if(int(Role) == int(ROLE_Authority))
	{
		StartLoc = Location;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	// End:0x48
	if(VSize(StartLoc - Location) < (default.Speed * 0.1000000))
	{
		SetTimer(0.1000000 - (VSize(StartLoc - Location) / default.Speed), false);		
	}
	else
	{
		bBounce = false;
	}
	//return;	
}

simulated function InitParams()
{
	WeaponClass.default.ParamsClasses[int(Class'BCoreProV55.BallisticReplicationInfo'.default.GameStyle)].OverrideProjectileParams(self, 5);
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	DetonateOn = 1;
	SetPhysics(2);
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x22
	if(int(DetonateOn) == int(1))
	{
		Explode(Location, HitNormal);
		return;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	Speed = VSize(Velocity / float(2));
	RandSpin(100000.0000000);
	// End:0xCE
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0xCB
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x19E
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x165
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x19E
			if(ImpactManager != none)
			{
				ImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Owner);
			}
		}
	}
	//return;	
}

defaultproperties
{
	ImpactSounds[0]=Sound'XEffects.Impact4Snd'
	ImpactSounds[1]=Sound'XEffects.Impact6Snd'
	ImpactSounds[2]=Sound'XEffects.Impact7Snd'
	ImpactSounds[3]=Sound'XEffects.Impact3'
	ImpactSounds[4]=Sound'XEffects.Impact1'
	ImpactSounds[5]=Sound'XEffects.Impact2'
	ArmedDetonateOn=5
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DampenFactor=0.1500000
	DampenFactorParallel=0.3000000
	ImpactDamage=125
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_CoachFRAGImpact'
	WeaponClass=Class'BWBP_SKC_Pro.CoachGun'
	ImpactManager=Class'BWBP_SKC_Pro.IM_BulldogFRAG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.HAMRShellTrail'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_CoachFRAGRadius'
	WallPenetrationForce=64.0000000
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=110.0000000
	DamageRadius=180.0000000
	MomentumTransfer=60000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_CoachFRAG'
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	AmbientSound=Sound'BW_Core_WeaponSound.G5.G5-RocketFly'
	DrawScale=0.3000000
	SoundVolume=192
	SoundRadius=128.0000000
	bIgnoreTerminalVelocity=true
}
