class FM13FlameProjectile extends BallisticProjectile;

var FM13FireControl FireControl;
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
	local Vector Dummy;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	// End:0xDE
	if((xPawn(Other) != none) && Level.Game.ReduceDamage(int(Damage), xPawn(Other), Instigator, HitLocation, Dummy, MyDamageType) > 0)
	{
		FireControl.FireSinge(Pawn(Other), Instigator);
	}
	//return;	
}

simulated function Penetrate(Actor Other, Vector HitLocation)
{
	AlreadyHit[AlreadyHit.Length] = Other;
	//return;	
}

simulated function Explode(Vector A, Vector B)
{
	Destroy();
	//return;	
}

defaultproperties
{
	bApplyParams=false
	WeaponClass=Class'BWBP_OP_Pro.FM13Shotgun'
	bPenetrate=true
	StartDelay=0.0300000
	Speed=3000.0000000
	Damage=18.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_FM13Burned'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.3500000
	CollisionRadius=30.0000000
	CollisionHeight=30.0000000
	bCollideActors=false
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
