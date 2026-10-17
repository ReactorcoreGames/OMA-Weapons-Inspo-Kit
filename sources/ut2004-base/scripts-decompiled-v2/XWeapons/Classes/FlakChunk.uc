class FlakChunk extends Projectile;

var xEmitter Trail;
var byte Bounces;
var float DamageAtten;
var Sound ImpactSounds[6];

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		Bounces;
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
	local float R;

	// End:0x50
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x50
		if(!PhysicsVolume.bWaterVolume)
		{
			Trail = Spawn(Class'XEffects.FlakTrail', self);
			Trail.LifeSpan = LifeSpan;
		}
	}
	Velocity = Vector(Rotation) * Speed;
	// End:0x82
	if(PhysicsVolume.bWaterVolume)
	{
		Velocity *= 0.6500000;
	}
	R = FRand();
	// End:0xA4
	if(R > 0.7500000)
	{
		Bounces = 2;		
	}
	else
	{
		// End:0xBE
		if(R > 0.2500000)
		{
			Bounces = 1;			
		}
		else
		{
			Bounces = 0;
		}
	}
	SetRotation(RotRand());
	super.PostBeginPlay();
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0xF3
	if((FlakChunk(Other) == none) && (int(Physics) == int(2)) || Other != Instigator)
	{
		Speed = VSize(Velocity);
		// End:0xF0
		if(Speed > float(200))
		{
			// End:0xF0
			if(int(Role) == int(ROLE_Authority))
			{
				// End:0x93
				if((Instigator == none) || Instigator.Controller == none)
				{
					Other.SetDelayedDamageInstigatorController(InstigatorController);
				}
				Other.TakeDamage(Max(5, int(Damage - (DamageAtten * FMax(0.0000000, (default.LifeSpan - LifeSpan) - float(1))))), Instigator, HitLocation, (MomentumTransfer * Velocity) / Speed, MyDamageType);
			}
		}
		Destroy();
	}
	//return;	
}

simulated function Landed(Vector HitNormal)
{
	SetPhysics(0);
	LifeSpan = 1.0000000;
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0xDB
	if((!Wall.bStatic && !Wall.bWorldGeometry) && (Mover(Wall) == none) || Mover(Wall).bDamageTriggered)
	{
		// End:0xD6
		if(int(Level.NetMode) != int(NM_Client))
		{
			// End:0xA3
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Wall.TakeDamage(int(Damage), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
		}
		Destroy();
		return;
	}
	SetPhysics(2);
	// End:0x15E
	if(int(Bounces) > 0)
	{
		// End:0x11C
		if(!Level.bDropDetail && FRand() < 0.4000000)
		{
			PlaySound(ImpactSounds[Rand(6)]);
		}
		Velocity = 0.6500000 * (Velocity - ((2.0000000 * HitNormal) * (Velocity Dot HitNormal)));
		Bounces = byte(int(Bounces) - 1);
		return;
	}
	bBounce = false;
	// End:0x190
	if(Trail != none)
	{
		Trail.mRegen = false;
		Trail.SetPhysics(0);
	}
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume Volume)
{
	// End:0x3A
	if(Volume.bWaterVolume)
	{
		// End:0x2E
		if(Trail != none)
		{
			Trail.mRegen = false;
		}
		Velocity *= 0.6500000;
	}
	//return;	
}

defaultproperties
{
	Bounces=1
	DamageAtten=5.0000000
	ImpactSounds[0]=Sound'XEffects.Impact4Snd'
	ImpactSounds[1]=Sound'XEffects.Impact6Snd'
	ImpactSounds[2]=Sound'XEffects.Impact7Snd'
	ImpactSounds[3]=Sound'XEffects.Impact3'
	ImpactSounds[4]=Sound'XEffects.Impact1'
	ImpactSounds[5]=Sound'XEffects.Impact2'
	Speed=2500.0000000
	MaxSpeed=2700.0000000
	Damage=13.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'XWeapons.DamTypeFlakChunk'
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.FlakChunk'
	CullDistance=3000.0000000
	LifeSpan=2.7000000
	DrawScale=14.0000000
	AmbientGlow=254
	Style=5
	bBounce=true
}
