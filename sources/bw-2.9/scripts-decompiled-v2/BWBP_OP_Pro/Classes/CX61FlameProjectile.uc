class CX61FlameProjectile extends BallisticProjectile;

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
			HurtRadius(Damage, DamageRadius, MyRadiusDamageType, MomentumTransfer, EndPoint);
		}
		Destroy();
	}
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

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	local int i;
	local CX61ActorFire Burner;

	DoDamage(Other, HitLocation);
	// End:0x14C
	if(((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none)
	{
		i = 0;
		J0x54:

		// End:0xC1 [Loop If]
		if(i < Other.Attached.Length)
		{
			// End:0xB7
			if(CX61ActorFire(Other.Attached[i]) != none)
			{
				CX61ActorFire(Other.Attached[i]).AddFuel(0.1500000);
				// [Explicit Break]
				goto J0xC1;
			}
			i++;
			// [Loop Continue]
			goto J0x54;
		}
		J0xC1:

		// End:0x14C
		if(i >= Other.Attached.Length)
		{
			Burner = Spawn(Class'BWBP_OP_Pro.CX61ActorFire', Other,, Other.Location);
			Burner.Initialize(Other);
			// End:0x14C
			if(Instigator != none)
			{
				Burner.Instigator = Instigator;
				Burner.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

simulated function Penetrate(Actor Other, Vector HitLocation)
{
	AlreadyHit[AlreadyHit.Length] = Other;
	//return;	
}

defaultproperties
{
	bApplyParams=false
	WeaponClass=Class'BWBP_OP_Pro.CX61AssaultRifle'
	ModeIndex=1
	bPenetrate=true
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_CX61Burned'
	Speed=3000.0000000
	Damage=8.0000000
	DamageRadius=192.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_CX61Burned'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.3000000
	CollisionRadius=28.0000000
	CollisionHeight=28.0000000
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
