class SkrithStaffPower extends BallisticProjectile;

var Vector StartLocation;
var bool bScaleDone;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	StartLocation = Location;
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0xEF
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xD7
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0xEF
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
	local bool bWasAlive;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Victim = GetDamageVictim(Other, HitLocation, Normal(Velocity), Dmg, dt);
	// End:0x92
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		bWasAlive = true;		
	}
	else
	{
		// End:0xE9
		if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	//return;	
}

simulated function DoVehicleDriverRadius(Vehicle Other)
{
	local bool bWasAlive;
	local Pawn D;

	// End:0x4F
	if((Other.Driver != none) && Other.Driver.Health > 0)
	{
		D = Other.Driver;
		bWasAlive = true;
	}
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

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	// End:0x60
	if((((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner) || RSDarkProjectile(Other) != none) || RSDarkFastProjectile(Other) != none)
	{
		return;
	}
	// End:0x80
	if(int(Role) == int(ROLE_Authority))
	{
		DoDamage(Other, HitLocation);
	}
	HitActor = Other;
	Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool bWasAlive;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x245
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x244
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			// End:0xC3
			if((xPawn(Victims) != none) && Pawn(Victims).Health > 0)
			{
				bWasAlive = true;				
			}
			else
			{
				// End:0x11D
				if(((Vehicle(Victims) != none) && Vehicle(Victims).Driver != none) && Vehicle(Victims).Driver.Health > 0)
				{
					bWasAlive = true;					
				}
				else
				{
					bWasAlive = false;
				}
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x1CB
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
	ImpactManager=Class'BWBP_SWC_Pro.IM_SkrithStaffPower'
	PenetrateManager=Class'BWBP_SWC_Pro.IM_SkrithStaffPower'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SWC_Pro.SkrithStaffPowerTrail'
	bRandomStartRotation=false
	bTearOnExplode=false
	DamageTypeHead=Class'BWBP_SWC_Pro.DT_SkrithStaffPower'
	MyRadiusDamageType=Class'BWBP_SWC_Pro.DT_SkrithStaffPower'
	ShakeRadius=384.0000000
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	Speed=7000.0000000
	MaxSpeed=7000.0000000
	bSwitchToZeroCollision=true
	Damage=95.0000000
	DamageRadius=190.0000000
	MomentumTransfer=80000.0000000
	MyDamageType=Class'BWBP_SWC_Pro.DT_SkrithStaffPower'
	LightType=1
	LightEffect=21
	LightHue=15
	LightSaturation=40
	LightBrightness=160.0000000
	LightRadius=12.0000000
	DrawType=0
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	bDynamicLight=true
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	Physics=2
	AmbientSound=Sound'BW_Core_WeaponSound.A73.A73ProjFly'
	LifeSpan=16.0000000
	Skins[0]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BPowerF2'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.A73RedLayout.A73BPowerF1'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=8.0000000
	CollisionHeight=8.0000000
	bProjTarget=true
}
