class ClassicRocketMultifire extends RocketMultiFire;

function ModeTick(float dt)
{
	// End:0x46
	if(((HoldTime > 0.0000000) && load >= float(Weapon.AmmoAmount(ThisModeNum))) && !bNowWaiting)
	{
		bIsFiring = false;
	}
	super(WeaponFire).ModeTick(dt);
	// End:0xB9
	if((load <= float(5)) && HoldTime >= (FireRate * load))
	{
		// End:0xA1
		if(Instigator.IsLocallyControlled())
		{
			RocketLauncher(Weapon).PlayLoad(false);			
		}
		else
		{
			ServerPlayLoading();
		}
		load = load + 1.0000000;
	}
	//return;	
}

event ModeDoFire()
{
	MaxHoldTime = 0.0000000;
	super.ModeDoFire();
	MaxHoldTime = default.MaxHoldTime;
	//return;	
}

function DoFireEffect()
{
	Weapon.GetFireMode(0).NextFireTime = Level.TimeSeconds + FireRate;
	Weapon.GetFireMode(1).NextFireTime = Level.TimeSeconds + FireRate;
	super.DoFireEffect();
	//return;	
}

defaultproperties
{
	MaxLoad=6
	MaxHoldTime=7.7000000
	FireAnimRate=0.7600000
	FireRate=1.2500000
}
