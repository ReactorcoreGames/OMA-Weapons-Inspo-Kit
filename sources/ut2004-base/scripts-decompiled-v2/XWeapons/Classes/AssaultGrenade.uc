class AssaultGrenade extends ProjectileFire;

const mNumGrenades = 8;

var float mCurrentRoll;
var float mBlend;
var float mRollInc;
var float mNextRoll;
var float mDrumRotationsPerSec;
var float mRollPerSec;
var AssaultRifle mGun;
var int mCurrentSlot;
var int mNextEmptySlot;
var() float mScale;
var() float mScaleMultiplier;
var() float mSpeedMin;
var() float mSpeedMax;
var() float mHoldSpeedMin;
var() float mHoldSpeedMax;
var() float mHoldSpeedGainPerSec;
var() float mHoldClampMax;
var float ClickTime;
var() float mWaitTime;

function PostBeginPlay()
{
	super(WeaponFire).PostBeginPlay();
	mRollInc = (-1.0000000 * 65536.0000000) / float(8);
	mRollPerSec = 65536.0000000 * mDrumRotationsPerSec;
	mGun = AssaultRifle(Weapon);
	mHoldClampMax = (mHoldSpeedMax - mHoldSpeedMin) / mHoldSpeedGainPerSec;
	FireRate = mWaitTime + (1.0000000 / (mDrumRotationsPerSec * float(8)));
	//return;	
}

function DrawMuzzleFlash(Canvas Canvas)
{
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0E
	if(super(WeaponFire).AllowFire())
	{
		return true;		
	}
	else
	{
		// End:0x6D
		if((PlayerController(Instigator.Controller) != none) && Level.TimeSeconds > ClickTime)
		{
			Instigator.PlaySound(Sound'NewWeaponSounds.Newclickgrenade');
			ClickTime = Level.TimeSeconds + 0.2500000;
		}
		return false;
	}
	//return;	
}

function InitEffects()
{
	super(WeaponFire).InitEffects();
	// End:0x2A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'tip2');
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartProj, StartTrace, X, Y, Z;

	local Rotator Aim;
	local Vector HitLocation, HitNormal;
	local Actor Other;

	Instigator.MakeNoise(1.0000000);
	Weapon.GetViewAxes(X, Y, Z);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	StartProj = StartTrace + (X * ProjSpawnOffset.X);
	// End:0xD9
	if(AssaultRifle(Weapon).bDualMode)
	{
		AssaultRifle(Weapon).bFireLeft = !AssaultRifle(Weapon).bFireLeft;
		// End:0xD9
		if(AssaultRifle(Weapon).bFireLeft)
		{
			Y *= float(-1);
		}
	}
	// End:0x12E
	if(!Weapon.WeaponCentered())
	{
		StartProj = (StartProj + ((Weapon.hand * Y) * ProjSpawnOffset.Y)) + (Z * ProjSpawnOffset.Z);
	}
	Other = Weapon.Trace(HitLocation, HitNormal, StartProj, StartTrace, false);
	// End:0x16B
	if(Other != none)
	{
		StartProj = HitLocation;
	}
	Aim = AdjustAim(StartProj, aimerror);
	SpawnProjectile(StartProj, Aim);
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Grenade G;
	local Vector X, Y, Z;
	local float pawnSpeed;

	G = Weapon.Spawn(Class'XWeapons.Grenade', Instigator,, Start, Dir);
	// End:0x145
	if(G != none)
	{
		Weapon.GetViewAxes(X, Y, Z);
		pawnSpeed = X Dot Instigator.Velocity;
		// End:0x9B
		if(Bot(Instigator.Controller) != none)
		{
			G.Speed = mHoldSpeedMax;			
		}
		else
		{
			G.Speed = mHoldSpeedMin + (HoldTime * mHoldSpeedGainPerSec);
		}
		G.Speed = FClamp(G.Speed, mHoldSpeedMin, mHoldSpeedMax);
		G.Speed = pawnSpeed + G.Speed;
		G.Velocity = G.Speed * Vector(Dir);
		G.Damage *= DamageAtten;
	}
	return G;
	//return;	
}

simulated function ReturnToIdle()
{
	UpdateRoll(FireRate);
	GotoState('Idle');
	//return;	
}

simulated function bool UpdateRoll(float dt)
{
	local Rotator R;
	local bool bDone;
	local float diff, inc;

	diff = mCurrentRoll - mNextRoll;
	inc = dt * mRollPerSec;
	// End:0x46
	if(inc >= diff)
	{
		inc = diff;
		bDone = true;
	}
	mCurrentRoll -= inc;
	mCurrentRoll = mCurrentRoll % 65536.0000000;
	R.Roll = int(mCurrentRoll);
	mGun.SetBoneRotation('Bone_Drum', R, 0, mBlend);
	return bDone;
	//return;	
}

simulated function int WrapPostIncr(out int Count)
{
	local int oldcount;

	oldcount = Count;
	// End:0x20
	if(++Count >= 8)
	{
		Count = 0;
	}
	return oldcount;
	//return;	
}

function PlayPreFire()
{
	//return;	
}

function PlayStartHold()
{
	//return;	
}

function PlayFiring()
{
	//return;	
}

function PlayFireEnd()
{
	//return;	
}

function StartBerserk()
{
	mHoldSpeedGainPerSec = default.mHoldSpeedGainPerSec * 1.5000000;
	mHoldClampMax = (mHoldSpeedMax - mHoldSpeedMin) / mHoldSpeedGainPerSec;
	//return;	
}

function StopBerserk()
{
	mHoldSpeedGainPerSec = default.mHoldSpeedGainPerSec;
	mHoldClampMax = (mHoldSpeedMax - mHoldSpeedMin) / mHoldSpeedGainPerSec;
	//return;	
}

function StartSuperBerserk()
{
	mHoldSpeedGainPerSec = default.mHoldSpeedGainPerSec * Level.GRI.WeaponBerserk;
	mHoldClampMax = (mHoldSpeedMax - mHoldSpeedMin) / mHoldSpeedGainPerSec;
	FireRate = mWaitTime + ((1.0000000 / (mDrumRotationsPerSec * float(8))) / Level.GRI.WeaponBerserk);
	//return;	
}

auto state Idle
{
	function StopFiring()
	{
		local Rotator R;

		// End:0x1A
		if(Instigator.Weapon != Weapon)
		{
			return;
		}
		R.Roll = Rand(65536);
		Weapon.SetBoneRotation('Bone_Flash02', R, 0, 1.0000000);
		mNextRoll = mCurrentRoll + mRollInc;
		mGun.PlayAnim(FireAnim, FireAnimRate, 0.0000000);
		// End:0xC7
		if((int(Level.NetMode) != int(NM_Client)) && Instigator.DrivenVehicle == none)
		{
			Weapon.PlaySound(FireSound, 3, TransientSoundVolume,, 512.0000000,, false);
		}
		ClientPlayForceFeedback(FireForce);
		GotoState('Wait');
		super(WeaponFire).StopFiring();
		//return;		
	}
	stop;	
}

state Wait
{
	function BeginState()
	{
		SetTimer(mWaitTime, false);
		//return;		
	}

	function Timer()
	{
		GotoState('LoadNext');
		//return;		
	}
	stop;	
}

state LoadNext
{
	function BeginState()
	{
		// End:0x35
		if(int(Level.NetMode) != int(NM_Client))
		{
			Weapon.PlaySound(ReloadSound, 0,,, 512.0000000,, false);
		}
		ClientPlayForceFeedback(ReloadForce);
		//return;		
	}

	function ModeTick(float dt)
	{
		// End:0x2B
		if(Weapon.Mesh != Weapon.OldMesh)
		{
			GotoState('Idle');			
		}
		else
		{
			// End:0x40
			if(UpdateRoll(dt))
			{
				GotoState('Idle');
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	mBlend=1.0000000
	mDrumRotationsPerSec=0.4000000
	mScale=1.0000000
	mScaleMultiplier=0.9000000
	mSpeedMin=250.0000000
	mSpeedMax=3000.0000000
	mHoldSpeedMin=850.0000000
	mHoldSpeedMax=1600.0000000
	mHoldSpeedGainPerSec=750.0000000
	mWaitTime=0.5000000
	ProjSpawnOffset=(X=25.0000000,Y=10.0000000,Z=-7.0000000)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	FireLoopAnim="None"
	FireEndAnim="None"
	FireAnimRate=0.5000000
	FireSound=Sound'NewWeaponSounds.NewGrenadeShoot'
	ReloadSound=Sound'WeaponSounds.BaseGunTech.BReload9'
	FireForce="AssaultRifleAltFire"
	ReloadForce="BReload9"
	FireRate=1.0000000
	AmmoClass=Class'XWeapons.GrenadeAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'XWeapons.Grenade'
	BotRefireRate=0.2500000
	FlashEmitterClass=Class'XEffects.AssaultMuzFlash1st'
}
