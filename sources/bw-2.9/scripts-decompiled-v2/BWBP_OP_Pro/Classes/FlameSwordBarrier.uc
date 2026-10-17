class FlameSwordBarrier extends BallisticShield;

var Class<Actor> EffectWhenDestroyed;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	PlaySound(Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Ignite',, 1.0000000);
	// End:0x40
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(EffectWhenDestroyed, Owner,, Location);
	}
	//return;	
}

function Timer()
{
	GotoState('Destroying');
	//return;	
}

simulated function TornOff()
{
	// End:0x3D
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		Spawn(EffectWhenDestroyed, Owner,, Location);
		PlaySound(Sound'BW_Core_WeaponSound.RX22A.RX22A-FlyBy',, 1.0000000);
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
		SetTimer(3.0000000, false);
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
		PlaySound(Sound'BW_Core_WeaponSound.RX22A.RX22A-FlyBy',, 1.0000000);
	}
	Sleep(0.5000000);
	Destroy();
	stop;		
}

defaultproperties
{
	EffectWhenDestroyed=Class'BallisticProV55.IE_FireExplosion'
	StaticMesh=StaticMesh'BWBP_OP_Static.FlameSword.FlameSword_Shield'
	bStasis=false
	bNetInitialRotation=true
	NetUpdateFrequency=10.0000000
	DrawScale3D=(X=4.5000000,Y=4.5000000,Z=4.5000000)
	bUnlit=true
	bShouldBaseAtStartup=true
	CollisionRadius=48.0000000
	CollisionHeight=128.0000000
	bFixedRotationDir=true
}
