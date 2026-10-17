class XM84Thrown extends BallisticHandGrenadeProjectile;

var Actor PATrail;
var() Class<Actor> PATrailClass;
var() int CloseRadius;

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

simulated event KVelDropBelow()
{
	super(Actor).KVelDropBelow();
	// End:0x1D
	if(PATrail != none)
	{
		PATrail.Destroy();
	}
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
	// End:0xCA
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Pawn Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;
	local XM84ActorCorrupt PF;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1FA
	foreach RadiusActors(Class'Engine.Pawn', Victims, float(CloseRadius), Location)
	{
		// End:0x1F9
		if((Victims != Victim) && Victims.bCanBeDamaged)
		{
			// End:0x87
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Damage / float(10), Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			PF = Spawn(Class'BWBP_SKC_Pro.XM84ActorCorrupt', self,, Victims.Location);
			PF.Instigator = Instigator;
			// End:0x181
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				PF.InstigatorController = Instigator.Controller;
			}
			PF.Initialize(Victims);
			// End:0x1F9
			if((Victims != none) && Level.Game.ReduceDamage(int(DamageAmount), Victims, Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Victims, 4.0000000);
			}
		}		
	}	
	// End:0x47B
	foreach VisibleCollidingActors(Class'Engine.Pawn', Victims, DamageRadius, HitLocation)
	{
		// End:0x47A
		if(Victims != Victim)
		{
			// End:0x25B
			if((Vector(Victims.Rotation) Dot Normal(Location - Victims.Location)) < 0.2000000)
			{
				continue;				
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x301
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			PF = Spawn(Class'BWBP_SKC_Pro.XM84ActorCorrupt', self,, Victims.Location);
			PF.Instigator = Instigator;
			// End:0x3FC
			if(((int(Role) == int(ROLE_Authority)) && Instigator != none) && Instigator.Controller != none)
			{
				PF.InstigatorController = Instigator.Controller;
			}
			PF.Initialize(Victims);
			// End:0x47A
			if((Victims != none) && Level.Game.ReduceDamage(int(DamageAmount), Victims, Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Victims, Damage / float(4));
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function ApplySlowdown(Pawn P, float Duration)
{
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(P, 0.6000000, Duration);
	//return;	
}

defaultproperties
{
	PATrailClass=Class'BallisticProV55.PineappleTrail'
	CloseRadius=256
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	DetonateDelay=2.0000000
	ImpactDamage=15
	ImpactDamageType=Class'BWBP_SKC_Pro.DTXM84Hit'
	WeaponClass=Class'BWBP_SKC_Pro.XM84Flashbang'
	ImpactManager=Class'BWBP_SKC_Pro.IM_XM84Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.XM84Trail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTXM84GrenadeRadius'
	ShakeRadius=0.0000000
	ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=256.0000000)
	ShakeRotRate=(X=0.0000000,Y=2500.0000000,Z=0.0000000)
	ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MotionBlurRadius=1000.0000000
	Damage=45.0000000
	DamageRadius=768.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTXM84GrenadeRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BWBP_SKC_Static.XM84.XM84Projectile'
	DrawScale=1.0000000
}
