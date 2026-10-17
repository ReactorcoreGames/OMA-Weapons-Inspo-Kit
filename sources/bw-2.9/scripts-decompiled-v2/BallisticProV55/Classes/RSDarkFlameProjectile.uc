class RSDarkFlameProjectile extends BallisticProjectile;

var Vector EndPoint;
var Vector StartPoint;
var array<Actor> AlreadyHit;
var bool bHitWall;

simulated event PreBeginPlay()
{
	// End:0x2D
	if((Owner != none) && Pawn(Owner) != none)
	{
		Instigator = Pawn(Owner);
	}
	super(Actor).PreBeginPlay();
	//return;	
}

function InitFlame(Vector End)
{
	EndPoint = End;
	StartPoint = Location;
	//return;	
}

event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x57
	if((Vector(Rotation) Dot Normal(EndPoint - Location)) < 0.0000000)
	{
		// End:0x54
		if(bHitWall)
		{
			SpecialHurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, EndPoint);
		}
		Destroy();
	}
	//return;	
}

simulated function SpecialHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
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
	// End:0x19C
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x19B
		if((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != HurtWall)
		{
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x122
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

simulated function Timer()
{
	// End:0x44
	if(StartDelay > float(0))
	{
		SetCollision(true, false, false);
		StartDelay = 0.0000000;
		SetPhysics(default.Physics);
		bDynamicLight = default.bDynamicLight;
		bHidden = false;
		InitProjectile();		
	}
	else
	{
		super.Timer();
	}
	//return;	
}

simulated function bool CanTouch(Actor Other)
{
	local int i;

	// End:0x12
	if(!super.CanTouch(Other))
	{
		return false;
	}
	// End:0x2C
	if(Other.Base == Instigator)
	{
		return false;
	}
	i = 0;
	J0x33:

	// End:0x64 [Loop If]
	if(i < AlreadyHit.Length)
	{
		// End:0x5A
		if(AlreadyHit[i] == Other)
		{
			return false;
		}
		i++;
		// [Loop Continue]
		goto J0x33;
	}
	return true;
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local int i;
	local bool bWasAlive;
	local RSDarkPlasmaBurner PB;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local float AdjustedDamage;

	// End:0x12
	if(!CanTouch(Other))
	{
		return;
	}
	// End:0x451
	if(int(Role) == int(ROLE_Authority))
	{
		HealObjective = DestroyableObjective(Other);
		// End:0x56
		if(HealObjective == none)
		{
			HealObjective = DestroyableObjective(Other.Owner);
		}
		// End:0xEE
		if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
		{
			AdjustedDamage = (Damage * Instigator.DamageScaling) * float(4);
			// End:0xC2
			if(Instigator.HasUDamage())
			{
				AdjustedDamage *= float(2);
			}
			HealObjective.HealDamage(int(AdjustedDamage), Instigator.Controller, Class'BallisticProV55.DT_RSDarkPlasma');			
		}
		else
		{
			HealVehicle = Vehicle(Other);
			// End:0x196
			if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
			{
				AdjustedDamage = (Damage * Instigator.DamageScaling) * float(4);
				// End:0x16A
				if(Instigator.HasUDamage())
				{
					AdjustedDamage *= float(2);
				}
				HealVehicle.HealDamage(int(AdjustedDamage), Instigator.Controller, Class'BallisticProV55.DT_RSDarkPlasma');				
			}
			else
			{
				// End:0x25D
				if(((Pawn(Other) != none) && Instigator != none) && (Instigator.Controller == none) || Instigator.Controller.SameTeamAs(Pawn(Other).Controller))
				{
					AdjustedDamage = Damage * Instigator.DamageScaling;
					// End:0x231
					if(Instigator.HasUDamage())
					{
						AdjustedDamage *= float(2);
					}
					Other.HealDamage(int(AdjustedDamage), Instigator.Controller, Class'BallisticProV55.DT_RSDarkPlasma');					
				}
				else
				{
					// End:0x293
					if((xPawn(Other) != none) && Pawn(Other).Health > 0)
					{
						bWasAlive = true;						
					}
					else
					{
						// End:0x2EA
						if(((Vehicle(Other) != none) && Vehicle(Other).Driver != none) && Vehicle(Other).Driver.Health > 0)
						{
							bWasAlive = true;
						}
					}
					DoDamage(Other, HitLocation);
					// End:0x342
					if(bWasAlive && Pawn(Other).Health <= 0)
					{
						Class'BallisticProV55.RSDarkSoul'.static.SpawnSoul(HitLocation, Instigator, Pawn(Other), self);
					}
					// End:0x451
					if(Pawn(Other) != none)
					{
						i = 0;
						J0x359:

						// End:0x3C6 [Loop If]
						if(i < Other.Attached.Length)
						{
							// End:0x3BC
							if(RSDarkPlasmaBurner(Other.Attached[i]) != none)
							{
								RSDarkPlasmaBurner(Other.Attached[i]).AddPower(0.1500000);
								// [Explicit Break]
								goto J0x3C6;
							}
							i++;
							// [Loop Continue]
							goto J0x359;
						}
						J0x3C6:

						// End:0x451
						if(i >= Other.Attached.Length)
						{
							PB = Spawn(Class'BallisticProV55.RSDarkPlasmaBurner', Other,, Other.Location);
							PB.Initialize(Other);
							// End:0x451
							if(Instigator != none)
							{
								PB.Instigator = Instigator;
								PB.InstigatorController = Instigator.Controller;
							}
						}
					}
				}
			}
		}
	}
	// End:0x490
	if((CanPenetrate(Other)) && Other != HitActor)
	{
		AlreadyHit[AlreadyHit.Length] = Other;
		HitActor = Other;		
	}
	else
	{
		HurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, EndPoint);
		Destroy();
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.RSDarkStar'
	bPenetrate=true
	MyRadiusDamageType=Class'BallisticProV55.DT_RSDarkPlasma'
	Speed=3000.0000000
	Damage=6.0000000
	DamageRadius=192.0000000
	MyDamageType=Class'BallisticProV55.DT_RSDarkPlasma'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.6000000
	CollisionRadius=24.0000000
	CollisionHeight=24.0000000
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
