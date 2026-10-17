class M58Thrown extends BallisticHandGrenadeProjectile;

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
	local Vector X, Y, Z;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x37
	if(int(Role) == int(ROLE_Authority))
	{
		Spawn(Class'BallisticProV55.M58Cloud', self,, HitLocation + (HitNormal * float(2)));
	}
	// End:0x11E
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(rot(16384, 0, 0), X, Y, Z);
		X = X >> Rotation;
		Y = Y >> Rotation;
		Z = Z >> Rotation;
		Trail = Spawn(TrailClass, self,, Location + Class'BCoreProV55.BUtil'.static.AlignedOffset(Rotation, TrailOffset), OrthoRotation(X, Y, Z));
		// End:0x11E
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	bExploded = true;
	LifeSpan = 12.0000000;
	SetTimer(10.5000000, false);
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
	ArmedDetonateOn=3
	DetonateDelay=0.5000000
	ImpactDamage=15
	ImpactDamageType=Class'BallisticProV55.DTM58Grenade'
	WeaponClass=Class'BallisticProV55.M58Grenade'
	ImpactManager=Class'BallisticProV55.IM_Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M58Spray'
	TrailOffset=(X=0.0000000,Y=0.0000000,Z=8.0000000)
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M58.M58Projectile'
	DrawScale=0.3500000
	SoundVolume=192
	SoundRadius=128.0000000
}
