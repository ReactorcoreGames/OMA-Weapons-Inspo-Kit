class T10Thrown extends BallisticHandGrenadeProjectile;

var Actor PATrail;
var() Class<Actor> PATrailClass;

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

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local T10CloudControl C;
	local Vector X, Y, Z;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x70
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BallisticProV55.T10CloudControl', self,, HitLocation + (HitNormal * float(2)));
		// End:0x70
		if(C != none)
		{
			C.Instigator = Instigator;
			C.InstigatorController = InstigatorController;
		}
	}
	// End:0x17C
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(rot(16384, 0, 0), X, Y, Z);
		X = X >> Rotation;
		Y = Y >> Rotation;
		Z = Z >> Rotation;
		Trail = Spawn(TrailClass, self,, Location + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation, TrailOffset), OrthoRotation(X, Y, Z));
		// End:0x157
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
		PlaySound(Sound'BW_Core_WeaponSound.T10.T10-Ignite',, 0.7000000,, 128.0000000, 1.0000000, true);
		AmbientSound = Sound'BW_Core_WeaponSound.T10.T10-ToxinLoop';
	}
	bExploded = true;
	LifeSpan = 8.0000000;
	SetTimer(6.5000000, false);
	//return;	
}

simulated function Timer()
{
	super.Timer();
	// End:0x43
	if((LifeSpan < float(3)) && Trail != none)
	{
		AmbientSound = none;
		Emitter(Trail).Kill();
		Trail = none;
	}
	//return;	
}

defaultproperties
{
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DetonateDelay=2.0000000
	ImpactDamage=15
	ImpactDamageType=Class'BallisticProV55.DTT10Grenade'
	WeaponClass=Class'BallisticProV55.T10Grenade'
	ImpactManager=Class'BallisticProV55.IM_Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.T10Spray'
	TrailOffset=(X=0.0000000,Y=0.0000000,Z=8.0000000)
	MyRadiusDamageType=Class'BallisticProV55.DTT10Gas'
	Damage=20.0000000
	DamageRadius=200.0000000
	MyDamageType=Class'BallisticProV55.DTT10Grenade'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.T10.T10Projectile'
	DrawScale=0.3500000
	SoundVolume=192
	SoundRadius=128.0000000
}
