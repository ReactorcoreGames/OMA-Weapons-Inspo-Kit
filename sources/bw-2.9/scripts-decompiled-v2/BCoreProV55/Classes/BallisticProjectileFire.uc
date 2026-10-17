class BallisticProjectileFire extends BallisticFire;

struct ProjFireModeInfo
{
	var Class<Projectile> mProjClass;
	var float mFireRate;
	var float mFireChaos;
	var Sound mFireSound;
	var name mFireAnim;
	var bool bLoopedAnim;
	var name mFireEndAnim;
	var float mRecoil;
	var int mAmmoPerFire;
	var name TargetState;
	var bool bModeLead;
	var bool bModeInstantHit;
	var bool bModeSplash;
	var bool bModeRecommendSplash;
	var float mBotRefireRate;
	var float mWarnTargetPct;
};

var() Vector SpawnOffset;
var Projectile proj;
var array<ProjFireModeInfo> FireModes;

simulated function ApplyFireEffectParams(FireEffectParams Params)
{
	local ProjectileEffectParams effect_params;

	super.ApplyFireEffectParams(Params);
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
	local Vector Start, X, Y, Z, End, HitLocation,
		HitNormal, StartTrace;

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
	End = Start + (Vector(Aim) * SpawnOffset.X);
	Other = Weapon.Trace(HitLocation, HitNormal, End, Start, false);
	// End:0x13A
	if(Other != none)
	{
		StartTrace = HitLocation;
	}
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x196
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	SpawnProjectile(StartTrace, Aim);
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	super.DoFireEffect();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x3C
	if(proj != none)
	{
		proj.Instigator = Instigator;
	}
	//return;	
}

function StartBerserk()
{
	// End:0x2D
	if((FireModes.Length == 0) || int(BW.CurrentWeaponMode) == 0)
	{
		super.StartBerserk();		
	}
	else
	{
		FireRate = FireModes[int(BW.CurrentWeaponMode) - 1].mFireRate * 0.7500000;
		FireAnimRate = default.FireAnimRate / 0.7500000;
		FireRecoil = FireModes[int(BW.CurrentWeaponMode) - 1].mRecoil * 0.7500000;
		FireChaos = FireModes[int(BW.CurrentWeaponMode) - 1].mFireChaos * 0.7500000;
	}
	//return;	
}

function StopBerserk()
{
	// End:0x2D
	if((FireModes.Length == 0) || int(BW.CurrentWeaponMode) == 0)
	{
		super.StopBerserk();		
	}
	else
	{
		FireRate = FireModes[int(BW.CurrentWeaponMode) - 1].mFireRate;
		FireAnimRate = default.FireAnimRate;
		FireRecoil = FireModes[int(BW.CurrentWeaponMode) - 1].mRecoil;
		FireChaos = FireModes[int(BW.CurrentWeaponMode) - 1].mFireChaos;
	}
	//return;	
}

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x302
	if(FireModes.Length > 0)
	{
		// End:0xC4
		if(int(newmode) == 0)
		{
			ProjectileClass = default.ProjectileClass;
			FireRate = default.FireRate;
			FireChaos = default.FireChaos;
			BallisticFireSound.Sound = default.BallisticFireSound.Sound;
			FireLoopAnim = default.FireLoopAnim;
			FireAnim = default.FireAnim;
			FireEndAnim = default.FireEndAnim;
			FireRecoil = default.FireRecoil;
			AmmoPerFire = default.AmmoPerFire;
			GotoState('None');
			bLeadTarget = default.bLeadTarget;
			bInstantHit = default.bInstantHit;
			bSplashDamage = default.bSplashDamage;
			bRecommendSplashDamage = default.bRecommendSplashDamage;			
		}
		else
		{
			newmode--;
			ProjectileClass = FireModes[int(newmode)].mProjClass;
			FireRate = FireModes[int(newmode)].mFireRate;
			FireChaos = FireModes[int(newmode)].mFireChaos;
			BallisticFireSound.Sound = FireModes[int(newmode)].mFireSound;
			// End:0x16C
			if(FireModes[int(newmode)].bLoopedAnim)
			{
				FireLoopAnim = FireModes[int(newmode)].mFireAnim;
				FireAnim = 'None';				
			}
			else
			{
				FireLoopAnim = 'None';
				FireAnim = FireModes[int(newmode)].mFireAnim;
			}
			FireEndAnim = FireModes[int(newmode)].mFireEndAnim;
			FireRecoil = FireModes[int(newmode)].mRecoil;
			AmmoPerFire = FireModes[int(newmode)].mAmmoPerFire;
			// End:0x1FD
			if(FireModes[int(newmode)].TargetState == 'None')
			{
				GotoState('None');				
			}
			else
			{
				GotoState(FireModes[int(newmode)].TargetState);
			}
			bLeadTarget = FireModes[int(newmode)].bModeLead;
			bInstantHit = FireModes[int(newmode)].bModeInstantHit;
			bSplashDamage = FireModes[int(newmode)].bModeSplash;
			bRecommendSplashDamage = FireModes[int(newmode)].bModeRecommendSplash;
			newmode++;
		}
		// End:0x2B6
		if(Weapon.bBerserk)
		{
			FireRate *= 0.7500000;
			FireRecoil *= 0.7500000;
			FireChaos *= 0.7500000;
		}
		// End:0x2F5
		if(Level.GRI.WeaponBerserk > 1.0000000)
		{
			FireRate /= Level.GRI.WeaponBerserk;
		}
		load = float(AmmoPerFire);
	}
	//return;	
}

defaultproperties
{
	bLeadTarget=true
	bInstantHit=false
	WarnTargetPct=0.5000000
}
