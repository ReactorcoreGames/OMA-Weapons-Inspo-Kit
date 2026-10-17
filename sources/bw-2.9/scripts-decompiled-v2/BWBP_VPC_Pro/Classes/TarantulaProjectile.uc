class TarantulaProjectile extends Projectile;

var Emitter SmokeTrailEffect;
var Effects Corona;

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

simulated function PostBeginPlay()
{
	// End:0x5B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		SmokeTrailEffect = Spawn(Class'BWBP_VPC_Pro.TarantulaRocketTrail', self);
		Corona = Spawn(Class'XEffects.RocketCorona', self);
		Corona.SetDrawScale(4.5000000 * Corona.default.DrawScale);
	}
	Velocity = Vector(Rotation) * Speed;
	// End:0x93
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity = 0.6000000 * Velocity;
	}
	super.PostBeginPlay();
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

function BlowUp(Vector HitLocation)
{
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(SoundGroup'BW_Core_WeaponSound.Explosions.Explode-Small',, 1.5000000);
	// End:0xBA
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'BallisticProV55.IE_NRP57Explosion',,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
		PC = Level.GetLocalPlayerController();
		// End:0xBA
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5000))
		{
			Spawn(Class'XEffects.ExplosionCrap',,, HitLocation + (HitNormal * float(20)), Rotator(HitNormal));
		}
	}
	BlowUp(HitLocation);
	Destroy();
	//return;	
}

defaultproperties
{
	Speed=2500.0000000
	MaxSpeed=2500.0000000
	Damage=120.0000000
	DamageRadius=250.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'XWeapons.DamTypeRocket'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketProj'
	AmbientSound=Sound'VMVehicleSounds-S.HoverTank.IncomingShell'
	LifeSpan=8.0000000
	DrawScale3D=(X=1.0000000,Y=0.4000000,Z=0.4000000)
	AmbientGlow=32
	FluidSurfaceShootStrengthMod=10.0000000
	SoundVolume=255
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=50000)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=900000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
