class JSOWSmallBaseShell extends AirstrikeProjectile;

var Emitter Trail;
var Actor Glow;
var Class<Emitter> ExplosionEffectClass;
var Class<Emitter> AirExplosionEffectClass;
var bool bExploded;

simulated function PostBeginPlay()
{
	local Rotator R;
	local PlayerController PC;

	// End:0xA4
	if(!PhysicsVolume.bWaterVolume && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x95
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(65000))
		{
			Trail = Spawn(Class'XEffects.NewTracer', self);
		}
		Glow = Spawn(Class'XEffects.FlakGlow', self);
	}
	super(Projectile).PostBeginPlay();
	R = Rotation;
	R.Roll = 32768;
	SetRotation(R);
	//return;	
}

simulated function StartTimer(float Fuse)
{
	SetTimer(Fuse, false);
	//return;	
}

simulated function Destroyed()
{
	// End:0x11
	if(!bExploded)
	{
		ExplodeInAir();
	}
	// End:0x28
	if(Trail != none)
	{
		Trail.Destroy();
	}
	// End:0x3F
	if(Glow != none)
	{
		Glow.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x64
	if((Other != Instigator) && !Other.IsA('JSOWSmallBaseShell'))
	{
		SpawnEffects(HitLocation, float(-1) * Normal(Velocity));
		Explode(HitLocation, Normal(HitLocation - Other.Location));
	}
	//return;	
}

simulated function SpawnEffects(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(Sound'ONSVehicleSounds-S.Explosions.Explosion01', 0, 2.0000000);
	// End:0x10E
	if(EffectIsRelevant(Location, false))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x91
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(65000))
		{
			Spawn(ExplosionEffectClass,,, HitLocation + (HitNormal * float(16)));
		}
		Spawn(ExplosionEffectClass,,, HitLocation + (HitNormal * float(16)));
		Spawn(Class'XEffects.RocketSmokeRing',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal));
		// End:0x10E
		if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
		{
			Spawn(ExplosionDecal, self,, HitLocation, Rotator(-HitNormal));
		}
	}
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	SpawnEffects(Location, HitNormal);
	Explode(Location, HitNormal);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	Landed(HitNormal);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	bExploded = true;
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	Destroy();
	//return;	
}

simulated function ExplodeInAir()
{
	bExploded = true;
	PlaySound(Sound'ONSVehicleSounds-S.Explosions.Explosion01', 0, 2.0000000);
	// End:0x38
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(AirExplosionEffectClass);
	}
	Explode(Location, Location - Instigator.Location);
	Destroy();
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x84
	if((Damage > 0) && ((((EventInstigator == none) || EventInstigator.Controller == none) || Instigator == none) || Instigator.Controller == none) || !EventInstigator.Controller.SameTeamAs(Instigator.Controller))
	{
		ExplodeInAir();
	}
	//return;	
}

defaultproperties
{
	ExplosionEffectClass=Class'BWBPAirstrikesPro.ClusterExplosion'
	AirExplosionEffectClass=Class'Onslaught.ONSSmallVehicleExplosionEffect'
	Speed=64000.0000000
	MaxSpeed=64000.0000000
	Damage=250.0000000
	DamageRadius=512.0000000
	MomentumTransfer=75000.0000000
	MyDamageType=Class'BWBPAirstrikesPro.DamTypeJSOW'
	ExplosionDecal=Class'XEffects.ShockAltDecal'
	DrawType=8
	StaticMesh=StaticMesh'ONS-BPJW1.Meshes.LargeShell'
	CullDistance=65000.0000000
	bNetTemporary=false
	Physics=2
	AmbientSound=Sound'ONSBPSounds.Artillery.ShellAmbient'
	LifeSpan=15.0000000
	DrawScale=2.5000000
	AmbientGlow=100
	SoundVolume=255
	SoundRadius=100.0000000
	bProjTarget=true
	bIgnoreTerminalVelocity=true
	bOrientToVelocity=true
	ForceType=2
	ForceRadius=60.0000000
	ForceScale=5.0000000
}
