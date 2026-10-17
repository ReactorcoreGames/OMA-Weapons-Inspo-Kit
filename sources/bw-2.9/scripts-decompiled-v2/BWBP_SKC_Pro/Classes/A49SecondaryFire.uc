class A49SecondaryFire extends BallisticFire;

var float forceMag;
var float Damage;

simulated function bool AllowFire()
{
	// End:0x2B
	if((A49SkrithBlaster(Weapon).HeatLevel >= float(12)) || !super.AllowFire())
	{
		return false;
	}
	return true;
	//return;	
}

function PlayFiring()
{
	super.PlayFiring();
	A49SkrithBlaster(BW).AddHeat(HeatPerShot);
	//return;	
}

function DoFireEffect()
{
	local Vector Start;
	local Rotator Aim;

	Start = Instigator.Location + Instigator.EyePosition();
	Aim = GetFireAim(Start);
	Aim = Rotator((GetFireSpread()) >> Aim);
	A49SkrithBlaster(BW).ConicalBlast(Damage, 512.0000000, Vector(Aim));
	// End:0xA3
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		A49SkrithBlaster(BW).AddHeat(HeatPerShot);
	}
	//return;	
}

defaultproperties
{
	forceMag=1000.0000000
	Damage=35.0000000
	FirePushbackForce=1500.0000000
	HeatPerShot=9.0000000
	AmmoClass=Class'BallisticProV55.Ammo_Cells'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-12.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
}
