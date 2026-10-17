class FlakShell extends Projectile;

var xEmitter Trail;
var Vector InitialDir;
var Actor Glow;

simulated function PostBeginPlay()
{
	local Rotator R;
	local PlayerController PC;

	// End:0xA4
	if(!PhysicsVolume.bWaterVolume && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x95
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(6000))
		{
			Trail = Spawn(Class'XEffects.FlakShellTrail', self);
		}
		Glow = Spawn(Class'XEffects.FlakGlow', self);
	}
	super.PostBeginPlay();
	Velocity = Vector(Rotation) * Speed;
	R = Rotation;
	R.Roll = 32768;
	SetRotation(R);
	Velocity.Z += TossZ;
	InitialDir = Velocity;
	//return;	
}

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	// End:0x33
	if(Glow != none)
	{
		Glow.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x4C
	if(Other != Instigator)
	{
		SpawnEffects(HitLocation, float(-1) * Normal(Velocity));
		Explode(HitLocation, Normal(HitLocation - Other.Location));
	}
	//return;	
}

simulated function SpawnEffects(Vector HitLocation, Vector HitNormal)
{
	local PlayerController PC;

	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion1',, 3.0000000 * TransientSoundVolume);
	// End:0x114
	if(EffectIsRelevant(Location, false))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x97
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(3000))
		{
			Spawn(Class'XEffects.FlakExplosion',,, HitLocation + (HitNormal * float(16)));
		}
		Spawn(Class'XEffects.FlashExplosion',,, HitLocation + (HitNormal * float(16)));
		Spawn(Class'XEffects.RocketSmokeRing',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal));
		// End:0x114
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
	local Vector Start;
	local Rotator Rot;
	local int i;
	local FlakChunk NewChunk;

	Start = Location + (float(10) * HitNormal);
	// End:0xF3
	if(int(Role) == int(ROLE_Authority))
	{
		HurtRadius(Damage, 220.0000000, MyDamageType, MomentumTransfer, HitLocation);
		i = 0;
		J0x4E:

		// End:0xF3 [Loop If]
		if(i < 6)
		{
			Rot = Rotation;
			Rot.Yaw += int((FRand() * float(32000)) - float(16000));
			Rot.Pitch += int((FRand() * float(32000)) - float(16000));
			Rot.Roll += int((FRand() * float(32000)) - float(16000));
			NewChunk = Spawn(Class'XWeapons.FlakChunk',, 'None', Start, Rot);
			i++;
			// [Loop Continue]
			goto J0x4E;
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	Speed=1200.0000000
	TossZ=225.0000000
	Damage=90.0000000
	MomentumTransfer=75000.0000000
	MyDamageType=Class'XWeapons.DamTypeFlakShell'
	ExplosionDecal=Class'XEffects.ShockAltDecal'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.FlakShell'
	CullDistance=4000.0000000
	Physics=2
	AmbientSound=Sound'WeaponSounds.BaseProjectileSounds.BFlakCannonProjectile'
	LifeSpan=6.0000000
	DrawScale=8.0000000
	Skins[0]=Texture'XWeapons.Skins.NewFlakSkin'
	AmbientGlow=100
	SoundVolume=255
	SoundRadius=100.0000000
	bProjTarget=true
	ForceType=2
	ForceRadius=60.0000000
	ForceScale=5.0000000
}
