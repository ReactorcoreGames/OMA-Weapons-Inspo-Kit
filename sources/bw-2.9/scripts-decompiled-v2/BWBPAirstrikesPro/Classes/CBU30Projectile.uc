class CBU30Projectile extends AirstrikeProjectile;

var Emitter SmokeTrailEffect;
var bool bHitWater;
var Effects Corona;
var Vector Dir;
var() Vector ShakeRotMag;
var() Vector ShakeRotRate;
var() float ShakeRotTime;
var() Vector ShakeOffsetMag;
var() Vector ShakeOffsetRate;
var() float ShakeOffsetTime;
var Class<Emitter> ExplosionEffectClass;
var float ExploStart;
var bool bExploded;

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

function BlowUp(Vector HitLocation)
{
	MakeNoise(1.0000000);
	SetPhysics(0);
	bHidden = true;
	GotoState('Dying');
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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x0B
	if(bExploded)
	{
		return;
	}
	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 5.5000000 * TransientSoundVolume);
	// End:0x62
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.NewExplosionA',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
	}
	Spawn(ExplosionEffectClass,,, HitLocation, rot(0, 16384, 0));
	bExploded = true;
	BlowUp(HitLocation);
	// End:0xAD
	if(int(Level.NetMode) == int(NM_Client))
	{
		Destroy();
	}
	//return;	
}

state Dying
{
	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function Timer()
	{
		HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location);
		// End:0x49
		if((Level.TimeSeconds - ExploStart) > float(16))
		{
			SetTimer(0.0000000, false);
			Destroy();
		}
		//return;		
	}

	function BeginState()
	{
		ExploStart = Level.TimeSeconds;
		bHidden = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		Spawn(Class'XEffects.FlakExplosion',,, Location, Rotation);
		ShakeView();
		InitialState = 'Dying';
		SetTimer(0.5000000, true);
		PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
		//return;		
	}

	function ShakeView()
	{
		local Controller C;
		local PlayerController PC;
		local float dist, Scale;

		C = Level.ControllerList;
		J0x14:

		// End:0x11B [Loop If]
		if(C != none)
		{
			PC = PlayerController(C);
			// End:0x104
			if((PC != none) && PC.ViewTarget != none)
			{
				dist = VSize(Location - PC.ViewTarget.Location);
				// End:0x104
				if(dist < (DamageRadius * 2.0000000))
				{
					// End:0xA9
					if(dist < DamageRadius)
					{
						Scale = 1.0000000;						
					}
					else
					{
						Scale = ((DamageRadius * 2.0000000) - dist) / DamageRadius;
					}
					C.ShakeView(ShakeRotMag * Scale, ShakeRotRate, ShakeRotTime, ShakeOffsetMag * Scale, ShakeOffsetRate, ShakeOffsetTime);
				}
			}
			C = C.nextController;
			// [Loop Continue]
			goto J0x14;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=2500.0000000)
	ShakeRotTime=6.0000000
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=200.0000000)
	ShakeOffsetTime=10.0000000
	ExplosionEffectClass=Class'BWBPAirstrikesPro.CBU30Explosion'
	Speed=10000.0000000
	MaxSpeed=300000.0000000
	Damage=35.0000000
	DamageRadius=512.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeCBU30Bomb'
	ExplosionDecal=Class'BWBPAirstrikesPro.ClusterBlastMark'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	LifeSpan=15.0000000
	AmbientGlow=96
	FluidSurfaceShootStrengthMod=10.0000000
	bFullVolume=true
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
