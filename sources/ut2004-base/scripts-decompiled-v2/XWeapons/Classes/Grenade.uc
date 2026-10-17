class Grenade extends Projectile;

var float ExplodeTimer;
var bool bCanHitOwner;
var bool bHitWater;
var xEmitter Trail;
var() float DampenFactor;
var() float DampenFactorParallel;
var Class<xEmitter> HitEffectClass;
var float LastSparkTime;
var bool bTimerSet;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		ExplodeTimer;
}

simulated function Destroyed()
{
	// End:0x1C
	if(Trail != none)
	{
		Trail.mRegen = false;
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local PlayerController PC;

	super.PostBeginPlay();
	// End:0x90
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PC = Level.GetLocalPlayerController();
		// End:0x90
		if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(5500))
		{
			Trail = Spawn(Class'XEffects.GrenadeSmokeTrail', self,, Location, Rotation);
		}
	}
	// End:0xFC
	if(int(Role) == int(ROLE_Authority))
	{
		Velocity = Speed * Vector(Rotation);
		RandSpin(25000.0000000);
		bCanHitOwner = false;
		// End:0xFC
		if(Instigator.HeadVolume.bWaterVolume)
		{
			bHitWater = true;
			Velocity = 0.6000000 * Velocity;
		}
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	// End:0x21
	if(int(Physics) == int(0))
	{
		SetTimer(ExplodeTimer, false);
		bTimerSet = true;
	}
	//return;	
}

simulated function Timer()
{
	Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x52
	if(!Other.bWorldGeometry && (Other != Instigator) || bCanHitOwner)
	{
		Explode(HitLocation, Normal(HitLocation - Other.Location));
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;
	local PlayerController PC;

	// End:0x34
	if((Pawn(Wall) != none) || GameObjective(Wall) != none)
	{
		Explode(Location, HitNormal);
		return;
	}
	// End:0x50
	if(!bTimerSet)
	{
		SetTimer(ExplodeTimer, false);
		bTimerSet = true;
	}
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	RandSpin(100000.0000000);
	DesiredRotation.Roll = 0;
	RotationRate.Roll = 0;
	Speed = VSize(Velocity);
	// End:0x137
	if(Speed < float(20))
	{
		bBounce = false;
		PrePivot.Z = -1.5000000;
		SetPhysics(0);
		DesiredRotation = Rotation;
		DesiredRotation.Roll = 0;
		DesiredRotation.Pitch = 0;
		SetRotation(DesiredRotation);
		// End:0x134
		if(Trail != none)
		{
			Trail.mRegen = false;
		}		
	}
	else
	{
		// End:0x16D
		if((int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(250))
		{
			PlaySound(ImpactSound, 1);			
		}
		else
		{
			bFixedRotationDir = false;
			bRotateToDesired = true;
			DesiredRotation.Pitch = 0;
			RotationRate.Pitch = 50000;
		}
		// End:0x27B
		if(((!Level.bDropDetail && int(Level.DetailMode) != int(0)) && (Level.TimeSeconds - LastSparkTime) > 0.5000000) && EffectIsRelevant(Location, false))
		{
			PC = Level.GetLocalPlayerController();
			// End:0x267
			if((PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - Location) < float(6000))
			{
				Spawn(HitEffectClass,,, Location, Rotator(HitNormal));
			}
			LastSparkTime = Level.TimeSeconds;
		}
	}
	//return;	
}

simulated function BlowUp(Vector HitLocation)
{
	DelayedHurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	// End:0x37
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	BlowUp(HitLocation);
	PlaySound(Sound'WeaponSounds.BaseImpactAndExplosions.BExplosion3',, 2.5000000 * TransientSoundVolume);
	// End:0x65
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.NewExplosionB',,, HitLocation, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
		Spawn(ExplosionDecal, self,, HitLocation, Rotator(-HitNormal));
	}
	Destroy();
	//return;	
}

defaultproperties
{
	ExplodeTimer=2.0000000
	DampenFactor=0.5000000
	DampenFactorParallel=0.8000000
	HitEffectClass=Class'XEffects.WallSparks'
	Speed=1000.0000000
	MaxSpeed=1500.0000000
	TossZ=0.0000000
	Damage=70.0000000
	MomentumTransfer=75000.0000000
	MyDamageType=Class'XWeapons.DamTypeAssaultGrenade'
	ImpactSound=ProceduralSound'WeaponSounds.PGrenFloor1.P1GrenFloor1'
	ExplosionDecal=Class'XEffects.RocketMark'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.GrenadeMesh'
	Physics=2
	DrawScale=3.0000000
	AmbientGlow=100
	FluidSurfaceShootStrengthMod=3.0000000
	bBounce=true
	bFixedRotationDir=true
	DesiredRotation=(Pitch=12000,Yaw=5666,Roll=2334)
}
