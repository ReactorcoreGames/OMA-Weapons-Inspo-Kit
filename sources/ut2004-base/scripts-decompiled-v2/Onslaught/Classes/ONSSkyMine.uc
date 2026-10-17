class ONSSkyMine extends ShockProjectile;

var ONSWeapon OwnerGun;
var bool bDoChainReaction;
var float MaxChainReactionDist;
var float ChainReactionDelay;
var Class<ShockBeamEffect> BeamEffectClass;
var Class<Emitter> ProjectileEffectClass;
var Emitter ProjectileEffect;

simulated function PostBeginPlay()
{
	super(Projectile).PostBeginPlay();
	// End:0x46
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ProjectileEffect = Spawn(ProjectileEffectClass, self,, Location, Rotation);
		ProjectileEffect.SetBase(self);
	}
	Velocity = Speed * Vector(Rotation);
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	OwnerGun = ONSWeapon(Owner);
	// End:0x41
	if(OwnerGun != none)
	{
		OwnerGun.Projectiles[OwnerGun.Projectiles.Length] = self;
	}
	//return;	
}

simulated function DestroyTrails()
{
	// End:0x17
	if(ProjectileEffect != none)
	{
		ProjectileEffect.Destroy();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(ProjectileEffect != none)
	{
		ProjectileEffect.Destroy();
	}
	super.Destroyed();
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x22
	if(DamageType == Class'XWeapons.DamTypeShockBeam')
	{
		ComboDamageType = DamageType;
		bDoChainReaction = false;
	}
	super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType);
	//return;	
}

function SuperExplosion()
{
	local Actor HitActor;
	local Vector HitLocation, HitNormal;
	local Emitter E;

	HurtRadius(ComboDamage, ComboRadius, Class'Onslaught.DamTypePRVCombo', ComboMomentumTransfer, Location);
	E = Spawn(Class'Onslaught.ONSPRVComboEffect');
	// End:0x68
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x65
		if(E != none)
		{
			E.LifeSpan = 0.2500000;
		}		
	}
	else
	{
		// End:0xCD
		if(EffectIsRelevant(Location, false))
		{
			HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 120.0000000), Location, false);
			// End:0xCD
			if(HitActor != none)
			{
				Spawn(Class'XEffects.ComboDecal', self,, HitLocation, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
			}
		}
	}
	PlaySound(ComboSound, 0, 1.0000000,, 800.0000000);
	DestroyTrails();
	// End:0x10E
	if(bDoChainReaction)
	{
		SetPhysics(0);
		SetCollision(false);
		bHidden = true;
		SetTimer(ChainReactionDelay, false);		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function Timer()
{
	local int X;
	local ShockBeamEffect Beam;
	local Projectile ChainTarget;
	local float BestDist;

	// End:0x1BB
	if(OwnerGun != none)
	{
		BestDist = MaxChainReactionDist;
		X = 0;
		J0x1D:

		// End:0x10B [Loop If]
		if(X < OwnerGun.Projectiles.Length)
		{
			// End:0x8B
			if((OwnerGun.Projectiles[X] == none) || OwnerGun.Projectiles[X] == self)
			{
				OwnerGun.Projectiles.Remove(X, 1);
				X--;
				// [Explicit Continue]
				goto J0x101;
			}
			// End:0x101
			if(VSize(Location - OwnerGun.Projectiles[X].Location) < BestDist)
			{
				ChainTarget = OwnerGun.Projectiles[X];
				BestDist = VSize(Location - OwnerGun.Projectiles[X].Location);
			}
			J0x101:

			X++;
			// [Loop Continue]
			goto J0x1D;
		}
		// End:0x1BB
		if(ChainTarget != none)
		{
			Beam = Spawn(BeamEffectClass,,, Location, Rotator(ChainTarget.Location - Location));
			Beam.Instigator = none;
			Beam.AimAt(ChainTarget.Location, Normal(ChainTarget.Location - Location));
			ChainTarget.TakeDamage(1, Instigator, ChainTarget.Location, vect(0.0000000, 0.0000000, 0.0000000), ComboDamageType);
		}
	}
	Destroy();
	//return;	
}

state WaitForCombo
{
	function Tick(float DeltaTime)
	{
		// End:0x55
		if((((ComboTarget == none) || ComboTarget.bDeleteMe) || ONSWeaponPawn(Instigator) == none) || ONSWeaponPawn(Instigator).Gun == none)
		{
			GotoState('None');
			return;
		}
		// End:0xD3
		if((Velocity Dot (ComboTarget.Location - Location)) <= float(0))
		{
			// End:0xC7
			if(VSize(ComboTarget.Location - Location) <= (ComboRadius + ComboTarget.CollisionRadius))
			{
				ONSWeaponPawn(Instigator).Gun.DoCombo();
			}
			GotoState('None');
			return;			
		}
		else
		{
			// End:0x131
			if(VSize(ComboTarget.Location - Location) <= ((0.5000000 * ComboRadius) + ComboTarget.CollisionRadius))
			{
				ONSWeaponPawn(Instigator).Gun.DoCombo();
				GotoState('None');
				return;
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	bDoChainReaction=true
	MaxChainReactionDist=2500.0000000
	ChainReactionDelay=0.2500000
	BeamEffectClass=Class'XWeapons.ShockBeamEffect'
	ProjectileEffectClass=Class'XEffects.ShockBall'
	ComboRadius=525.0000000
	ComboDamageType=Class'Onslaught.DamTypePRVLaser'
	Speed=950.0000000
	MaxSpeed=950.0000000
	Damage=25.0000000
	MomentumTransfer=25000.0000000
	MyDamageType=Class'Onslaught.DamTypeSkyMine'
	DrawType=0
	DrawScale=1.0500000
	Style=6
	CollisionRadius=20.0000000
	CollisionHeight=20.0000000
}
