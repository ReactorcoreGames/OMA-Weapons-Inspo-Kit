class XOXOBomb extends BallisticGrenade;

simulated function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x1D
	if(FRand() > 0.5000000)
	{
		SetStaticMesh(StaticMesh'BWBP_OP_Static.XOXO.X');
	}
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	DoDamage(Other, HitLocation);
	//return;	
}

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	// End:0x38
	if(Other.bProjTarget && (int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		return false;
	}
	// End:0x82
	if(!Other.bProjTarget || int(PlayerImpactType) == int(0))
	{
		HitWall(Normal(HitLocation - Other.Location), Other);
		return true;
	}
	return false;
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
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
	// End:0xC1
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		// End:0xBE
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}		
	}
	else
	{
		// End:0x118
		if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), dt);
	// End:0x196
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BWBP_OP_Pro.XOXOLewdness'.static.DistributeLewd(HitLocation, Instigator, Pawn(Other), self);
	}
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
	// End:0x2C4
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		bWasAlive = false;
		// End:0x2C3
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x13B
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			// End:0x1A0
			if((xPawn(Victims) != none) && Pawn(Victims).Health > 0)
			{
				// End:0x19D
				if((Monster(Victims) == none) || Pawn(Victims).default.Health > 275)
				{
					bWasAlive = true;
				}				
			}
			else
			{
				// End:0x1F7
				if(((Vehicle(Victims) != none) && Vehicle(Victims).Driver != none) && Vehicle(Victims).Driver.Health > 0)
				{
					bWasAlive = true;
				}
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x2C3
			if(bWasAlive && Pawn(Victims).Health <= 0)
			{
				Class'BWBP_OP_Pro.XOXOLewdness'.static.DistributeLewd(Victims.Location, Instigator, Pawn(Victims), self);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=2
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	DampenFactor=0.1500000
	DampenFactorParallel=0.3000000
	ArmingDelay=0.7500000
	DetonateDelay=0.6000000
	ImpactDamage=100
	ImpactDamageType=Class'BWBP_OP_Pro.DTXOXOBomb'
	WeaponClass=Class'BWBP_OP_Pro.XOXOStaff'
	ImpactManager=Class'BWBP_OP_Pro.IM_XOXO'
	PenetrateManager=Class'BWBP_OP_Pro.IM_XOXO'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.XOXOBombTrail'
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTXOXOBomb'
	Speed=2500.0000000
	MaxSpeed=2500.0000000
	Damage=100.0000000
	DamageRadius=768.0000000
	MomentumTransfer=-30000.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTXOXOBomb'
	LightType=1
	LightEffect=21
	LightHue=220
	LightSaturation=120
	LightBrightness=192.0000000
	LightRadius=6.0000000
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.O'
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.NovaStaff.Nova-Fire2FlyBy'
	LifeSpan=8.0000000
	DrawScale=3.0000000
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	RotationRate=(Pitch=0,Yaw=0,Roll=16384)
}
