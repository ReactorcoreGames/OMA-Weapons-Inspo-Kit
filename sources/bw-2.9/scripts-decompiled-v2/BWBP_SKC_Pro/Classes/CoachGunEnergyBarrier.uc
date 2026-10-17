class CoachGunEnergyBarrier extends BallisticShield;

var Class<Actor> EffectWhenDestroyed;
var Sound TeleportSound;

function Timer()
{
	GotoState('Destroying');
	//return;	
}

simulated function TornOff()
{
	// End:0x2F
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		Spawn(EffectWhenDestroyed, Owner,, Location);
	}
	Destroy();
	//return;	
}

function bool BlocksShotAt(Actor Other)
{
	return true;
	//return;	
}

auto state Working
{
	function BeginState()
	{
		SetTimer(5.0000000, false);
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		//return;		
	}

	function Bump(Actor Other)
	{
		//return;		
	}

	function bool EncroachingOn(Actor Other)
	{
		// End:0x17
		if(Decoration(Other) != none)
		{
			GotoState('Destroying');
		}
		return false;
		//return;		
	}

	function Timer()
	{
		GotoState('Destroying');
		//return;		
	}
	stop;	
}

state Destroying
{Begin:

	bHidden = true;
	bTearOff = true;
	bAlwaysRelevant = true;
	SetCollision(false, false, false);
	// End:0x5B
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		Spawn(EffectWhenDestroyed, Owner,, Location);
		PlaySound(TeleportSound,, 1.0000000);
	}
	Sleep(0.5000000);
	Destroy();
	stop;		
}

defaultproperties
{
	EffectWhenDestroyed=Class'BWBP_SKC_Pro.WrenchWarpEndEmitter'
	TeleportSound=Sound'BWBP_OP_Sounds.Wrench.Teleport'
	StaticMesh=StaticMesh'BWBP_OP_Static.Wrench.EnergyWall'
	bStasis=false
	bNetInitialRotation=true
	NetUpdateFrequency=10.0000000
	DrawScale3D=(X=3.0000000,Y=3.0000000,Z=3.0000000)
	bShouldBaseAtStartup=true
	CollisionRadius=48.0000000
	CollisionHeight=90.0000000
	bFixedRotationDir=true
}
