class LinkProjectile extends Projectile;

var NewLinkTrail Trail;
var int Links;

replication
{
	// Pos:0x000
	reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
		Links;
}

simulated function Destroyed()
{
	// End:0x17
	if(Trail != none)
	{
		Trail.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PostBeginPlay()
{
	local Rotator R;

	super.PostBeginPlay();
	Velocity = Vector(Rotation);
	Velocity *= Speed;
	R = Rotation;
	R.Roll = Rand(65536);
	SetRotation(R);
	//return;	
}

simulated function LinkAdjust()
{
	// End:0x55
	if(Links > 0)
	{
		// End:0x25
		if(Trail != none)
		{
			Trail.MakeYellow();
		}
		MaxSpeed = default.MaxSpeed + float(350 * Links);
		Skins[0] = FinalBlend'XEffectMat.Link.LinkProjYellowFB';
		LightHue = 40;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	local float Dist;
	local PlayerController PC;

	Acceleration = Normal(Velocity) * 3000.0000000;
	// End:0x57
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(Level.DetailMode) != int(0))
	{
		Trail = Spawn(Class'XEffects.NewLinkTrail', self);
	}
	// End:0xF9
	if(((Trail != none) && Instigator != none) && Instigator.IsLocallyControlled())
	{
		// End:0xAA
		if(int(Role) == int(ROLE_Authority))
		{
			Trail.Delay(0.1000000);			
		}
		else
		{
			Dist = VSize(Location - Instigator.Location);
			// End:0xF9
			if(Dist < float(100))
			{
				Trail.Delay(0.1000000 - (Dist / float(1000)));
			}
		}
	}
	// End:0x10F
	if(int(Role) < int(ROLE_Authority))
	{
		LinkAdjust();
	}
	// End:0x12A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x16A
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		PC = Level.GetLocalPlayerController();
		// End:0x1C1
		if(((PC == none) || Instigator == none) || PC != Instigator.Controller)
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x49
	if(EffectIsRelevant(Location, false))
	{
		// End:0x33
		if(Links == 0)
		{
			Spawn(Class'XEffects.LinkProjSparks',,, HitLocation, Rotator(HitNormal));			
		}
		else
		{
			Spawn(Class'XEffects.LinkProjSparksYellow',,, HitLocation, Rotator(HitNormal));
		}
	}
	PlaySound(SoundGroup'WeaponSounds.BioRifle.BioRifleGoo2');
	Destroy();
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector X, RefNormal, RefDir;

	// End:0x11
	if(Other == Instigator)
	{
		return;
	}
	// End:0x22
	if(Other == Owner)
	{
		return;
	}
	// End:0xD8
	if(Other.IsA('xPawn') && xPawn(Other).CheckReflect(HitLocation, RefNormal, int(Damage * 0.2500000)))
	{
		// End:0xD2
		if(int(Role) == int(ROLE_Authority))
		{
			X = Normal(Velocity);
			RefDir = X - ((2.0000000 * RefNormal) * (X Dot RefNormal));
			Spawn(Class, Other,, HitLocation + (RefDir * float(20)), Rotator(RefDir));
		}
		Destroy();		
	}
	else
	{
		// End:0x1A2
		if(!Other.IsA('Projectile') || Other.bProjTarget)
		{
			// End:0x18A
			if(int(Role) == int(ROLE_Authority))
			{
				// End:0x147
				if((Instigator == none) || Instigator.Controller == none)
				{
					Other.SetDelayedDamageInstigatorController(InstigatorController);
				}
				Other.TakeDamage(int(Damage * (1.0000000 + float(Links))), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
			}
			Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
		}
	}
	//return;	
}

simulated function HitWall(Vector HitNormal, Actor Wall)
{
	Damage *= float(1 + Links);
	super.HitWall(HitNormal, Wall);
	//return;	
}

defaultproperties
{
	Speed=1000.0000000
	MaxSpeed=4000.0000000
	Damage=30.0000000
	DamageRadius=0.0000000
	MyDamageType=Class'XWeapons.DamTypeLinkPlasma'
	ExplosionDecal=Class'XEffects.LinkBoltScorch'
	MaxEffectDistance=7000.0000000
	LightType=1
	LightEffect=21
	LightHue=100
	LightSaturation=100
	LightBrightness=255.0000000
	LightRadius=3.0000000
	DrawType=8
	StaticMesh=StaticMesh'WeaponStaticMesh.LinkProjectile'
	CullDistance=3500.0000000
	bDynamicLight=true
	AmbientSound=Sound'WeaponSounds.LinkGun.LinkGunProjectile'
	LifeSpan=3.0000000
	DrawScale3D=(X=2.2950000,Y=1.5300000,Z=1.5300000)
	PrePivot=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	AmbientGlow=217
	Style=6
	FluidSurfaceShootStrengthMod=6.0000000
	SoundVolume=255
	SoundRadius=50.0000000
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=80000)
	ForceType=2
	ForceRadius=30.0000000
	ForceScale=5.0000000
}
