class ICISPrimaryFire extends BallisticFire;

const BASE_HEAL = 5;
const MAX_HEAL = 10;
const TICKS_PER_RAMP = 1;

var() Sound FireSoundLoop;
var int TickCount;

function StartBerserk()
{
	//return;	
}

function StopBerserk()
{
	//return;	
}

function PlayFiring()
{
	super.PlayFiring();
	// End:0x25
	if(FireSoundLoop != none)
	{
		Instigator.AmbientSound = FireSoundLoop;
	}
	//return;	
}

function StopFiring()
{
	Instigator.AmbientSound = none;
	TickCount = 0;
	// End:0x44
	if(int(BW.Role) == int(ROLE_Authority))
	{
		BW.RemoveSpeedModification(0.6500000);
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x44
	if(float(Instigator.Health) >= BallisticPawn(Instigator).HealthMax)
	{
		return false;
	}
	return Weapon.AmmoAmount(ThisModeNum) >= AmmoPerFire;
	//return;	
}

function DoFireEffect()
{
	// End:0x38
	if(TickCount == 0)
	{
		// End:0x38
		if(int(BW.Role) == int(ROLE_Authority))
		{
			BW.AddSpeedModification(0.6500000);
		}
	}
	BallisticPawn(Instigator).GiveAttributedHealth(Min(5 + (TickCount / 1), 10), int(BallisticPawn(Instigator).HealthMax), Instigator);
	++TickCount;
	//return;	
}

defaultproperties
{
	bAISilent=true
	PreFireTime=0.6500000
	PreFireAnim="PrepHealLoop"
	FireLoopAnim="HealLoopA"
	FireEndAnim="HealLoopEnd"
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_ICISStim'
	AmmoPerFire=10
}
