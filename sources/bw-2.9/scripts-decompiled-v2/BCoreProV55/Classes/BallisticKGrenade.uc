class BallisticKGrenade extends BallisticGrenade
	abstract;

var() Vector OldHitLoc;
var() Vector OldHitNorm;
var() Vector OldVelocity;
var() float LastImpactSoundTime;

simulated function InitProjectile()
{
	local Vector V;

	super(BallisticProjectile).InitProjectile();
	KGetCOMPosition(V);
	KAddImpulse(Velocity * float(50), V);
	//return;	
}

singular function BaseChange()
{
	local Vector V;

	// End:0x31
	if(Base == none)
	{
		SetPhysics(13);
		KGetCOMPosition(V);
		KAddImpulse(Velocity * float(20), V);
	}
	//return;	
}

simulated event ProcessTouch(Actor Other, Vector HitLocation)
{
	local float boneDist;
	local Vector VNorm;

	// End:0x2B
	if((Other == Instigator) && !bCanHitOwner || !bHasImpacted)
	{
		return;
	}
	// End:0x3C
	if(Other == HitActor)
	{
		return;
	}
	// End:0x49
	if(Base != none)
	{
		return;
	}
	// End:0x7E
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x102
	if((int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		Other.TakeDamage(int(Damage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), MyDamageType);
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		return;
	}
	// End:0x1F3
	if(((int(PlayerImpactType) == int(0)) || int(PlayerImpactType) == int(2)) && VSize(Velocity) > MinStickVelocity)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
		SetPhysics(0);
		VNorm = (Velocity Dot (HitLocation - Other.Location)) * (HitLocation - Other.Location);
		Velocity = (-VNorm * DampenFactor) + ((Velocity - VNorm) * DampenFactorParallel);
		SetPhysics(13);
		KAddImpulse(Velocity * float(20), Location);
		bHasImpacted = true;		
	}
	else
	{
		// End:0x2E8
		if((int(PlayerImpactType) == int(2)) && Base == none)
		{
			SetPhysics(0);
			// End:0x22E
			if(int(DetonateOn) == int(2))
			{
				SetTimer(DetonateDelay, false);
			}
			HitActor = Other;
			// End:0x294
			if((Other != Instigator) && int(Other.DrawType) == int(2))
			{
				Other.AttachToBone(self, Other.GetClosestBone(Location, Velocity, boneDist));				
			}
			else
			{
				SetBase(Other);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(ImpactDamage), Instigator, HitLocation, Velocity, ImpactDamageType);
			SetRotation(Rotator(Velocity));
			Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		}
	}
	//return;	
}

simulated event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	// End:0x29
	if((int(DetonateOn) == int(2)) && !bHasImpacted)
	{
		SetTimer(DetonateDelay, false);		
	}
	else
	{
		// End:0x4B
		if(int(DetonateOn) == int(1))
		{
			Explode(pos, impactNorm);
			return;
		}
	}
	bHasImpacted = true;
	// End:0x10E
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && VSize(impactVel) > float(250)) && (Level.TimeSeconds - LastImpactSoundTime) > 0.7000000)
	{
		LastImpactSoundTime = Level.TimeSeconds;
		// End:0xC8
		if(ImpactSound != none)
		{
			PlaySound(ImpactSound, 1);
		}
		// End:0x10E
		if((ImpactManager != none) && Other != none)
		{
			ImpactManager.static.StartSpawn(pos, impactNorm, int(Other.SurfaceType), Owner);
		}
	}
	//return;	
}

simulated event KVelDropBelow()
{
	SetPhysics(0);
	// End:0x50
	if((Trail != none) && !TrailWhenStill)
	{
		// End:0x44
		if(Emitter(Trail) != none)
		{
			Emitter(Trail).Kill();			
		}
		else
		{
			Trail.Destroy();
		}
	}
	//return;	
}

simulated event Tick(float dt)
{
	local Actor t;
	local Vector VNorm, NewVelocity, V;

	super.Tick(dt);
	// End:0x119
	if(((int(Physics) == int(13)) && OldHitNorm != vect(0.0000000, 0.0000000, 0.0000000)) && (Normal(Location - OldHitLoc) Dot OldHitNorm) < 0.0000000)
	{
		SetPhysics(0);
		SetLocation(OldHitLoc + (OldHitNorm * float(8)));
		VNorm = (OldVelocity Dot OldHitNorm) * OldHitNorm;
		NewVelocity = (-VNorm * DampenFactor) + ((OldVelocity - VNorm) * DampenFactorParallel);
		SetPhysics(13);
		KGetCOMPosition(V);
		KAddImpulse(NewVelocity * float(20), V);
		// End:0x119
		if(((int(Level.NetMode) != int(NM_DedicatedServer)) && VSize(OldVelocity) > float(250)) && ImpactSound != none)
		{
			PlaySound(ImpactSound, 1);
		}
	}
	t = Trace(OldHitLoc, OldHitNorm, Location + Velocity, Location, false, vect(1.0000000, 1.0000000, 1.0000000));
	OldVelocity = Velocity;
	//return;	
}

defaultproperties
{
	DampenFactor=0.7000000
	DampenFactorParallel=1.0000000
	bIgnoreEncroachers=true
	Physics=13
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bUseCylinderCollision=false
	bBlockKarma=true
	bFixedRotationDir=false
	// Reference: KarmaParams'BCoreProV55.BallisticKGrenade.KParams0'
	begin object name="KParams0" class=Engine.KarmaParams
		KMass=0.3000000
		KLinearDamping=0.0000000
		KAngularDamping=0.0000000
		KStartEnabled=true
		KVelDropBelowThreshold=20.0000000
		bHighDetailOnly=false
		bClientOnly=false
		bKDoubleTickRate=true
		KFriction=0.6500000
		KRestitution=0.5000000
		KImpactThreshold=100.0000000
	end object
	KParams=KParams0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: KarmaParams'BCoreProV55.BallisticKGrenade.KParams0'
begin object name="KParams0" class=Engine.KarmaParams
	KMass=0.3000000
	KLinearDamping=0.0000000
	KAngularDamping=0.0000000
	KStartEnabled=true
	KVelDropBelowThreshold=20.0000000
	bHighDetailOnly=false
	bClientOnly=false
	bKDoubleTickRate=true
	KFriction=0.6500000
	KRestitution=0.5000000
	KImpactThreshold=100.0000000
end object
