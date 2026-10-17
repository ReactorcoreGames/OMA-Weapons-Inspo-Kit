class AH104FlameProjectile extends BallisticProjectile;

var Vector EndPoint;
var Vector StartPoint;
var array<Actor> AlreadyHit;
var bool bHitWall;

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

simulated function bool CanTouch(Actor Other)
{
	local int i;

	// End:0x3C
	if((Other == none) || !bCanHitOwner && (Other == Instigator) || Other == Owner)
	{
		return false;
	}
	// End:0x56
	if(Other.Base == Instigator)
	{
		return false;
	}
	i = 0;
	J0x5D:

	// End:0x8E [Loop If]
	if(i < AlreadyHit.Length)
	{
		// End:0x84
		if(AlreadyHit[i] == Other)
		{
			return false;
		}
		i++;
		// [Loop Continue]
		goto J0x5D;
	}
	return true;
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	local int i;
	local AH104ActorFire Burner;

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
			if(AH104ActorFire(Other.Attached[i]) != none)
			{
				AH104ActorFire(Other.Attached[i]).AddFuel(0.1500000);
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
			Burner = Spawn(Class'BWBP_SKC_Pro.AH104ActorFire', Other,, Other.Location);
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
	WeaponClass=Class'BWBP_SKC_Pro.AH104Pistol'
	ModeIndex=1
	bPenetrate=true
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_AH104Burned'
	Speed=3000.0000000
	Damage=8.0000000
	DamageRadius=192.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_AH104Burned'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.3000000
	CollisionRadius=15.0000000
	CollisionHeight=15.0000000
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
