class E5PrimaryFire extends BallisticProProjectileFire;

var() Sound PulseFireSound;
var() Sound MultiFireSound;
var Vector ZForce;
var float PushStopFactor;
var float PushForce;
var Actor MuzzleFlashPulse;
var Actor MuzzleFlashMulti;
var() int SGFireCount;
var float NextSGFireTime;

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x72
	if((MuzzleFlashPulse == none) || MuzzleFlashPulse.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashPulse, Class'BWBP_APC_Pro.E5FlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xC9
	if((MuzzleFlashMulti == none) || MuzzleFlashMulti.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashMulti, Class'BWBP_APC_Pro.E5SGFlashEmitter', Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	MuzzleFlash = MuzzleFlashPulse;
	//return;	
}

simulated function DestroyEffects()
{
	super(WeaponFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashPulse);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashMulti);
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	super(BallisticProjectileFire).SwitchWeaponMode(newmode);
	// End:0x3C
	if(int(newmode) == 1)
	{
		MuzzleFlash = MuzzleFlashMulti;
		BotRefireRate = 0.8000000;
		NextFireTime = NextSGFireTime;		
	}
	else
	{
		MuzzleFlash = MuzzleFlashPulse;
		BotRefireRate = 0.9000000;
	}
	//return;	
}

simulated event Timer()
{
	super(BallisticFire).Timer();
	// End:0x70
	if((int(Weapon.Role) == int(ROLE_Authority)) && ConsumedLoad > 0)
	{
		// End:0x55
		if(BW != none)
		{
			BW.ConsumeMagAmmo(ThisModeNum, float(ConsumedLoad));			
		}
		else
		{
			Weapon.ConsumeAmmo(ThisModeNum, float(ConsumedLoad));
		}
	}
	ConsumedLoad = 0;
	//return;	
}

simulated state Shotgun
{
	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		local int i, j;
		local Rotator R;

		j = Min(SGFireCount, BW.MagAmmo);
		ConsumedLoad = AmmoPerFire * j;
		i = 0;
		J0x34:

		// End:0x126 [Loop If]
		if(i < j)
		{
			R.Roll = ((65536 / j) * i) - 16384;
			// End:0xCA
			if(BW.bScopeView || BW.bAimDisabled)
			{
				proj = Spawn(ProjectileClass,,, Start, Rotator((Vector(rot(0, 96, 0)) >> R) >> Dir));				
			}
			else
			{
				Spawn(ProjectileClass,,, Start, Rotator((Vector(rot(0, 256, 0)) >> R) >> Dir));
			}
			// End:0x11C
			if(proj != none)
			{
				proj.Instigator = Instigator;
			}
			i++;
			// [Loop Continue]
			goto J0x34;
		}
		//return;		
	}

	function PlayFiring()
	{
		// End:0x29
		if(int(ScopeDownOn) == int(1))
		{
			BW.TemporaryScopeDown(0.5000000, 0.9000000);
		}
		// End:0xD1
		if(!BW.bScopeView)
		{
			// End:0xAC
			if(FireCount > 0)
			{
				// End:0x84
				if(Weapon.HasAnim(FireLoopAnim))
				{
					BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");					
				}
				else
				{
					BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
				}				
			}
			else
			{
				BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
			}
		}
		ClientPlayForceFeedback(FireForce);
		FireCount++;
		// End:0x14A
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
		CheckClipFinished();
		NextSGFireTime = NextFireTime + FireRate;
		NextSGFireTime = FMax(NextSGFireTime, Level.TimeSeconds);
		//return;		
	}

	simulated function EndState()
	{
		NextSGFireTime = NextFireTime;
		NextFireTime -= 1.3000000;
		//return;		
	}
	stop;	
}

defaultproperties
{
	ZForce=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	PushStopFactor=0.1000000
	PushForce=800.0000000
	SGFireCount=3
	bPawnRapidFireAnim=true
	AmmoClass=Class'BallisticProV55.Ammo_E23Cells'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	BotRefireRate=0.9900000
	aimerror=400.0000000
}
