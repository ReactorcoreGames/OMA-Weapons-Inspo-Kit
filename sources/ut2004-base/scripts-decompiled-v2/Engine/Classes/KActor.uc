class KActor extends Actor
	native
	placeable;

var(Karma) bool bKTakeShot;
var() array<Sound> ImpactSounds;
var() float ImpactVolume;
var() Class<Actor> ImpactEffect;
var() bool bOrientImpactEffect;
var() float ImpactInterval;
var transient float LastImpactTime;

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	local Vector ApplyImpulse;

	// End:0x61
	if(bKTakeShot && DamageType.default.KDamageImpulse > float(0))
	{
		// End:0x34
		if(VSize(Momentum) < 0.0010000)
		{
			return;
		}
		ApplyImpulse = Normal(Momentum) * DamageType.default.KDamageImpulse;
		KAddImpulse(ApplyImpulse, HitLocation);
	}
	//return;	
}

function Trigger(Actor Other, Pawn EventInstigator)
{
	KWake();
	//return;	
}

event KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
	local int numSounds, SoundNum;

	// End:0xB9
	if(Level.TimeSeconds > (LastImpactTime + ImpactInterval))
	{
		numSounds = ImpactSounds.Length;
		// End:0x58
		if(numSounds > 0)
		{
			SoundNum = Rand(numSounds);
			PlaySound(ImpactSounds[SoundNum], 4, ImpactVolume);
		}
		// End:0xA5
		if((ImpactEffect != none) && EffectIsRelevant(pos, false))
		{
			// End:0x96
			if(bOrientImpactEffect)
			{
				Spawn(ImpactEffect, self,, pos, Rotator(impactVel));				
			}
			else
			{
				Spawn(ImpactEffect, self,, pos);
			}
		}
		LastImpactTime = Level.TimeSeconds;
	}
	//return;	
}

defaultproperties
{
	bKTakeShot=true
	DrawType=8
	bNoDelete=true
	Physics=13
	RemoteRole=0
	CollisionRadius=1.0000000
	CollisionHeight=1.0000000
	bCollideActors=true
	bBlockActors=true
	bProjTarget=true
	bBlockKarma=true
	bEdShouldSnap=true
}
