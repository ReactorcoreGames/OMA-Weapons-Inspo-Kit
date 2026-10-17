class RGPXFlakGrenade extends BallisticGrenade;

var RGPXFlakRocket FlakProj[6];
var int OldMagAmmo;

simulated function PostNetBeginPlay()
{
	super(BallisticProjectile).PostNetBeginPlay();
	SetTimer(ArmingDelay, false);
	//return;	
}

simulated function Timer()
{
	// End:0x15
	if(StartDelay > float(0))
	{
		super.Timer();
		return;
	}
	// End:0x2B
	if(!bHasImpacted)
	{
		DetonateOn = 1;		
	}
	else
	{
		Explode(Location, vect(0.0000000, 0.0000000, 1.0000000));
	}
	//return;	
}

simulated event HitWall(Vector HitNormal, Actor Wall)
{
	local Vector VNorm;

	// End:0x25
	if(int(DetonateOn) == int(1))
	{
		Explode(Location, HitNormal);
		return;		
	}
	else
	{
		// End:0x4B
		if((int(DetonateOn) == int(2)) && !bHasImpacted)
		{
			SetTimer(DetonateDelay, false);
		}
	}
	// End:0x73
	if(Pawn(Wall) != none)
	{
		DampenFactor *= 0.2000000;
		DampenFactorParallel *= 0.2000000;
	}
	bCanHitOwner = true;
	bHasImpacted = true;
	VNorm = (Velocity Dot HitNormal) * HitNormal;
	Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
	// End:0xDD
	if(RandomSpin != float(0))
	{
		RandSpin(100000.0000000);
	}
	Speed = VSize(Velocity / float(2));
	// End:0x12C
	if(Speed < float(20))
	{
		bBounce = false;
		SetPhysics(0);
		// End:0x129
		if((Trail != none) && !TrailWhenStill)
		{
			DestroyEffects();
		}		
	}
	else
	{
		// End:0x237
		if((((((Pawn(Wall) == none) && int(Level.NetMode) != int(NM_DedicatedServer)) && Speed > float(100)) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false))
		{
			// End:0x1C3
			if(ImpactSound != none)
			{
				PlaySound(ImpactSound, 1, 1.5000000);
			}
			// End:0x209
			if(Instigator == none)
			{
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Level.GetLocalPlayerController());				
			}
			else
			{
				ReflectImpactManager.static.StartSpawn(Location, HitNormal, int(Wall.SurfaceType), Instigator);
			}
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Vector Start, NewNormal;
	local Rotator Dir;
	local int i;
	local BallisticWeapon BW;

	BW = BallisticWeapon(Instigator.Weapon);
	Start = Location + (float(30) * HitNormal);
	// End:0x160
	if((flakcount > 0) && FlakClass != none)
	{
		i = 0;
		J0x50:

		// End:0x160 [Loop If]
		if(i < OldMagAmmo)
		{
			NewNormal = HitNormal;
			NewNormal.X += ((FRand() * 0.4000000) - 0.2000000);
			NewNormal.Y += ((FRand() * 0.4000000) - 0.2000000);
			NewNormal.Z += ((FRand() * 0.4000000) - 0.2000000);
			Dir = Rotator(NewNormal);
			Dir.Yaw += (65536 / (flakcount - 1));
			Dir.Pitch = -12386 - 2000;
			FlakProj[i] = RGPXFlakRocket(Spawn(FlakClass,,, Start, Dir));
			FlakProj[i].Instigator = Instigator;
			FlakProj[i].InitFlak(500.0000000);
			i++;
			// [Loop Continue]
			goto J0x50;
		}
	}
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated function BlowUp(Vector HitLocation)
{
	TargetedHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	// End:0x3C
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

defaultproperties
{
	DetonateOn=2
	PlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	bNoInitialSpin=true
	bAlignToVelocity=true
	ArmingDelay=0.0250000
	DetonateDelay=1.0000000
	flakcount=6
	FlakClass=Class'BWBP_JCF_Pro.RGPXFlakRocket'
	ImpactDamage=40
	ImpactDamageType=Class'BWBP_JCF_Pro.DTRGPXBazooka'
	WeaponClass=Class'BWBP_JCF_Pro.RGPXBazooka'
	ImpactManager=Class'BWBP_JCF_Pro.IM_RPG'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.M50GrenadeTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_JCF_Pro.DTRGPXBazookaRadius'
	WallPenetrationForce=128.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=1800.0000000
	Damage=110.0000000
	DamageRadius=512.0000000
	MyDamageType=Class'BWBP_JCF_Pro.DTRGPXBazookaRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BWBP_JCF_Static.RGP-X350.RGP-X350_ProjMain'
	DrawScale=0.1800000
	bIgnoreTerminalVelocity=true
}
