class ShockProjectile extends Projectile;

var() Sound ComboSound;
var() float ComboDamage;
var() float ComboRadius;
var() float ComboMomentumTransfer;
var ShockBall ShockBallEffect;
var() int ComboAmmoCost;
var Class<DamageType> ComboDamageType;
var Pawn ComboTarget;
var Vector tempStartLoc;

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x26
	if(Pawn(Owner) != none)
	{
		Instigator = Pawn(Owner);
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x3B
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		ShockBallEffect = Spawn(Class'XEffects.ShockBall', self);
		ShockBallEffect.SetBase(self);
	}
	Velocity = Speed * Vector(Rotation);
	SetTimer(0.4000000, false);
	tempStartLoc = Location;
	//return;	
}

simulated function PostNetBeginPlay()
{
	local PlayerController PC;

	super(Actor).PostNetBeginPlay();
	// End:0x21
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x5D
	if((Instigator != none) && PC == Instigator.Controller)
	{
		return;
	}
	// End:0x9D
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		bDynamicLight = false;
		LightType = 0;		
	}
	else
	{
		// End:0xFC
		if(((PC == none) || PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(3000))
		{
			bDynamicLight = false;
			LightType = 0;
		}
	}
	//return;	
}

function Timer()
{
	SetCollisionSize(20.0000000, 20.0000000);
	//return;	
}

simulated function Destroyed()
{
	// End:0x32
	if(ShockBallEffect != none)
	{
		// End:0x23
		if(bNoFX)
		{
			ShockBallEffect.Destroy();			
		}
		else
		{
			ShockBallEffect.Kill();
		}
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function DestroyTrails()
{
	// End:0x17
	if(ShockBallEffect != none)
	{
		ShockBallEffect.Destroy();
	}
	//return;	
}

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	local Vector RefNormal, RefDir;

	// End:0x11
	if(Other == Instigator)
	{
		return;
	}
	// End:0x22
	if(Other == Owner)
	{
		return;
	}
	// End:0xB5
	if(Other.IsA('xPawn') && xPawn(Other).CheckReflect(HitLocation, RefNormal, int(Damage * 0.2500000)))
	{
		// End:0xA9
		if(int(Role) == int(ROLE_Authority))
		{
			RefDir = RefNormal;
			Spawn(Class, Other,, HitLocation + (RefDir * float(20)), Rotator(RefDir));
		}
		DestroyTrails();
		Destroy();		
	}
	else
	{
		// End:0x141
		if(!Other.IsA('Projectile') || Other.bProjTarget)
		{
			Explode(HitLocation, Normal(HitLocation - Other.Location));
			// End:0x141
			if(ShockProjectile(Other) != none)
			{
				ShockProjectile(Other).Explode(HitLocation, Normal(Other.Location - HitLocation));
			}
		}
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	// End:0x2F
	if(int(Role) == int(ROLE_Authority))
	{
		HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, HitLocation);
	}
	PlaySound(ImpactSound, 1);
	// End:0x95
	if(EffectIsRelevant(Location, false))
	{
		Spawn(Class'XEffects.ShockExplosionCore',,, Location);
		// End:0x95
		if(!Level.bDropDetail && int(Level.DetailMode) != int(0))
		{
			Spawn(Class'XEffects.ShockExplosion',,, Location);
		}
	}
	SetCollisionSize(0.0000000, 0.0000000);
	Destroy();
	//return;	
}

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x6D
	if(DamageType == ComboDamageType)
	{
		Instigator = EventInstigator;
		SuperExplosion();
		// End:0x6D
		if((EventInstigator != none) && EventInstigator.Weapon != none)
		{
			EventInstigator.Weapon.ConsumeAmmo(0, float(ComboAmmoCost), true);
			Instigator = EventInstigator;
		}
	}
	//return;	
}

function SuperExplosion()
{
	local Actor HitActor;
	local Vector HitLocation, HitNormal;

	HurtRadius(ComboDamage, ComboRadius, Class'XWeapons.DamTypeShockCombo', ComboMomentumTransfer, Location);
	Spawn(Class'XEffects.ShockCombo');
	// End:0xA7
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectIsRelevant(Location, false))
	{
		HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 120.0000000), Location, false);
		// End:0xA7
		if(HitActor != none)
		{
			Spawn(Class'XEffects.ComboDecal', self,, HitLocation, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		}
	}
	PlaySound(ComboSound, 0, 1.0000000,, 800.0000000);
	DestroyTrails();
	Destroy();
	//return;	
}

function Monitor(Pawn P)
{
	ComboTarget = P;
	// End:0x1D
	if(ComboTarget != none)
	{
		GotoState('WaitForCombo');
	}
	//return;	
}

state WaitForCombo
{
	function Tick(float DeltaTime)
	{
		// End:0x50
		if((((ComboTarget == none) || ComboTarget.bDeleteMe) || Instigator == none) || ShockRifle(Instigator.Weapon) == none)
		{
			GotoState('None');
			return;
		}
		// End:0xD4
		if((VSize(ComboTarget.Location - Location) <= ((0.5000000 * ComboRadius) + ComboTarget.CollisionRadius)) || (Velocity Dot (ComboTarget.Location - Location)) <= float(0))
		{
			ShockRifle(Instigator.Weapon).DoCombo();
			GotoState('None');
			return;
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ComboSound=Sound'WeaponSounds.ShockRifle.ShockComboFire'
	ComboDamage=200.0000000
	ComboRadius=275.0000000
	ComboMomentumTransfer=150000.0000000
	ComboAmmoCost=3
	ComboDamageType=Class'XWeapons.DamTypeShockBeam'
	Speed=1150.0000000
	MaxSpeed=1150.0000000
	bSwitchToZeroCollision=true
	Damage=45.0000000
	DamageRadius=150.0000000
	MomentumTransfer=70000.0000000
	MyDamageType=Class'XWeapons.DamTypeShockBall'
	ImpactSound=Sound'WeaponSounds.ShockRifle.ShockRifleExplosion'
	ExplosionDecal=Class'XEffects.ShockImpactScorch'
	MaxEffectDistance=7000.0000000
	LightType=1
	LightEffect=21
	LightHue=195
	LightSaturation=85
	LightBrightness=255.0000000
	LightRadius=4.0000000
	DrawType=1
	CullDistance=4000.0000000
	bDynamicLight=true
	bNetTemporary=false
	bOnlyDirtyReplication=true
	AmbientSound=Sound'WeaponSounds.ShockRifle.ShockRifleProjectile'
	LifeSpan=10.0000000
	Texture=Texture'XEffectMat.Shock.shock_core_low'
	DrawScale=0.7000000
	Skins[0]=Texture'XEffectMat.Shock.shock_core_low'
	Style=3
	FluidSurfaceShootStrengthMod=8.0000000
	SoundVolume=50
	SoundRadius=100.0000000
	CollisionRadius=10.0000000
	CollisionHeight=10.0000000
	bProjTarget=true
	bAlwaysFaceCamera=true
	ForceType=2
	ForceRadius=40.0000000
	ForceScale=5.0000000
}
