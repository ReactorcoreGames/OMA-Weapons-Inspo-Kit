class ONSAVRiLAltFire extends WeaponFire;

var ONSAVRiL Gun;
var float ZoomLevel;
var bool bWaitingForRelease;
var bool bLosingLock;
var float LostLockTime;

function PostBeginPlay()
{
	super.PostBeginPlay();
	Gun = ONSAVRiL(Weapon);
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x54
	if(((bWaitingForRelease || Gun == none) || !Gun.bLockedOn) || PlayerController(Instigator.Controller) == none)
	{
		bWaitingForRelease = true;
		return false;		
	}
	else
	{
		return true;
	}
	//return;	
}

function StopFiring()
{
	// End:0x65
	if(PlayerController(Instigator.Controller) != none)
	{
		ZoomLevel = 0.0000000;
		PlayerController(Instigator.Controller).DesiredFOV = PlayerController(Instigator.Controller).DefaultFOV;
		bLosingLock = false;
	}
	//return;	
}

function PlayFiring()
{
	//return;	
}

function ModeTick(float DeltaTime)
{
	local Vector LockTrace;
	local Actor AlternateTarget;

	// End:0x37
	if(bWaitingForRelease && int(PlayerController(Instigator.Controller).bAltFire) == 0)
	{
		bWaitingForRelease = false;
	}
	// End:0x44
	if(!bIsFiring)
	{
		return;
	}
	// End:0xEF
	if(!Gun.bLockedOn || Gun.HomingTarget == none)
	{
		// End:0xBB
		if(!bLosingLock)
		{
			bLosingLock = true;
			LostLockTime = Level.TimeSeconds;
			// End:0xB8
			if(Instigator.IsLocallyControlled())
			{
				Instigator.PlaySound(Sound'WeaponSounds.BaseGunTech.BSeekLost1');
			}			
		}
		else
		{
			// End:0xEC
			if(Level.TimeSeconds > (LostLockTime + 1.5000000))
			{
				Gun.StopFire(1);
				return;
			}
		}		
	}
	else
	{
		// End:0x100
		if(bLosingLock)
		{
			bLosingLock = false;
		}
	}
	ZoomLevel += DeltaTime;
	// End:0x126
	if(ZoomLevel > 0.6000000)
	{
		ZoomLevel = 0.6000000;
	}
	PlayerController(Instigator.Controller).DesiredFOV = FClamp(90.0000000 - (ZoomLevel * 88.0000000), 1.0000000, 170.0000000);
	// End:0x29D
	if(!bLosingLock && Instigator.IsLocallyControlled())
	{
		AlternateTarget = Gun.HomingTarget.AlternateTarget();
		// End:0x25F
		if(AlternateTarget != none)
		{
			LockTrace = AlternateTarget.Location - (Instigator.Location + Instigator.EyePosition());
			// End:0x25F
			if(((Normal(LockTrace) Dot Vector(Instigator.GetViewRotation())) > Gun.LockAim) && VSize(LockTrace) < Gun.MaxLockRange)
			{
				Instigator.Controller.SetRotation(Rotator(AlternateTarget.Location - Instigator.Location));
				return;
			}
		}
		Instigator.Controller.SetRotation(Rotator(Gun.HomingTarget.Location - Instigator.Location));
	}
	//return;	
}

defaultproperties
{
	bModeExclusive=false
	FireRate=0.1000000
}
