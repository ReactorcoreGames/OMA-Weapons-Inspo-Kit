class AK91_ZapProjectile extends BallisticProjectile;

var Supercharger_ChargeControl ChargeControl;
var Vector EndPoint;
var Vector StartPoint;
var array<Actor> AlreadyHit;

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
	// End:0x2F
	if((Vector(Rotation) Dot Normal(EndPoint - Location)) < 0.0000000)
	{
		Destroy();
	}
	//return;	
}

simulated function Timer()
{
	// End:0x49
	if(StartDelay > float(0))
	{
		SetCollision(true, false, false);
		StartDelay = 0.0000000;
		SetPhysics(default.Physics);
		bDynamicLight = default.bDynamicLight;
		bHidden = default.bHidden;
		InitProjectile();		
	}
	else
	{
		super.Timer();
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector Dummy;
	local int i;

	// End:0x3C
	if((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner)
	{
		return;
	}
	// End:0x56
	if(Other.Base == Instigator)
	{
		return;
	}
	i = 0;
	J0x5D:

	// End:0x8E [Loop If]
	if(i < AlreadyHit.Length)
	{
		// End:0x84
		if(AlreadyHit[i] == Other)
		{
			return;
		}
		i++;
		// [Loop Continue]
		goto J0x5D;
	}
	// End:0xAE
	if(int(Role) == int(ROLE_Authority))
	{
		DoDamage(Other, HitLocation);
	}
	// End:0xED
	if((CanPenetrate(Other)) && Other != HitActor)
	{
		AlreadyHit[AlreadyHit.Length] = Other;
		HitActor = Other;		
	}
	else
	{
		Destroy();
	}
	// End:0x165
	if((xPawn(Other) != none) && Level.Game.ReduceDamage(int(Damage), xPawn(Other), Instigator, HitLocation, Dummy, MyDamageType) > 0)
	{
		ChargeControl.FireSinge(Pawn(Other), Instigator, 2);
	}
	//return;	
}

defaultproperties
{
	bApplyParams=false
	WeaponClass=Class'BWBP_SKC_Pro.AK91ChargeRifle'
	bPenetrate=true
	Speed=3000.0000000
	Damage=5.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_AK91Zapped'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.6000000
	CollisionRadius=32.0000000
	CollisionHeight=32.0000000
	bCollideActors=false
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
