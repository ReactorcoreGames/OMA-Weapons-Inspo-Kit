class LonghornSecondaryFire extends BallisticProProjectileFire;

var byte ProjectileCount;
var float HipMultiplier;

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	LonghornLauncher(Weapon).LonghornFired();
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	LonghornLauncher(Weapon).LonghornFired();
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x1C
	if(BW.bScopeView)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int(((XInaccuracy * HipMultiplier) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int(((YInaccuracy * HipMultiplier) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
		return Vector(R);
	}
	//return;	
}

simulated function Vector GetFireDir(out Vector StartTrace)
{
	// End:0x3C
	if(StartTrace == vect(0.0000000, 0.0000000, 0.0000000))
	{
		StartTrace = Instigator.Location + Instigator.EyePosition();
	}
	return Vector(AdjustAim(StartTrace, aimerror));
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;
	local int i;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	i = 0;
	J0xBD:

	// End:0x16B [Loop If]
	if(i < int(ProjectileCount))
	{
		Aim = GetFireAim(StartTrace);
		Aim = Rotator((GetFireSpread()) >> Aim);
		End = Start + (Vector(Aim) * (MaxRange()));
		Other = Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x151
		if(Other != none)
		{
			Aim = Rotator(HitLocation - StartTrace);
		}
		SpawnProjectile(StartTrace, Aim);
		i++;
		// [Loop Continue]
		goto J0xBD;
	}
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	super(BallisticFire).DoFireEffect();
	//return;	
}

defaultproperties
{
	ProjectileCount=6
	HipMultiplier=2.0000000
	bNoRandomFire=true
}
