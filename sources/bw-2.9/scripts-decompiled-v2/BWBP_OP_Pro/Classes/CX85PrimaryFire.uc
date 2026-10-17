class CX85PrimaryFire extends BallisticProInstantFire;

var() Vector SpawnOffset;
var Projectile proj;

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
		proj.Instigator = Instigator;
		CX85Flechette(proj).Master = CX85AssaultWeapon(BW);
		//return;		
	}
	stop;	
}

defaultproperties
{
	SpawnOffset=(X=20.0000000,Y=9.0000000,Z=-9.0000000)
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_OP_Pro.DTCX85Bullet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85BulletHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Bullet'
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassBone="tip"
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	FlashScaleFactor=0.8000000
	FireRecoil=120.0000000
	FireChaos=0.0800000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.SAR.SAR-Fire',Volume=0.9000000,Radius=512.0000000,Slot=3,Pitch=1.5000000,bAtten=false,bNoOverride=false)
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.0900000
	AmmoClass=Class'BallisticProV55.Ammo_556mm'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.CX85Flechette'
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
