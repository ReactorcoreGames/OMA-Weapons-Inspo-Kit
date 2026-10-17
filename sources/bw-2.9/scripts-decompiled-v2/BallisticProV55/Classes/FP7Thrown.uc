class FP7Thrown extends BallisticHandGrenadeProjectile;

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
	local FP7FireControl F;
	local Teleporter TB;

	// End:0xFB
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x9B
		foreach RadiusActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			// End:0x97
			if(Instigator != none)
			{
				Level.Game.Broadcast(self, ("FP7 Grenade thrown by" @ Instigator.PlayerReplicationInfo.PlayerName) @ "too close to a teleporter!");
			}			
			return;			
		}		
		F = Spawn(Class'BallisticProV55.FP7FireControl', self,, Location + vect(0.0000000, 0.0000000, 16.0000000), rot(0, 0, 0));
		// End:0xFB
		if(F != none)
		{
			F.Instigator = Instigator;
			F.Initialize();
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DetonateDelay=2.0000000
	ImpactDamage=15
	ImpactDamageType=Class'BallisticProV55.DTFP7Grenade'
	WeaponClass=Class'BallisticProV55.FP7Grenade'
	ImpactManager=Class'BallisticProV55.IM_Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.NRP57Trail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	MyRadiusDamageType=Class'BallisticProV55.DTFP7Burned'
	Damage=0.0000000
	DamageRadius=0.0000000
	MyDamageType=Class'BallisticProV55.DTFP7Grenade'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.FP7.FP7Proj'
	DrawScale=0.5000000
}
