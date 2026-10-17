class BX5PrimaryFire extends BallisticProjectileFire;

var Actor LastTrace;
var Vector LastHitLoc;
var Vector LastHitNorm;

function float MaxRange()
{
	return 5000.0000000;
	//return;	
}

simulated event ModeDoFire()
{
	local Vector Start, End;

	// End:0x129
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		// End:0x26
		if(!AllowFire())
		{
			return;
		}
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0x81
		if(AIController(Instigator.Controller) != none)
		{
			End = Start + vect(0.0000000, 0.0000000, -128.0000000);			
		}
		else
		{
			End = Start + (Vector(Instigator.GetViewRotation()) * float(90));
		}
		LastTrace = Trace(LastHitLoc, LastHitNorm, End, Start, false);
		// End:0xFB
		if((LastTrace == none) || !LastTrace.bWorldGeometry && Mover(LastTrace) == none)
		{
			return;
		}
		// End:0x123
		if(!Instigator.IsLocallyControlled())
		{
			BX5Mine(Weapon).ClientPlayMineDeploy();
		}
		super(BallisticFire).ModeDoFire();
	}
	//return;	
}

simulated event ClientPlayMineDeploy()
{
	ModeDoFire();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local Rotator R;

	// End:0x0D
	if(LastTrace == none)
	{
		return;
	}
	R = Rotator(LastHitNorm);
	R.Roll = Rand(65536);
	// End:0x63
	if(BX5Mine(Weapon).bSpringMode)
	{
		proj = Spawn(Class'BallisticProV55.BX5SpringMine',,, LastHitLoc, R);		
	}
	else
	{
		proj = Spawn(Class'BallisticProV55.BX5VehicleMine',,, LastHitLoc + (LastHitNorm * float(2)), R);
	}
	// End:0xCE
	if(proj != none)
	{
		proj.bHardAttach = true;
		proj.SetBase(LastTrace);
		proj.Instigator = Instigator;
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	bUseWeaponMag=false
	bAISilent=true
	bSplashDamage=true
	bRecommendSplashDamage=true
	FireAnim="Deploy"
	TweenTime=0.2000000
	FireForce="AssaultRifleAltFire"
	FireRate=1.0000000
	AmmoClass=Class'BallisticProV55.Ammo_BX5Mines'
	ProjectileClass=Class'BallisticProV55.BX5VehicleMine'
	BotRefireRate=0.3000000
}
