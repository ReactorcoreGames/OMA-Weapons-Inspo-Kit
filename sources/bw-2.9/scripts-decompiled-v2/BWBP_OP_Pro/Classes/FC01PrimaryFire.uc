class FC01PrimaryFire extends BallisticProInstantFire;

var() Vector SpawnOffset;
var Projectile proj;
var() Actor SMuzzleFlash;
var() Actor PhotonMuzzleFlash;
var() Class<Actor> SMuzzleFlashClass;
var() Class<Actor> PhotonMuzzleFlashClass;
var() name SFlashBone;
var() float SFlashScaleFactor;
var() name PhotonFlashBone;
var() float PhotonFlashScaleFactor;
var int PhotonCharge;
var Class<Ammunition> AltAmmoClass;

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xB3
	if(!FC01SmartGun(Weapon).bSilenced && MuzzleFlash != none)
	{
		MuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0xF0
	if(FC01SmartGun(Weapon).bSilenced && SMuzzleFlash != none)
	{
		SMuzzleFlash.Trigger(Weapon, Instigator);
	}
	// End:0x101
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

function SetSilenced(bool bSilenced)
{
	bAISilent = bSilenced;
	// End:0x49
	if(bSilenced)
	{
		FireRecoil *= 0.8000000;
		RangeAtten *= 1.2000000;
		XInaccuracy *= 0.7500000;
		YInaccuracy *= 0.7500000;		
	}
	else
	{
		XInaccuracy = default.XInaccuracy;
		YInaccuracy = default.YInaccuracy;
		FireRecoil = default.FireRecoil;
		RangeAtten = default.RangeAtten;
	}
	//return;	
}

function InitEffects()
{
	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x7F
	if((MuzzleFlashClass != none) && (MuzzleFlash == none) || MuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBone);
	}
	// End:0xE3
	if((SMuzzleFlashClass != none) && (SMuzzleFlash == none) || SMuzzleFlash.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(SMuzzleFlash, SMuzzleFlashClass, Weapon.DrawScale * SFlashScaleFactor, Weapon, SFlashBone);
	}
	//return;	
}

simulated function DestroyEffects()
{
	super(BallisticFire).DestroyEffects();
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlash);
	Class'BCoreProV55.BUtil'.static.KillEmitterEffect(SMuzzleFlash);
	//return;	
}

function ServerPlayFiring()
{
	// End:0x95
	if(((FC01SmartGun(Weapon) != none) && FC01SmartGun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume, SilencedFireSound.bNoOverride, SilencedFireSound.Radius, SilencedFireSound.Pitch, SilencedFireSound.bAtten);		
	}
	else
	{
		// End:0xFC
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	PlayFireAnimations();
	CheckClipFinished();
	//return;	
}

function PlayFiring()
{
	// End:0x42
	if(FC01SmartGun(Weapon).bSilenced)
	{
		Weapon.SetBoneScale(0, 1.0000000, FC01SmartGun(Weapon).SilencerBone);		
	}
	else
	{
		Weapon.SetBoneScale(0, 0.0000000, FC01SmartGun(Weapon).SilencerBone);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xFA
	if(((FC01SmartGun(Weapon) != none) && FC01SmartGun(Weapon).bSilenced) && SilencedFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(SilencedFireSound.Sound, SilencedFireSound.Slot, SilencedFireSound.Volume,, SilencedFireSound.Radius,, true);		
	}
	else
	{
		// End:0x142
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume,, BallisticFireSound.Radius);
		}
	}
	CheckClipFinished();
	//return;	
}

simulated state SeekerFlechette
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
		//return;		
	}

	function float MaxRange()
	{
		// End:0x155
		if(ProjectileClass.default.MaxSpeed > ProjectileClass.default.Speed)
		{
			// End:0xFE
			if((Class<BallisticProjectile>(ProjectileClass) != none) && Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed > float(0))
			{
				// End:0xA7
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * float(2))) * float(2));					
				}
				else
				{
					return FMin(ProjectileClass.default.MaxSpeed, (ProjectileClass.default.Speed + (Class<BallisticProjectile>(ProjectileClass).default.AccelSpeed * ProjectileClass.default.LifeSpan)) * ProjectileClass.default.LifeSpan);
				}				
			}
			else
			{
				// End:0x12C
				if(ProjectileClass.default.LifeSpan <= float(0))
				{
					return ProjectileClass.default.MaxSpeed * float(2);					
				}
				else
				{
					return (ProjectileClass.default.MaxSpeed * ProjectileClass.default.LifeSpan) * 0.7500000;
				}
			}			
		}
		else
		{
			// End:0x183
			if(ProjectileClass.default.LifeSpan <= float(0))
			{
				return ProjectileClass.default.Speed * float(2);				
			}
			else
			{
				return ProjectileClass.default.Speed * ProjectileClass.default.LifeSpan;
			}
		}
		//return;		
	}

	function DoFireEffect()
	{
		local Vector StartTrace, X, Y, Z, Start, End,
			HitLocation, HitNormal;

		local Rotator Aim;
		local Actor Other;

		Weapon.GetViewAxes(X, Y, Z);
		Start = Instigator.Location + Instigator.EyePosition();
		StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
		// End:0xB6
		if(!Weapon.WeaponCentered())
		{
			StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
		}
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x139
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
		super(BallisticFire).DoFireEffect();
		//return;		
	}

	function SpawnProjectile(Vector Start, Rotator Dir)
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		// End:0x2A
		if(proj == none)
		{
			return;
		}
		proj.Instigator = Instigator;
		// End:0xD3
		if(FC01SmartProj(proj) != none)
		{
			// End:0xBE
			if((FC01SmartGun(Weapon).Target != none) && FC01SmartGun(Weapon).targettime >= FC01SmartGun(Weapon).LockOnTime)
			{
				FC01SmartProj(proj).SetSmartProjTarget(FC01SmartGun(Weapon).Target);				
			}
			else
			{
				FC01SmartProj(proj).SetSmartProjTarget(none);
			}
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	SMuzzleFlashClass=Class'BallisticProV55.XK2SilencedFlash'
	PhotonMuzzleFlashClass=Class'BWBP_OP_Pro.FC01PhotonFlashEmitter'
	SFlashBone="tip2"
	SFlashScaleFactor=1.0000000
	PhotonFlashBone="tipalt"
	PhotonFlashScaleFactor=0.4000000
	PhotonCharge=20
	AltAmmoClass=Class'BWBP_OP_Pro.Ammo_FC01Alt'
	TraceRange=(Min=8000.0000000,Max=12000.0000000)
	DecayRange=(Min=1536.0000000,Max=3072.0000000)
	WallPenetrationForce=24.0000000
	Damage=28.0000000
	RangeAtten=0.3500000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_OP_Pro.DT_FC01Body'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FC01Head'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FC01Body'
	PenetrateForce=180
	bPenetrate=true
	RunningSpeedThresh=1000.0000000
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	FlashScaleFactor=0.5000000
	FireRecoil=220.0000000
	FireChaos=0.0320000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	XInaccuracy=96.0000000
	YInaccuracy=96.0000000
	SilencedFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FC01.FC01-FireSupp',Volume=2.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.CYLO.CYLO-Fire',Volume=1.6000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	PreFireAnim="None"
	FireEndAnim="None"
	FireRate=0.1050000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_SmartAmmo'
	ShakeRotMag=(X=24.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=360.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.FC01SmartProj'
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
