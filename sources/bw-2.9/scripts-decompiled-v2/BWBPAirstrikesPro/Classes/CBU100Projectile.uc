class CBU100Projectile extends AirstrikeProjectile;

var Emitter SmokeTrailEffect;
var bool bHitWater;
var Effects Corona;
var Vector Dir;

simulated function Destroyed()
{
	// End:0x1A
	if(SmokeTrailEffect != none)
	{
		SmokeTrailEffect.Kill();
	}
	// End:0x31
	if(Corona != none)
	{
		Corona.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	// End:0x37
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrailEffect = Spawn(Class'XEffects.NewTracer', self);
		Corona = Spawn(Class'XEffects.RocketCorona', self);
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	// End:0x82
	if(PhysicsVolume.bWaterVolume)
	{
		bHitWater = true;
		Velocity = 0.6000000 * Velocity;
	}
	// End:0xA4
	if(Level.bDropDetail)
	{
		bDynamicLight = false;
		LightType = 0;
	}
	super(Projectile).PostBeginPlay();
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x53
	if((Other != Instigator) && !Other.IsA('Projectile') || Other.bProjTarget)
	{
		Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 5.5000000 * TransientSoundVolume);
	// End:0x95
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'BWBPAirstrikesPro.ClusterExplosion',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
		// End:0x95
		if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

defaultproperties
{
	Speed=298000.0000000
	MaxSpeed=300000.0000000
	Damage=300.0000000
	DamageRadius=500.0000000
	MomentumTransfer=125000.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeCBU100Bomb'
	ExplosionDecal=Class'BWBPAirstrikesPro.ClusterBlastMark'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	AmbientSound=Sound'VMVehicleSounds-S.HoverTank.IncomingShell'
	LifeSpan=15.0000000
	AmbientGlow=96
	FluidSurfaceShootStrengthMod=10.0000000
	SoundVolume=255
	SoundRadius=1000.0000000
	TransientSoundVolume=1.0000000
	TransientSoundRadius=1000.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=30000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
