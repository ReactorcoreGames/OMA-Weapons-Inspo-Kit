class CX61HealProjectile extends BallisticProjectile;

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

function DoDamage(Actor Other, Vector HitLocation)
{
	local Pawn HealTarget;

	HealTarget = Pawn(Other);
	// End:0x33
	if((HealTarget == none) || !HealTarget.bProjTarget)
	{
		return;
	}
	// End:0xF4
	if(((Instigator.Controller != none) && HealTarget.Controller != none) && HealTarget.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xCC
		if(BallisticPawn(Other) != none)
		{
			BallisticPawn(HealTarget).GiveAttributedHealth(int(Damage), int(HealTarget.HealthMax), Instigator, false);			
		}
		else
		{
			HealTarget.GiveHealth(int(Damage), int(HealTarget.HealthMax));
		}
		return;
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
	WeaponClass=Class'BWBP_OP_Pro.CX61AssaultRifle'
	ModeIndex=1
	bPenetrate=true
	Speed=3000.0000000
	Damage=2.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_CX61Burned'
	bHidden=true
	RemoteRole=0
	LifeSpan=0.3000000
	CollisionRadius=40.0000000
	CollisionHeight=40.0000000
	bCollideWorld=false
	bBlockZeroExtentTraces=false
	bBlockNonZeroExtentTraces=false
}
