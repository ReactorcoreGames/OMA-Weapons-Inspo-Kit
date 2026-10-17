class ShockBeamFire extends InstantFire;

var() Class<ShockBeamEffect> BeamEffectClass;

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z;
	local Rotator R, Aim;

	Instigator.MakeNoise(1.0000000);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	// End:0xFB
	if(PlayerController(Instigator.Controller) != none)
	{
		Weapon.GetViewAxes(X, Y, Z);
		StartTrace = StartTrace + (X * Class'XWeapons.ShockProjFire'.default.ProjSpawnOffset.X);
		// End:0xFB
		if(!Weapon.WeaponCentered())
		{
			StartTrace = (StartTrace + ((Weapon.hand * Y) * Class'XWeapons.ShockProjFire'.default.ProjSpawnOffset.Y)) + (Z * Class'XWeapons.ShockProjFire'.default.ProjSpawnOffset.Z);
		}
	}
	Aim = AdjustAim(StartTrace, aimerror);
	R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
	DoTrace(StartTrace, R);
	//return;	
}

function InitEffects()
{
	// End:0x20
	if(int(Level.DetailMode) == int(0))
	{
		FlashEmitterClass = none;
	}
	super(WeaponFire).InitEffects();
	// End:0x4A
	if(FlashEmitter != none)
	{
		Weapon.AttachToBone(FlashEmitter, 'tip');
	}
	//return;	
}

function Rotator AdjustAim(Vector Start, float InAimError)
{
	// End:0x51
	if((ShockRifle(Weapon) != none) && ShockRifle(Weapon).ComboTarget != none)
	{
		return Rotator(ShockRifle(Weapon).ComboTarget.Location - Start);
	}
	return super(WeaponFire).AdjustAim(Start, InAimError);
	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	local ShockBeamEffect Beam;

	// End:0x62
	if(Weapon != none)
	{
		Beam = Weapon.Spawn(BeamEffectClass,,, Start, Dir);
		// End:0x49
		if(ReflectNum != 0)
		{
			Beam.Instigator = none;
		}
		Beam.AimAt(HitLocation, HitNormal);
	}
	//return;	
}

defaultproperties
{
	BeamEffectClass=Class'XWeapons.ShockBeamEffect'
	DamageType=Class'XWeapons.DamTypeShockBeam'
	DamageMin=45
	DamageMax=45
	TraceRange=17000.0000000
	Momentum=60000.0000000
	bReflective=true
	FireSound=SoundGroup'WeaponSounds.ShockRifle.ShockRifleFire'
	FireForce="ShockRifleFire"
	FireRate=0.7000000
	AmmoClass=Class'XWeapons.ShockAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-600.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=3.2000000
	BotRefireRate=0.7000000
	FlashEmitterClass=Class'XEffects.ShockBeamMuzFlash'
	aimerror=700.0000000
}
