class G28Thrown_Exp extends BallisticHandGrenadeProjectile;

var() Class<DamageType> ShotDamageType;
var Actor PATrail;
var() Class<Actor> PATrailClass;
var() bool bDamaged;
var bool bDetonate;
var bool bDetonated;
var() int Health;

simulated function InitEffects()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xBC
	if((((Speed > float(400)) && PATrailClass != none) && PATrail == none) && int(Level.DetailMode) == int(2))
	{
		PATrail = Spawn(PATrailClass, self,, Location);
		// End:0xA4
		if(Emitter(PATrail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(PATrail), DrawScale);
		}
		// End:0xBC
		if(PATrail != none)
		{
			PATrail.SetBase(self);
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x3E
	if(PATrail != none)
	{
		// End:0x32
		if(Emitter(PATrail) != none)
		{
			Emitter(PATrail).Kill();			
		}
		else
		{
			PATrail.Destroy();
		}
	}
	super(BallisticProjectile).Destroyed();
	//return;	
}

event TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x15
	if(VSize(Momentum) < float(2000))
	{
		return;
	}
	// End:0x4D
	if(bDamaged || (Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bIgniteFires)
	{
		return;
	}
	Health -= Damage;
	// End:0x66
	if(Health > 0)
	{
		return;
	}
	bDamaged = true;
	// End:0xA3
	if(instigatedBy != none)
	{
		Instigator = instigatedBy;
		InstigatorController = instigatedBy.Controller;
		MyRadiusDamageType = ShotDamageType;
	}
	ExplodeFire(Location, Vector(Rotation));
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local G28CloudControl C;
	local Vector X, Y, Z;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x5C
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BWBP_SKC_Pro.G28CloudControl', self,, HitLocation - (HitNormal * float(2)));
		// End:0x5C
		if(C != none)
		{
			C.Instigator = Instigator;
		}
	}
	// End:0x168
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(rot(16384, 0, 0), X, Y, Z);
		X = X >> Rotation;
		Y = Y >> Rotation;
		Z = Z >> Rotation;
		Trail = Spawn(TrailClass, self,, Location + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation, TrailOffset), OrthoRotation(X, Y, Z));
		// End:0x143
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
		PlaySound(Sound'BW_Core_WeaponSound.T10.T10-Ignite',, 0.7000000,, 128.0000000, 1.0000000, true);
		AmbientSound = Sound'BW_Core_WeaponSound.T10.T10-ToxinLoop';
	}
	bExploded = true;
	LifeSpan = 12.0000000;
	SetTimer(10.5000000, false);
	//return;	
}

simulated function ExplodeFire(Vector HitLocation, Vector HitNormal)
{
	// End:0x0B
	if(bDetonated)
	{
		return;
	}
	bDetonated = true;
	// End:0x2B
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x97
	if(ImpactManager != none)
	{
		// End:0x78
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	Destroy();
	//return;	
}

simulated function BlowUp(Vector HitLocation)
{
	local Vector Start;
	local Rotator Dir;
	local int i;

	Start = Location;
	// End:0x9F
	if((flakcount > 0) && FlakClass != none)
	{
		i = 0;
		J0x2A:

		// End:0x9F [Loop If]
		if(i < flakcount)
		{
			Dir.Yaw += int((FRand() * float(40000)) - float(20000));
			Dir.Pitch += int((FRand() * float(40000)) - float(20000));
			Spawn(FlakClass,, 'None', Start, Dir);
			i++;
			// [Loop Continue]
			goto J0x2A;
		}
	}
	TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	// End:0xDB
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

simulated function Timer()
{
	super.Timer();
	// End:0x2A
	if(bDetonate)
	{
		ExplodeFire(Location, vect(0.0000000, 0.0000000, 1.0000000));		
	}
	else
	{
		// End:0x39
		if(bDamaged)
		{
			Detonate();
		}
	}
	// End:0x76
	if((LifeSpan < float(3)) && Trail != none)
	{
		AmbientSound = none;
		Emitter(Trail).Kill();
		Trail = none;
	}
	//return;	
}

simulated function Detonate()
{
	bDetonate = true;
	SetTimer(0.0100000 + (0.1000000 * FRand()), false);
	//return;	
}

simulated function Tick(float dt)
{
	super(BallisticGrenade).Tick(dt);
	// End:0x47
	if(bDetonate && int(Level.NetMode) == int(NM_Client))
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

defaultproperties
{
	ShotDamageType=Class'BWBP_SKC_Pro.DTG28Explode'
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	Health=20
	ArmedDetonateOn=3
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DetonateDelay=2.0000000
	ImpactDamage=3
	ImpactDamageType=Class'BWBP_SKC_Pro.DTG28Grenade'
	WeaponClass=Class'BWBP_SKC_Pro.G28Grenade'
	ImpactManager=Class'BWBP_SKC_Pro.IM_G28Explode'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.G28Spray'
	TrailOffset=(X=0.0000000,Y=0.0000000,Z=8.0000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTG28Gas'
	Damage=120.0000000
	DamageRadius=300.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTG28Grenade'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BWBP_SKC_Static.G28.G28Proj'
	SoundVolume=192
	SoundRadius=128.0000000
}
