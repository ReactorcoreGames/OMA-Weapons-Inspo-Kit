class ONSPlasmaProjectile extends Projectile
	abstract;

var() Class<Emitter> HitEffectClass;
var() Class<Emitter> PlasmaEffectClass;
var() float AccelerationMagnitude;
var Emitter Plasma;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Velocity = Speed * Vector(Rotation);
	// End:0x5A
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Plasma = Spawn(PlasmaEffectClass, self,, Location, Rotation);
		Plasma.SetBase(self);
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	Acceleration = AccelerationMagnitude * Normal(Velocity);
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	Explode(Location, HitNormal);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x62
	if((Other != Instigator) && (Vehicle(Instigator) == none) || Vehicle(Instigator).Driver != Other)
	{
		Explode(HitLocation, Normal(HitLocation - Other.Location));
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x2F
	if(int(Role) == int(ROLE_Authority))
	{
		HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	}
	// End:0x63
	if(EffectIsRelevant(Location, false))
	{
		Spawn(HitEffectClass,,, HitLocation + (HitNormal * float(5)), Rotator(-HitNormal));
	}
	PlaySound(SoundGroup'WeaponSounds.BioRifle.BioRifleGoo2');
	Destroy();
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Plasma != none)
	{
		Plasma.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

static simulated function float GetRange()
{
	local float AccelTime;

	// End:0x18
	if(default.LifeSpan == 0.0000000)
	{
		return 15000.0000000;		
	}
	else
	{
		// End:0x34
		if(default.AccelerationMagnitude == 0.0000000)
		{
			return default.Speed * default.LifeSpan;
		}
	}
	AccelTime = (default.MaxSpeed - default.Speed) / default.AccelerationMagnitude;
	return ((((0.5000000 * default.AccelerationMagnitude) * AccelTime) * AccelTime) + (default.Speed * AccelTime)) + (default.MaxSpeed * (default.LifeSpan - AccelTime));
	//return;	
}

defaultproperties
{
	HitEffectClass=Class'Onslaught.ONSPlasmaHitGreen'
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	Damage=70.0000000
	DamageRadius=240.0000000
	MomentumTransfer=4000.0000000
	ExplosionDecal=Class'XEffects.LinkBoltScorch'
	DrawType=0
	LifeSpan=1.6000000
	AmbientGlow=100
	Style=6
}
