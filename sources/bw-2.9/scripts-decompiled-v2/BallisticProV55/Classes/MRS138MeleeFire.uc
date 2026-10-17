class MRS138MeleeFire extends BallisticMeleeFire;

simulated function ModeHoldFire()
{
	MRS138Shotgun(Weapon).StartTazer();
	super.ModeHoldFire();
	//return;	
}

simulated event ModeDoFire()
{
	MRS138Shotgun(Weapon).TazerTime = Level.TimeSeconds;
	super.ModeDoFire();
	//return;	
}

function bool DoTazerBlurEffect(Actor Victim)
{
	local int i;
	local MRS138ViewMesser vm;

	// End:0x88
	if((((Pawn(Victim) == none) || Pawn(Victim).Health < 1) || Pawn(Victim).LastPainTime != Victim.Level.TimeSeconds) || Pawn(Victim).GetTeamNum() == Instigator.GetTeamNum())
	{
		return false;
	}
	// End:0x1AE
	if(PlayerController(Pawn(Victim).Controller) != none)
	{
		i = 0;
		J0xAD:

		// End:0x14A [Loop If]
		if(i < Pawn(Victim).Controller.Attached.Length)
		{
			// End:0x140
			if(MRS138ViewMesser(Pawn(Victim).Controller.Attached[i]) != none)
			{
				MRS138ViewMesser(Pawn(Victim).Controller.Attached[i]).AddImpulse();
				i = -1;
				// [Explicit Break]
				goto J0x14A;
			}
			i++;
			// [Loop Continue]
			goto J0xAD;
		}
		J0x14A:

		// End:0x1AB
		if(i != -1)
		{
			vm = Spawn(Class'BallisticProV55.MRS138ViewMesser', Pawn(Victim).Controller);
			vm.SetBase(Pawn(Victim).Controller);
			vm.AddImpulse();
		}		
	}
	else
	{
		// End:0x22D
		if(AIController(Pawn(Victim).Controller) != none)
		{
			AIController(Pawn(Victim).Controller).Startle(Weapon.Instigator);
			Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(Pawn(Victim).Controller), 2.0000000, 15.0000000);
		}
	}
	return false;
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x63
	if(Victim.bCanBeDamaged)
	{
		DoTazerBlurEffect(Victim);
		MRS138Attachment(Weapon.ThirdPersonActor).TazerHitActor(HitLocation);
	}
	//return;	
}

defaultproperties
{
	bCanBackstab=false
	DamageType=Class'BallisticProV55.DTMRS138Tazer'
	DamageTypeHead=Class'BallisticProV55.DTMRS138Tazer'
	DamageTypeArm=Class'BallisticProV55.DTMRS138Tazer'
	KickForce=8000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepAttack"
	FireAnim="Attack"
	TweenTime=0.0000000
	FireRate=0.7500000
	AmmoClass=Class'BallisticProV55.Ammo_MRS138Shells'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
