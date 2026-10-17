class LeopardMG extends ONSWeapon;

var(Bullet) Class<Emitter> ImpactEffect;
var(Bullet) Class<Emitter> mTracerClass;
var editinline Emitter mTracer;
var(Bullet) float mTracerInterval;
var(Bullet) float mTracerPullback;
var(Bullet) float mTracerMinDistance;
var(Bullet) float mTracerSpeed;
var float mLastTracerTime;

function byte BestMode()
{
	return 0;
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(mTracer != none)
	{
		mTracer.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function UpdateTracer()
{
	local Vector SpawnDir, spawnVel;
	local float hitDist;

	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0x34
	if(mTracer == none)
	{
		mTracer = Spawn(mTracerClass);
	}
	// End:0x76
	if(Level.bDropDetail || int(Level.DetailMode) == int(0))
	{
		mTracerInterval = 2.0000000 * default.mTracerInterval;		
	}
	else
	{
		mTracerInterval = default.mTracerInterval;
	}
	// End:0x2DD
	if((mTracer != none) && Level.TimeSeconds > (mLastTracerTime + mTracerInterval))
	{
		mTracer.SetLocation(WeaponFireLocation);
		hitDist = VSize(LastHitLocation - WeaponFireLocation) - mTracerPullback;
		// End:0x108
		if((Instigator != none) && Instigator.IsLocallyControlled())
		{
			SpawnDir = Vector(WeaponFireRotation);			
		}
		else
		{
			SpawnDir = Normal(LastHitLocation - WeaponFireLocation);
		}
		// End:0x2C9
		if(hitDist > mTracerMinDistance)
		{
			spawnVel = SpawnDir * mTracerSpeed;
			mTracer.Emitters[0].StartVelocityRange.X.Min = spawnVel.X;
			mTracer.Emitters[0].StartVelocityRange.X.Max = spawnVel.X;
			mTracer.Emitters[0].StartVelocityRange.Y.Min = spawnVel.Y;
			mTracer.Emitters[0].StartVelocityRange.Y.Max = spawnVel.Y;
			mTracer.Emitters[0].StartVelocityRange.Z.Min = spawnVel.Z;
			mTracer.Emitters[0].StartVelocityRange.Z.Max = spawnVel.Z;
			mTracer.Emitters[0].LifetimeRange.Min = hitDist / mTracerSpeed;
			mTracer.Emitters[0].LifetimeRange.Max = mTracer.Emitters[0].LifetimeRange.Min;
			mTracer.SpawnParticle(1);
		}
		mLastTracerTime = Level.TimeSeconds;
	}
	//return;	
}

simulated function FlashMuzzleFlash()
{
	super.FlashMuzzleFlash();
	// End:0x24
	if(int(Role) < int(ROLE_Authority))
	{
		DualFireOffset *= float(-1);
	}
	// End:0x5A
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectEmitter != none)
	{
		AttachToBone(EffectEmitter, WeaponFireAttachmentBone);
	}
	UpdateTracer();
	//return;	
}

state InstantFireMode
{
	simulated function SpawnHitEffects(Actor HitActor, Vector HitLocation, Vector HitNormal)
	{
		local PlayerController PC;

		PC = Level.GetLocalPlayerController();
		// End:0xA7
		if((PC != none) && ((Instigator != none) && Instigator.Controller == PC) || VSize(PC.ViewTarget.Location - HitLocation) < float(5000))
		{
			Spawn(ImpactEffect,,, HitLocation + (HitNormal * float(0)), Rotator(HitNormal) + rot(-16384, 0, 0));
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	ImpactEffect=Class'BWBP_VPC_Pro.BulletHitEffect'
	mTracerClass=Class'XEffects.NewTracer'
	mTracerInterval=0.0600000
	mTracerPullback=150.0000000
	mTracerSpeed=15000.0000000
	YawBone="BaseBone"
	PitchBone="GunBone"
	PitchUpLimit=12500
	PitchDownLimit=62500
	WeaponFireAttachmentBone="FireBone"
	RotationsPerSecond=0.4000000
	bInstantFire=true
	bDoOffsetTrace=true
	bIsRepeatingFF=true
	Spread=0.0100000
	RedSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTurretRed'
	BlueSkin=Texture'BWBP_Vehicles_Tex.Leopard.LeopardTurretBlue'
	FireInterval=0.1000000
	EffectEmitterClass=Class'BWBP_VPC_Pro.LeopardMGMuzzleFlash'
	FireSoundClass=Sound'BWBP_Vehicles_Sound.Leopard.Leo-MGFire'
	FireSoundVolume=255.0000000
	FireSoundRadius=150.0000000
	AmbientSoundScaling=2.3000000
	FireForce="minifireb"
	DamageType=Class'BWBP_VPC_Pro.LeopardDamType50Calibre'
	DamageMin=25
	DamageMax=25
	TraceRange=15000.0000000
	AIInfo=(bTossed=false,bTrySplash=false,bLeadTarget=false,bInstantHit=true,bFireOnRelease=false,aimerror=750.0000000,WarnTargetPct=0.0000000,RefireRate=0.9000000)
	CullDistance=5000.0000000
	Mesh=SkeletalMesh'BWBP_Vehicles_Anim.LeopardMG'
	ScaleGlow=0.7500000
}
