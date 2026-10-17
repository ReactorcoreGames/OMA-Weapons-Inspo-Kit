class CarpetBomberBomb extends AirstrikeBombBase;

function BeginPlay()
{
	super(Actor).BeginPlay();
	//return;	
}

simulated function PostBeginPlay()
{
	local Vector Dir;

	// End:0x18
	if(bDeleteMe || IsInState('Dying'))
	{
		return;
	}
	Dir = Vector(Rotation);
	Velocity = Speed * Dir;
	super(Projectile).PostBeginPlay();
	RandSpin(125000.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local Emitter E;

	E = Spawn(ExplosionEffectClass,,, HitLocation - (float(100) * Normal(Velocity)), rot(0, 16384, 0));
	Spawn(Class'BWBPAirstrikesPro.CarpetBombExplosion',,, HitLocation + (HitNormal * float(16)), Rotator(HitNormal) + rot(-16384, 0, 0));
	// End:0xA2
	if((ExplosionDecal != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(ExplosionDecal, self,, Location, Rotator(-HitNormal));
	}
	MakeNoise(1.0000000);
	SetPhysics(0);
	bHidden = true;
	GotoState('Dying');
	//return;	
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0xF9
	if((Damage > 999999) && ((((instigatedBy == none) || instigatedBy.Controller == none) || Instigator == none) || Instigator.Controller == none) || !instigatedBy.Controller.SameTeamAs(Instigator.Controller))
	{
		// End:0xC0
		if(((instigatedBy == none) || DamageType.default.bVehicleHit) || DamageType == Class'Engine.Crushed')
		{
			BlowUp(Location);			
		}
		else
		{
			Spawn(Class'XEffects.SmallRedeemerExplosion');
			SetCollision(false, false, false);
			HurtRadius(float(Damage), DamageRadius * 0.1250000, MyDamageType, MomentumTransfer, Location);
			Destroy();
		}
	}
	//return;	
}

function Timer()
{
	//return;	
}

state Dying
{
	function BeginState()
	{
		bHidden = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		ShakeView();
		InitialState = 'Dying';
		// End:0x3B
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		//return;		
	}
Begin:

	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(Damage, DamageRadius * 0.5000000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.5000000);
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location);
	Destroy();
	stop;				
}

defaultproperties
{
	ExplosionEffectClass=Class'BWBPAirstrikesPro.CarpetBombExplosion'
	Speed=5.0000000
	Damage=150.0000000
	DamageRadius=768.0000000
	ExplosionDecal=Class'BWBPAirstrikesPro.CarpetBlastMark'
	Physics=2
}
