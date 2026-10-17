class SuperShockBeamFire extends ShockBeamFire;

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator R, Aim;

	Instigator.MakeNoise(1.0000000);
	StartTrace = Instigator.Location + Instigator.EyePosition();
	Aim = AdjustAim(StartTrace, aimerror);
	R = Rotator(Vector(Aim) + ((VRand() * FRand()) * Spread));
	DoTrace(StartTrace, R);
	//return;	
}

function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X;

	X = Vector(Dir);
	TracePart(Start, Start + (X * TraceRange), X, Dir, Instigator);
	//return;	
}

function bool AllowMultiHit()
{
	return false;
	//return;	
}

function TracePart(Vector Start, Vector End, Vector X, Rotator Dir, Pawn Ignored)
{
	local Vector HitLocation, HitNormal;
	local Actor Other;

	Other = Ignored.Trace(HitLocation, HitNormal, End, Start, true);
	// End:0xEC
	if((Other != none) && Other != Ignored)
	{
		// End:0xE9
		if(!Other.bWorldGeometry)
		{
			Other.TakeDamage(DamageMax, Instigator, HitLocation, Momentum * X, DamageType);
			HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
			// End:0xE9
			if(((Pawn(Other) != none) && HitLocation != Start) && AllowMultiHit())
			{
				TracePart(HitLocation, End, X, Dir, Pawn(Other));
			}
		}		
	}
	else
	{
		HitLocation = End;
		HitNormal = vect(0.0000000, 0.0000000, 0.0000000);
	}
	SpawnBeamEffect(Start, Dir, HitLocation, HitNormal, 0);
	//return;	
}

function SpawnBeamEffect(Vector Start, Rotator Dir, Vector HitLocation, Vector HitNormal, int ReflectNum)
{
	local ShockBeamEffect Beam;

	// End:0x6B
	if((Instigator.PlayerReplicationInfo.Team != none) && Instigator.PlayerReplicationInfo.Team.TeamIndex == 1)
	{
		Beam = Weapon.Spawn(Class'XWeapons.BlueSuperShockBeam',,, Start, Dir);		
	}
	else
	{
		Beam = Weapon.Spawn(BeamEffectClass,,, Start, Dir);
	}
	// End:0xA9
	if(ReflectNum != 0)
	{
		Beam.Instigator = none;
	}
	Beam.AimAt(HitLocation, HitNormal);
	//return;	
}

defaultproperties
{
	BeamEffectClass=Class'XWeapons.SuperShockBeamEffect'
	DamageType=Class'XWeapons.DamTypeSuperShockBeam'
	DamageMin=1000
	DamageMax=1000
	Momentum=100000.0000000
	FireSound=Sound'WeaponSounds.Misc.instagib_rifleshot'
	FireRate=1.1000000
	AmmoClass=Class'XWeapons.SuperShockAmmo'
	AmmoPerFire=0
}
