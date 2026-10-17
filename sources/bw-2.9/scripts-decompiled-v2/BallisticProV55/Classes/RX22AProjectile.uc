class RX22AProjectile extends BallisticProjectile;

var RX22AFireControl FireControl;
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

simulated function DoDamage(Actor Other, Vector HitLocation)
{
	local Vector Dummy;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, Damage, Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
	// End:0xD9
	if((xPawn(Other) != none) && Level.Game.ReduceDamage(10, xPawn(Other), Instigator, HitLocation, Dummy, MyDamageType) > 0)
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
	WeaponClass=Class'BallisticProV55.RX22AFlamer'
	bPenetrate=true
	Speed=3000.0000000
	MyDamageType=Class'BallisticProV55.DTRX22ABurned'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.3500000
	CollisionRadius=15.0000000
	CollisionHeight=15.0000000
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
