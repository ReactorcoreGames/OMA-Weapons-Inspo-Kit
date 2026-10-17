class LinkAltFire extends ProjectileFire;

var Sound LinkedFireSound;
var string LinkedFireForce;

function DrawMuzzleFlash(Canvas Canvas)
{
	// End:0x30
	if(FlashEmitter != none)
	{
		FlashEmitter.SetRotation(Weapon.Rotation);
		super(WeaponFire).DrawMuzzleFlash(Canvas);
	}
	//return;	
}

simulated function bool AllowFire()
{
	return Weapon.AmmoAmount(ThisModeNum) >= 1;
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local LinkProjectile proj;

	Start += ((Vector(Dir) * 10.0000000) * float(LinkGun(Weapon).Links));
	proj = Weapon.Spawn(Class'XWeapons.LinkProjectile',,, Start, Dir);
	// End:0x8B
	if(proj != none)
	{
		proj.Links = LinkGun(Weapon).Links;
		proj.LinkAdjust();
	}
	return proj;
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x53
	if(FlashEmitter != none)
	{
		// End:0x3D
		if(LinkGun(Weapon).Links > 0)
		{
			FlashEmitter.Skins[0] = FinalBlend'XEffectMat.Link.LinkMuzProjYellowFB';			
		}
		else
		{
			FlashEmitter.Skins[0] = FinalBlend'XEffectMat.Link.LinkMuzProjGreenFB';
		}
	}
	super(WeaponFire).FlashMuzzleFlash();
	//return;	
}

function ServerPlayFiring()
{
	// End:0x27
	if(LinkGun(Weapon).Links > 0)
	{
		FireSound = LinkedFireSound;		
	}
	else
	{
		FireSound = default.FireSound;
	}
	super(WeaponFire).ServerPlayFiring();
	//return;	
}

function PlayFiring()
{
	// End:0x27
	if(LinkGun(Weapon).Links > 0)
	{
		FireSound = LinkedFireSound;		
	}
	else
	{
		FireSound = default.FireSound;
	}
	super(WeaponFire).PlayFiring();
	//return;	
}

defaultproperties
{
	LinkedFireSound=Sound'WeaponSounds.LinkGun.BLinkedFire'
	LinkedFireForce="BLinkedFire"
	ProjSpawnOffset=(X=25.0000000,Y=8.0000000,Z=-3.0000000)
	FireLoopAnim="None"
	FireEndAnim="None"
	FireAnimRate=0.7500000
	FireSound=SoundGroup'WeaponSounds.PulseRifle.PulseRifleFire'
	FireForce="TranslocatorFire"
	FireRate=0.2000000
	AmmoClass=Class'XWeapons.LinkAmmo'
	AmmoPerFire=2
	ShakeRotMag=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=2000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=0.0000000,Y=1.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=0.0000000,Y=-2000.0000000,Z=0.0000000)
	ShakeOffsetTime=4.0000000
	ProjectileClass=Class'XWeapons.LinkProjectile'
	BotRefireRate=0.9900000
	WarnTargetPct=0.1000000
	FlashEmitterClass=Class'XEffects.LinkMuzFlashProj1st'
}
