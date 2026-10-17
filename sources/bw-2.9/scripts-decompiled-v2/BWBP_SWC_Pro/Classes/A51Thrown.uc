class A51Thrown extends BallisticHandGrenadeProjectile;

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

simulated event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	super(Actor).KImpact(Other, pos, impactVel, impactNorm);
	// End:0x43
	if((PATrail != none) && VSize(impactVel) > float(200))
	{
		PATrail.Destroy();
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local A51AcidControl F;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0x100
	if(int(Role) == int(ROLE_Authority))
	{
		F = Spawn(Class'BWBP_SWC_Pro.A51AcidControl', self,, HitLocation - (HitNormal * float(2)), rot(0, 0, 0));
		// End:0x100
		if(F != none)
		{
			F.Instigator = Instigator;
			F.Initialize(vect(0.0000000, 0.0000000, 1.0000000), 8);
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	ImpactDamage=15
	ImpactDamageType=Class'BWBP_SWC_Pro.DTA51Grenade'
	WeaponClass=Class'BWBP_SWC_Pro.A51Grenade'
	ImpactManager=Class'BWBP_SWC_Pro.IM_AcidGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	MyRadiusDamageType=Class'BWBP_SWC_Pro.DTA51Pool'
	Damage=100.0000000
	DamageRadius=250.0000000
	MyDamageType=Class'BWBP_SWC_Pro.DTA51Grenade'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	DrawScale=0.5000000
}
