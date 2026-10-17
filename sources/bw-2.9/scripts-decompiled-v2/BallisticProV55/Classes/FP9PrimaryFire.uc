class FP9PrimaryFire extends BallisticProjectileFire;

event ModeDoFire()
{
	local Vector Start, HitLoc, HitNorm;

	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	Start = Instigator.Location + Instigator.EyePosition();
	// End:0x8A
	if((Trace(HitLoc, HitNorm, Start + (Vector(Instigator.GetViewRotation()) * float(120)), Start, true)) == none)
	{
		BallisticFireSound.Sound = Sound'BW_Core_WeaponSound.FP9A5.FP9-Throw';
		FireAnim = 'Throw';		
	}
	else
	{
		BallisticFireSound.Sound = none;
		FireAnim = 'Place';
	}
	// End:0xDF
	if(Weapon.AmmoAmount(0) > 0)
	{
		Weapon.SetBoneScale(0, 1.0000000, FP9Explosive(Weapon).BombBone);
	}
	// End:0x13B
	if(!FP9Explosive(Weapon).bHasDetonator)
	{
		Weapon.SetBoneScale(1, 0.0000000, FP9Explosive(Weapon).DetHandBone);
		Weapon.SetBoneScale(2, 0.0000000, 'FP9Detonator');
	}
	super(BallisticFire).ModeDoFire();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local Actor t;
	local Vector TraceStart, End, HitLoc, HitNorm;

	TraceStart = Instigator.Location + Instigator.EyePosition();
	End = TraceStart + (Vector(Instigator.GetViewRotation()) * float(120));
	t = Trace(HitLoc, HitNorm, End, TraceStart, true);
	// End:0x157
	if((t != none) && (t.bWorldGeometry || Mover(t) != none) || Vehicle(t) != none)
	{
		// End:0xD8
		if(int(t.DrawType) == int(8))
		{
			HitLoc -= (HitNorm * float(3));
		}
		proj = Spawn(ProjectileClass,,, HitLoc + (HitNorm * float(2)), Rotator(HitNorm));
		FP9Bomb(proj).InitBomb(false, FP9Explosive(Weapon).bLaserMode, HoldTime);
		proj.bHardAttach = true;
		proj.SetBase(t);		
	}
	else
	{
		proj = Spawn(ProjectileClass,,, Start, Dir);
		// End:0x1BE
		if(AIController(Instigator.Controller) != none)
		{
			FP9Bomb(proj).InitBomb(true, FP9Explosive(Weapon).bLaserMode, 1.0000000);			
		}
		else
		{
			FP9Bomb(proj).InitBomb(true, FP9Explosive(Weapon).bLaserMode, HoldTime);
		}
	}
	// End:0x231
	if(proj != none)
	{
		proj.Instigator = Instigator;
		FP9Explosive(Weapon).AddBomb(FP9Bomb(proj));
		bIsFiring = false;
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=-10.0000000,Z=-5.0000000)
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.FP9A5.FP9-Throw',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bAISilent=true
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	bFireOnRelease=true
	bModeExclusive=false
	PreFireAnim="PrepThrow"
	FireAnim="Throw"
	TweenTime=0.2000000
	FireForce="AssaultRifleAltFire"
	FireRate=1.5000000
	AmmoClass=Class'BallisticProV55.Ammo_FP9Ammo'
	ProjectileClass=Class'BallisticProV55.FP9Bomb'
	BotRefireRate=0.3000000
	WarnTargetPct=0.9000000
}
