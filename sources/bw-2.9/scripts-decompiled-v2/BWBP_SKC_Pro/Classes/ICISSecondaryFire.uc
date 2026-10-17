class ICISSecondaryFire extends BallisticMeleeFire;

var byte AmmoCost;

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local BallisticPawn BPawn;
	local ICISPoisoner IP;
	local float pwr;

	pwr = FMin(1.0000000, float(BW.AmmoAmount(0)) / float(AmmoCost));
	BPawn = BallisticPawn(Target);
	// End:0x170
	if(IsValidHealTarget(BPawn))
	{
		// End:0x7B
		if(((Instigator == none) || Vehicle(Instigator) != none) || Instigator.Health <= 0)
		{
			return;
		}
		IP = Spawn(Class'BWBP_SKC_Pro.ICISPoisoner', Instigator.Controller);
		IP.Instigator = Instigator;
		IP.pwr = pwr;
		// End:0x10E
		if((int(Instigator.Role) == int(ROLE_Authority)) && Instigator.Controller != none)
		{
			IP.InstigatorController = Instigator.Controller;
		}
		IP.Initialize(BPawn);
		ICISStimpack(BW).ConsumeAmmo(1, float(AmmoCost), true);
		ICISStimpack(BW).PlaySound(ICISStimpack(BW).HealSound, 1, 1.5000000,, 64.0000000);
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
	return Weapon.AmmoAmount(ThisModeNum) > 0;
	//return;	
}

function bool IsValidHealTarget(Pawn Target)
{
	// End:0x1E
	if((Target == none) || Target == Instigator)
	{
		return false;
	}
	// End:0x34
	if(Target.Health <= 0)
	{
		return false;
	}
	// End:0x4A
	if(!Target.bProjTarget)
	{
		return false;
	}
	// End:0x69
	if(!Level.Game.bTeamGame)
	{
		return false;
	}
	// End:0x7B
	if(Vehicle(Target) != none)
	{
		return false;
	}
	return (Target.Controller != none) && Instigator.Controller.SameTeamAs(Target.Controller);
	//return;	
}

defaultproperties
{
	AmmoCost=100
	SwipePoints[0]=(Weight=3,offset=(Pitch=4000,Yaw=2000,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=2000,Yaw=1000,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=-2000,Yaw=-1000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=-4000,Yaw=-2000,Roll=0))
	SwipePoints[5]=(Weight=-1,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[6]=(Weight=-1,offset=(Pitch=0,Yaw=0,Roll=0))
	TraceRange=(Min=96.0000000,Max=96.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_ICIS'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_ICIS'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_ICIS'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.X4.X4_Melee',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepFriendlyShank"
	FireAnim="FriendlyShank"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_ICISStim'
	AmmoPerFire=0
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
