class A909PrimaryFire extends BallisticMeleeFire;

var() array<name> SliceAnims;
var int SliceAnim;
var bool bFireNotified;

function PlayFiring()
{
	// End:0x2A
	if(BW.FireCount > 0)
	{
		FireAnim = SliceAnims[Rand(2) + 1];		
	}
	else
	{
		FireAnim = SliceAnims[0];
	}
	Weapon.PlayAnim(FireAnim, FireAnimRate / (float(1) + (BW.MeleeFatigue * 0.7500000)), TweenTime);
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	//return;	
}

event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x6B
	if(!bFireNotified)
	{
		// End:0x69
		if(BW.FireCount < 1)
		{
			NextFireTime += FireRate;
			NextFireTime = FMax(NextFireTime, Level.TimeSeconds);
			PlayFiring();
			BW.FireCount++;
		}
		return;
	}
	bFireNotified = false;
	BW.FireCount++;
	// End:0xA4
	if(MaxHoldTime > 0.0000000)
	{
		HoldTime = FMin(HoldTime, MaxHoldTime);
	}
	// End:0x134
	if(int(Weapon.Role) == int(ROLE_Authority))
	{
		DoFireEffect();
		// End:0xE6
		if((Instigator == none) || Instigator.Controller == none)
		{
			return;
		}
		// End:0x122
		if(AIController(Instigator.Controller) != none)
		{
			AIController(Instigator.Controller).WeaponFireAgain(BotRefireRate, true);
		}
		Instigator.DeactivateSpawnProtection();		
	}
	else
	{
		ApplyRecoil();
	}
	// End:0x1A1
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
	}
	// End:0x1C8
	if(Instigator.IsLocallyControlled())
	{
		ShakeView();
		FlashMuzzleFlash();
		StartMuzzleSmoke();		
	}
	BW.MeleeFatigue = FMin(BW.MeleeFatigue + FatiguePerStrike, 1.0000000);
	load = float(AmmoPerFire);
	HoldTime = 0.0000000;
	// End:0x250
	if((Instigator.PendingWeapon != Weapon) && Instigator.PendingWeapon != none)
	{
		bIsFiring = false;
		Weapon.PutDown();
	}
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	SliceAnims[0]="PrepHack"
	SliceAnims[1]="HackLoop1"
	SliceAnims[2]="HackLoop2"
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=-1536,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=-768,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=768,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=1536,Roll=0))
	bCanBackstab=false
	bAISilent=true
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.9900000
}
