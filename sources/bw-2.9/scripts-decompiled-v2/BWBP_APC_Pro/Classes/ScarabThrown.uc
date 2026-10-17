class ScarabThrown extends BallisticHandGrenadeProjectile;

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

defaultproperties
{
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	flakcount=16
	FlakClass=Class'BWBP_APC_Pro.ScarabMicroClusterFlak'
	ImpactDamage=15
	ImpactDamageType=Class'BWBP_APC_Pro.DTScarabGrenade'
	WeaponClass=Class'BWBP_APC_Pro.ScarabGrenade'
	ImpactManager=Class'BWBP_APC_Pro.IM_ScarabGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_APC_Pro.ScarabTrail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	MyRadiusDamageType=Class'BWBP_APC_Pro.DTScarabGrenadeRadius'
	WallPenetrationForce=256.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=512.0000000
	Speed=1400.0000000
	MaxSpeed=1500.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	MyDamageType=Class'BWBP_APC_Pro.DTScarabGrenade'
	ImpactSound=SoundGroup'BWBP_APC_Sounds.CruGren.CruGren-Concrete'
	StaticMesh=StaticMesh'BWBP_APC_Static.CruGren.CruGrenProjectile'
}
