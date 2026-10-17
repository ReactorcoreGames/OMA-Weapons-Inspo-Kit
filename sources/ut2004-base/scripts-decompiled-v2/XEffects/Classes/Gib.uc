class Gib extends Actor
	abstract
	notplaceable;

var Class<xPawnGibGroup> GibGroupClass;
var() Class<xEmitter> TrailClass;
var() xEmitter Trail;
var() float DampenFactor;
var Sound HitSounds[2];
var bool bFlaming;

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	super.Destroyed();
	//return;	
}

final simulated function RandSpin(float spinRate)
{
	DesiredRotation = RotRand();
	RotationRate.Yaw = int(((spinRate * float(2)) * FRand()) - spinRate);
	RotationRate.Pitch = int(((spinRate * float(2)) * FRand()) - spinRate);
	RotationRate.Roll = int(((spinRate * float(2)) * FRand()) - spinRate);
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local float Speed, MinSpeed;

	Velocity = DampenFactor * ((((Velocity Dot HitNormal) * HitNormal) * -2.0000000) + Velocity);
	RandSpin(100000.0000000);
	Speed = VSize(Velocity);
	// End:0x6D
	if(int(Level.DetailMode) == int(0))
	{
		MinSpeed = 250.0000000;		
	}
	else
	{
		MinSpeed = 150.0000000;
	}
	// End:0x12F
	if(!bFlaming && Speed > MinSpeed)
	{
		// End:0x12F
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && !Level.bDropDetail)
		{
			// End:0xF8
			if(GibGroupClass.default.BloodHitClass != none)
			{
				Spawn(GibGroupClass.default.BloodHitClass,,, Location, Rotator(-HitNormal));
			}
			// End:0x12F
			if((LifeSpan < 7.3000000) && int(Level.DetailMode) != int(0))
			{
				PlaySound(HitSounds[Rand(2)]);
			}
		}
	}
	// End:0x1BD
	if(Speed < float(20))
	{
		// End:0x1B0
		if(((!bFlaming && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && GibGroupClass.default.BloodHitClass != none)
		{
			Spawn(GibGroupClass.default.BloodHitClass,,, Location, Rotator(-HitNormal));
		}
		bBounce = false;
		SetPhysics(0);
	}
	//return;	
}

simulated function SpawnTrail()
{
	// End:0xD1
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x8A
		if(bFlaming)
		{
			Trail = Spawn(Class'XEffects.HitFlameBig', self,, Location, Rotation);
			Trail.LifeSpan = 4.0000000 + (float(2) * FRand());
			LifeSpan = Trail.LifeSpan;
			Trail.SetTimer(LifeSpan - 3.0000000, false);			
		}
		else
		{
			Trail = Spawn(TrailClass, self,, Location, Rotation);
			Trail.LifeSpan = 1.8000000;
		}
		Trail.SetPhysics(10);
		RandSpin(64000.0000000);
	}
	//return;	
}

defaultproperties
{
	GibGroupClass=Class'XEffects.xPawnGibGroup'
	DampenFactor=0.6500000
	HitSounds[0]=Sound'PlayerSounds.Final.Giblets1'
	HitSounds[1]=Sound'PlayerSounds.Final.Giblets2'
	Physics=2
	RemoteRole=0
	LifeSpan=8.0000000
	bUnlit=true
	TransientSoundVolume=0.1700000
	bCollideWorld=true
	bUseCylinderCollision=true
	bBounce=true
	bFixedRotationDir=true
	Mass=30.0000000
}
