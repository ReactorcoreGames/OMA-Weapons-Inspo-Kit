class WrenchShieldGeneratorB extends WrenchDeployable;

var WrenchShield ShieldActor;

function PostBeginPlay()
{
	super.PostBeginPlay();
	ShieldActor = Spawn(Class'BWBP_OP_Pro.WrenchShield', self,, Location + vect(0.0000000, 0.0000000, 56.0000000));
	//return;	
}

function Timer()
{
	GotoState('Destroying');
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(ShieldActor != none)
	{
		ShieldActor.Destroy();
	}
	super.Destroyed();
	//return;	
}

auto state Working
{
	function BeginState()
	{
		SetTimer(12.0000000, false);
		//return;		
	}

	function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
	{
		// End:0x16
		if(!DamageType.default.bLocationalHit)
		{
			return;
		}
		super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
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
	// End:0x35
	if(ShieldActor != none)
	{
		ShieldActor.Destroy();
	}
	// End:0x93
	if((EffectWhenDestroyed != none) && EffectIsRelevant(Location, false))
	{
		// End:0x72
		if(!bWarpOut)
		{
			Spawn(EffectWhenDestroyed, Owner,, Location);			
		}
		else
		{
			Spawn(Class'BWBP_OP_Pro.WrenchWarpEndEmitter', Owner,, Location);
			PlaySound(Sound'BWBP_OP_Sounds.Wrench.Teleport',, 1.0000000);
		}
	}
	Sleep(0.5000000);
	Destroy();
	stop;		
}

defaultproperties
{
	TeamSkinIndex=0
	TeamSkins[0]=Texture'DespTech.T4-2'
	TeamSkins[1]=Texture'BWBP_OP_Tex.Wrench.ShieldGenerator_BLU'
	StaticMesh=StaticMesh'BWBP_OP_Static.Wrench.ShieldGenCore'
	DrawScale3D=(X=1.5000000,Y=1.5000000,Z=1.0000000)
	CollisionRadius=48.0000000
	CollisionHeight=32.0000000
	bUseCylinderCollision=true
}
