class A42PrimaryFireSpread extends BallisticProProjectileFire;

var byte Shots;
var byte Cycle;
var() int FireSpread;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!super(BallisticFire).AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x1A
	if(FRand() > 0.5000000)
	{
		FireAnim = 'Fire';		
	}
	else
	{
		FireAnim = 'Fire2';
	}
	super.ModeDoFire();
	// End:0x4E
	if(BW.MagAmmo == 0)
	{
		BW.ServerStartReload();
	}
	//return;	
}

function DoFireEffect()
{
	super(BallisticProjectileFire).DoFireEffect();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	local int i;
	local Rotator R;

	Shots = byte(FMin(float(default.Shots), float(BW.MagAmmo)));
	ConsumedLoad = AmmoPerFire * int(Shots);
	i = 0;
	J0x3C:

	// End:0x10F [Loop If]
	if(i < int(Shots))
	{
		R.Roll = int(float((65536 / 3) * int(Cycle)) + (65536.0000000 / float(12)));
		Dir = Rotator((GetFireSpread()) >> Dir);
		proj = Spawn(ProjectileClass,,, Start, Rotator((Vector(rot(0, 1, 0) * float(FireSpread)) >> R) >> Dir));
		proj.Instigator = Instigator;
		Cycle++;
		// End:0x105
		if(int(Cycle) > 3)
		{
			Cycle = 1;
		}
		i++;
		// [Loop Continue]
		goto J0x3C;
	}
	//return;	
}

function PlayFiring()
{
	// End:0x19
	if(int(Level.NetMode) == int(NM_Client))
	{
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	Shots=3
	Cycle=1
	FireSpread=120
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-7.0000000)
	HeatPerShot=0.0810000
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	AmmoClass=Class'BallisticProV55.Ammo_A42Charge'
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.3000000
}
