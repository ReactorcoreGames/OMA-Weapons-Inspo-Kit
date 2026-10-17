class AlbatrossBomb extends Projectile;

simulated function PostBeginPlay()
{
	// End:0x24
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

simulated event Tick(float dt)
{
	local Rotator R;
	local Vector V;

	V = Vector(Rotation);
	// End:0x25
	if(V.Z == float(-1))
	{
		return;
	}
	V.Z = FMax(-1.0000000, V.Z - dt);
	R = Rotator(V);
	R.Roll = Rotation.Roll;
	SetRotation(R);
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
	MaxSpeed=2500.0000000
	Damage=180.0000000
	DamageRadius=400.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'XWeapons.DamTypeRocket'
	ExplosionDecal=Class'Onslaught.ONSRocketScorch'
	DrawType=8
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.G5.G5Rocket'
	Physics=2
	LifeSpan=20.0000000
	DrawScale=2.0000000
	AmbientGlow=32
	FluidSurfaceShootStrengthMod=10.0000000
	SoundVolume=255
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
	DesiredRotation=(Pitch=0,Yaw=0,Roll=900000)
	ForceType=2
	ForceRadius=100.0000000
	ForceScale=5.0000000
}
