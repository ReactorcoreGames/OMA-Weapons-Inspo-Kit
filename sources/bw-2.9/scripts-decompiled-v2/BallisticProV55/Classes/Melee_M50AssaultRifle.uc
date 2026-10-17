class Melee_M50AssaultRifle extends M50AssaultRifle
	config(BallisticProV55)
	hidedropdown
	cacheexempt;

simulated function PlayIdle()
{
	super(BallisticWeapon).PlayIdle();
	//return;	
}

function GrenadePickedUp()
{
	//return;	
}

function GiveAmmo(int M, WeaponPickup WP, bool bJustSpawned)
{
	super(BallisticWeapon).GiveAmmo(M, WP, bJustSpawned);
	//return;	
}

simulated event AnimEnd(int Channel)
{
	local name Anim;
	local float frame, Rate;

	GetAnimParams(0, Anim, frame, Rate);
	// End:0x38
	if((Anim == CamUpAnim) && Camera != none)
	{
		CameraView();
	}
	super.AnimEnd(Channel);
	//return;	
}

simulated function LoadGrenade()
{
	//return;	
}

function float GetAIRating()
{
	return 0.0000000;
	//return;	
}

defaultproperties
{
	FireModeClass[0]=Class'BallisticProV55.M50CamFire'
	FireModeClass[1]=Class'BallisticProV55.M50CamFire'
	AIRating=0.0000000
	Priority=11
	PickupClass=Class'BallisticProV55.Melee_M50Pickup'
	ItemName="Unfireable M50 Assault Rifle"
}
