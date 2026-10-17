class RSDarkFireBomb extends BallisticProjectile;

simulated event Tick(float dt)
{
	local Rotator R;

	// End:0x59
	if(Speed < MaxSpeed)
	{
		Speed = FMin(MaxSpeed, Speed + (float(16000) * dt));
		Velocity = Normal(Velocity) * Speed;
		// End:0x59
		if(Speed >= MaxSpeed)
		{
			SetPhysics(2);
		}
	}
	R.Roll = Rotation.Roll;
	SetRotation(Rotator(Velocity) + R);
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0xF5
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xDD
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale / float(2));
		}
		// End:0xF5
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Class<DamageType> dt;
	local float Dmg;
	local Actor Victim;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Victim = GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt);
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	//return;	
}

simulated function DoVehicleDriverRadius(Vehicle Other)
{
	Other.DriverRadiusDamage(Damage, DamageRadius, InstigatorController, MyDamageType, MomentumTransfer, Location);
	//return;	
}

singular simulated function HitWall(Vector HitNormal, Actor Wall)
{
	// End:0xDC
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xD4
		if(!Wall.bStatic && !Wall.bWorldGeometry)
		{
			// End:0x6F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Wall.SetDelayedDamageInstigatorController(InstigatorController);
			}
			DoDamage(Wall, Location);
			// End:0xC9
			if(((DamageRadius > float(0)) && Vehicle(Wall) != none) && Vehicle(Wall).Health > 0)
			{
				DoVehicleDriverRadius(Vehicle(Wall));
			}
			HurtWall = Wall;
		}
		MakeNoise(1.0000000);
	}
	Explode(Location + (ExploWallOut * HitNormal), HitNormal);
	HurtWall = none;
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	// End:0x24
	if((RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none)
	{
		return false;
	}
	return super.CanTouch(Other);
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x1AD
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1AC
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x133
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x3E
	if(Trail != none)
	{
		// End:0x32
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Kill();			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

state NetTrapped
{
	function BeginState()
	{
		HideProjectile();
		SetTimer(NetTrappedDelay, false);
		DestroyEffects();
		//return;		
	}
	stop;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	ImpactManager=Class'BallisticProV55.IM_RSDarkFireBomb'
	PenetrateManager=Class'BallisticProV55.IM_RSDarkFireBomb'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.RSDarkFireBombTrail'
	bRandomStartRotation=false
	bTearOnExplode=false
	DamageTypeHead=Class'BallisticProV55.DT_RSDarkFireBomb'
	MyRadiusDamageType=Class'BallisticProV55.DT_RSDarkFireBomb'
	ShakeRadius=384.0000000
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	Speed=4000.0000000
	MaxSpeed=4000.0000000
	bSwitchToZeroCollision=true
	Damage=130.0000000
	DamageRadius=256.0000000
	MomentumTransfer=80000.0000000
	MyDamageType=Class'BallisticProV55.DT_RSDarkFireBomb'
	LightType=1
	LightEffect=21
	LightBrightness=160.0000000
	LightRadius=12.0000000
	DrawType=0
	bDynamicLight=true
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	Physics=2
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire1FlyBy'
	LifeSpan=16.0000000
	DrawScale=1.5000000
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=8.0000000
	CollisionHeight=8.0000000
	bProjTarget=true
}
