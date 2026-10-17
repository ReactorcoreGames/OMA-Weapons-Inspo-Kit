class MinigunAttachment extends xWeaponAttachment;

var Class<Emitter> mMuzFlashClass;
var Emitter mMuzFlash3rd;
var Class<Emitter> mTracerClass;
var() editinline Emitter mTracer;
var float mTracerInterval;
var() float mTracerIntervalPrimary;
var() float mTracerIntervalSecondary;
var() float mTracerPullback;
var() float mTracerMinDistance;
var() float mTracerSpeed;
var float mLastTracerTime;
var byte OldSpawnHitCount;
var float mCurrentRoll;
var float mRollInc;
var float mRollUpdateTime;
var Class<xEmitter> mShellCaseEmitterClass;
var xEmitter mShellCaseEmitter;
var() Vector mShellEmitterOffset;
var Vector mOldHitLocation;

function Destroyed()
{
	// End:0x17
	if(mTracer != none)
	{
		mTracer.Destroy();
	}
	// End:0x2E
	if(mMuzFlash3rd != none)
	{
		mMuzFlash3rd.Destroy();
	}
	// End:0x45
	if(mShellCaseEmitter != none)
	{
		mShellCaseEmitter.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function UpdateRoll(float dt)
{
	local Rotator R;

	UpdateRollTime(false);
	// End:0x18
	if(mRollInc <= 0.0000000)
	{
		return;
	}
	mCurrentRoll += (dt * mRollInc);
	mCurrentRoll = mCurrentRoll % 65536.0000000;
	R.Roll = int(mCurrentRoll);
	SetBoneRotation('Bone Barrels', R, 0, 1.0000000);
	//return;	
}

simulated function UpdateRollTime(bool bUpdate)
{
	local float diff;

	diff = Level.TimeSeconds - mRollUpdateTime;
	// End:0x38
	if(bUpdate)
	{
		mRollUpdateTime = Level.TimeSeconds;
	}
	// End:0x52
	if(diff > 0.2000000)
	{
		mRollInc = 0.0000000;
	}
	//return;	
}

simulated function Vector GetTracerStart()
{
	local Pawn P;

	P = Pawn(Owner);
	// End:0x5E
	if(((P != none) && P.IsFirstPerson()) && P.Weapon != none)
	{
		return P.Weapon.GetEffectStart();
	}
	// End:0x7B
	if(mMuzFlash3rd != none)
	{
		return mMuzFlash3rd.Location;		
	}
	else
	{
		return Location;
	}
	//return;	
}

simulated function UpdateTracer()
{
	local Vector SpawnLoc, SpawnDir, spawnVel;
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
	// End:0x29D
	if((mTracer != none) && Level.TimeSeconds > (mLastTracerTime + mTracerInterval))
	{
		SpawnLoc = GetTracerStart();
		mTracer.SetLocation(SpawnLoc);
		hitDist = VSize(mHitLocation - SpawnLoc) - mTracerPullback;
		// End:0xC1
		if(mHitLocation == mOldHitLocation)
		{
			SpawnDir = Vector(Instigator.GetViewRotation());			
		}
		else
		{
			SpawnDir = Normal(mHitLocation - SpawnLoc);
		}
		// End:0x282
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
		GotoState('TickTracer');
	}
	mOldHitLocation = mHitLocation;
	//return;	
}

function UpdateHit(Actor HitActor, Vector HitLocation, Vector HitNormal)
{
	NetUpdateTime = Level.TimeSeconds - float(1);
	SpawnHitCount++;
	mHitLocation = HitLocation;
	mHitActor = HitActor;
	mHitNormal = HitNormal;
	//return;	
}

simulated event ThirdPersonEffects()
{
	local PlayerController PC;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || Instigator == none)
	{
		return;
	}
	// End:0x2CB
	if(int(FlashCount) > 0)
	{
		PC = Level.GetLocalPlayerController();
		// End:0x13A
		if(int(OldSpawnHitCount) != int(SpawnHitCount))
		{
			OldSpawnHitCount = SpawnHitCount;
			GetHitInfo();
			PC = Level.GetLocalPlayerController();
			// End:0x13A
			if((Instigator.Controller == PC) || (PC.ViewTarget != none) && VSize(PC.ViewTarget.Location - mHitLocation) < float(2000))
			{
				// End:0x11E
				if(int(FiringMode) == 0)
				{
					Spawn(Class'XWeapons.HitEffect'.static.GetHitEffect(mHitActor, mHitLocation, mHitNormal),,, mHitLocation, Rotator(mHitNormal));					
				}
				else
				{
					Spawn(Class'XEffects.ExploWallHit',,, mHitLocation, Rotator(mHitNormal));
				}
				CheckForSplash();
			}
		}
		// End:0x175
		if(((Level.TimeSeconds - LastRenderTime) > 0.2000000) && Instigator.Controller != PC)
		{
			return;
		}
		WeaponLight();
		// End:0x1A8
		if(int(FiringMode) == 0)
		{
			mTracerInterval = mTracerIntervalPrimary;
			mRollInc = 65536.0000000 * 3.0000000;			
		}
		else
		{
			mTracerInterval = mTracerIntervalSecondary;
			mRollInc = 65536.0000000;
		}
		// End:0x1F7
		if(Level.bDropDetail || int(Level.DetailMode) == int(0))
		{
			mTracerInterval *= 2.0000000;
		}
		UpdateRollTime(true);
		UpdateTracer();
		// End:0x22D
		if(mMuzFlash3rd == none)
		{
			mMuzFlash3rd = Spawn(mMuzFlashClass);
			AttachToBone(mMuzFlash3rd, 'tip');
		}
		// End:0x248
		if(mMuzFlash3rd != none)
		{
			mMuzFlash3rd.SpawnParticle(1);
		}
		// End:0x2AD
		if(((mShellCaseEmitter == none) && int(Level.DetailMode) != int(0)) && !Level.bDropDetail)
		{
			mShellCaseEmitter = Spawn(mShellCaseEmitterClass);
			// End:0x2AD
			if(mShellCaseEmitter != none)
			{
				AttachToBone(mShellCaseEmitter, 'shell');
			}
		}
		// End:0x2C8
		if(mShellCaseEmitter != none)
		{
			mShellCaseEmitter.mStartParticles++;
		}		
	}
	else
	{
		GotoState('None');
	}
	super.ThirdPersonEffects();
	//return;	
}

state TickTracer
{
	simulated function Tick(float DeltaTime)
	{
		UpdateRoll(DeltaTime);
		//return;		
	}
	stop;	
}

defaultproperties
{
	mMuzFlashClass=Class'XEffects.NewMinigunMFlash'
	mTracerClass=Class'XEffects.NewTracer'
	mTracerIntervalPrimary=0.1200000
	mTracerIntervalSecondary=0.1800000
	mTracerPullback=50.0000000
	mTracerSpeed=10000.0000000
	mShellCaseEmitterClass=Class'XEffects.ShellSpewer'
	bHeavy=true
	bRapidFire=true
	bAltRapidFire=true
	SplashEffect=Class'XGame.BulletSplash'
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	CullDistance=5000.0000000
	Mesh=SkeletalMesh'Weapons.Minigun_3rd'
}
