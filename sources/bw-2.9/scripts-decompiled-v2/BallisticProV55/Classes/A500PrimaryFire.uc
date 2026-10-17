class A500PrimaryFire extends BallisticProProjectileFire;

var byte ProjectileCount;
var float HipSpreadFactor;

simulated function float GetCrosshairInaccAngle()
{
	return (YInaccuracy * HipSpreadFactor) * 0.0000959;
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
	super(BallisticProjectileFire).DoFireEffect();
	//return;	
}

simulated function Vector GetFireSpread()
{
	local float fX;
	local Rotator R;

	// End:0x30
	if(BW.bScopeView || BW.bAimDisabled)
	{
		return super.GetFireSpread();		
	}
	else
	{
		fX = FRand();
		R.Yaw = int(((XInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Sin(fX * 1.5707960));
		R.Pitch = int(((YInaccuracy * HipSpreadFactor) * Sin(((FRand() * float(2)) - float(1)) * 1.5707960)) * Cos(fX * 1.5707960));
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

defaultproperties
{
	ProjectileCount=4
	HipSpreadFactor=1.7500000
	bNoRandomFire=true
	bTossed=true
	bInstantHit=true
	AmmoClass=Class'BallisticProV55.Ammo_A500Cells'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	BotRefireRate=0.7000000
}
