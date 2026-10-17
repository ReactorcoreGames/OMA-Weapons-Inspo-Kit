class PD97SecondaryFire extends BallisticProjectileFire;

var PD97TazerProj ActiveProj;
var PD97TrackerProj ActiveTracker;
var bool bLoaded;

simulated function bool CheckTazer()
{
	local int Channel;
	local name seq;
	local float frame, Rate;

	// End:0x6B
	if(!bLoaded)
	{
		Weapon.GetAnimParams(Channel, seq, frame, Rate);
		// End:0x4D
		if(seq == PD97Bloodhound(Weapon).TazerLoadAnim)
		{
			return false;
		}
		PD97Bloodhound(Weapon).LoadTazer();
		bIsFiring = false;
		return false;
	}
	return true;
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0xAC
	if(!super(BallisticFire).AllowFire() || !bLoaded)
	{
		// End:0x99
		if(DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
		}
		BW.EmptyFire(1);
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	// End:0x3D
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		FireAnim = 'OpenTazerFire';
		BW.IdleAnim = 'OpenTazerIdle';		
	}
	else
	{
		FireAnim = 'TazerFire';
		BW.IdleAnim = 'TazerIdle';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x73
	if(proj != none)
	{
		proj.Instigator = Instigator;
		PD97TazerProj(proj).Master = PD97Attachment(BW.ThirdPersonActor);
		ActiveProj = PD97TazerProj(proj);
	}
	//return;	
}

simulated event ModeHoldFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x8D
	if(BW != none)
	{
		BW.bPreventReload = true;
		BW.FireCount++;
		// End:0x8D
		if(int(BW.ReloadState) != int(0))
		{
			// End:0x7C
			if(int(Weapon.Role) == int(ROLE_Authority))
			{
				BW.bServerReloading = false;
			}
			BW.ReloadState = 0;
		}
	}
	ConsumedLoad += int(load);
	SetTimer(FMin(0.1000000, FireRate / float(2)), false);
	// End:0x141
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xF6
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x132
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();
	}
	BW.LastFireTime = Level.TimeSeconds;
	// End:0x18B
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		PlayFiring();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	else
	{
		ServerPlayFiring();
	}
	load = float(AmmoPerFire);
	// End:0x1E3
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	// End:0x21B
	if(BW != none)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), float(ConsumedLoad));
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x1A
	if(!CheckTazer())
	{
		return;
	}
	// End:0x83
	if(int(BW.Role) == int(ROLE_Authority))
	{
		// End:0x4D
		if(ActiveProj != none)
		{
			ActiveProj.Destroy();			
		}
		else
		{
			// End:0x83
			if(PD97Attachment(BW.ThirdPersonActor) != none)
			{
				PD97Attachment(BW.ThirdPersonActor).TazeEnd();
			}
		}
	}
	// End:0x103
	if(PD97Bloodhound(BW) != none)
	{
		// End:0xD4
		if(FireAnim == 'OpenTazerFire')
		{
			PD97Bloodhound(BW).IdleAnim = 'OpenIdle';
			PD97Bloodhound(BW).PlayAnim('OpenTazerEnd');			
		}
		else
		{
			PD97Bloodhound(BW).IdleAnim = 'Idle';
			PD97Bloodhound(BW).PlayAnim('TazerEnd');
		}
	}
	// End:0x149
	if(bFireOnRelease)
	{
		// End:0x12B
		if(bIsFiring)
		{
			NextFireTime += (MaxHoldTime + FireRate);			
		}
		else
		{
			NextFireTime = Level.TimeSeconds + FireRate;
		}		
	}
	else
	{
		NextFireTime += FireRate;
		NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
	}
	bLoaded = false;
	HoldTime = 0.0000000;
	//return;	
}

state Tracker
{
	simulated function ApplyFireEffectParams(FireEffectParams Params)
	{
		local ProjectileEffectParams effect_params;

		super(BallisticFire).ApplyFireEffectParams(Params);
		effect_params = ProjectileEffectParams(Params);
		ProjectileClass = effect_params.ProjectileClass;
		SpawnOffset = effect_params.SpawnOffset;
		default.ProjectileClass = effect_params.ProjectileClass;
		default.SpawnOffset = effect_params.SpawnOffset;
		bFireOnRelease = false;
		bWaitForRelease = false;
		bNowWaiting = false;
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		// End:0x6A
		if(proj != none)
		{
			proj.Instigator = Instigator;
			PD97TrackerProj(proj).Master = PD97Bloodhound(BW);
			ActiveTracker = PD97TrackerProj(proj);
		}
		//return;		
	}

	simulated event ModeDoFire()
	{
		// End:0x0D
		if(!AllowFire())
		{
			return;
		}
		// End:0x1A
		if(!CheckTazer())
		{
			return;
		}
		// End:0x8F
		if(int(BW.Role) == int(ROLE_Authority))
		{
			// End:0x4A
			if(ActiveTracker != none)
			{
				ActiveTracker.Destroy();
			}
			// End:0x8F
			if((PD97Bloodhound(BW) != none) && PD97Bloodhound(BW).ActiveBeacon != none)
			{
				PD97Bloodhound(BW).ActiveBeacon.Destroy();
			}
		}
		// End:0x10F
		if(PD97Bloodhound(BW) != none)
		{
			// End:0xE0
			if(FireAnim == 'OpenTazerFire')
			{
				PD97Bloodhound(BW).IdleAnim = 'OpenIdle';
				PD97Bloodhound(BW).PlayAnim('OpenTazerEnd');				
			}
			else
			{
				PD97Bloodhound(BW).IdleAnim = 'Idle';
				PD97Bloodhound(BW).PlayAnim('TazerEnd');
			}
		}
		super(BallisticFire).ModeDoFire();
		bLoaded = false;
		//return;		
	}
	stop;	
}

defaultproperties
{
	bLoaded=true
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="Tazer"
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.9000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_BloodhoundTazer'
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.PD97TazerProj'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
