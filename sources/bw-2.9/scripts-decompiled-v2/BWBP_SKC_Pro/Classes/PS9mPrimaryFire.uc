class PS9mPrimaryFire extends BallisticProInstantFire;

simulated event ModeDoFire()
{
	// End:0x26
	if(!AllowFire() || PS9mPistol(Weapon).bLoaded)
	{
		return;
	}
	super.ModeDoFire();
	//return;	
}

simulated function IgniteActor(Actor A)
{
	local PS9mActorPoison PF;

	PF = Spawn(Class'BWBP_SKC_Pro.PS9mActorPoison');
	PF.Instigator = Instigator;
	PF.Initialize(A);
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
			Class'BCoreProV55.BC_BotStoopidizer'.static.DoBotStun(AIController(Pawn(Victim).Controller), 2.0000000, 5.0000000);
		}
	}
	return false;
	//return;	
}

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local Vector Dummy;

	// End:0x87
	if(((xPawn(Victim) != none) && PS9mPistol(BW) != none) && PS9mPistol(BW).bToxin)
	{
		// End:0x87
		if(Level.Game.ReduceDamage(Damage, xPawn(Victim), Instigator, HitLocation, Dummy, DamageType) > 0)
		{
			IgniteActor(Victim);
		}
	}
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xC8
	if(Victim.bCanBeDamaged)
	{
		DoTazerBlurEffect(Victim);
	}
	//return;	
}

function PlayFiring()
{
	// End:0x51
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'IdleOpen';
		BW.ReloadAnim = 'ReloadOpen';
		FireAnim = 'FireOpen';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=3000.0000000,Max=5000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_PS9MDart'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_PS9MDartHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_PS9MDart'
	PenetrateForce=150
	BrassClass=Class'BWBP_SKC_Pro.Brass_Tranq'
	BrassOffset=(X=-20.0000000,Y=1.0000000,Z=0.0000000)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.8000000
	FireRecoil=64.0000000
	FireChaos=0.0500000
	XInaccuracy=32.0000000
	YInaccuracy=32.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.Stealth.Stealth-Fire',Volume=0.2500000,Radius=16.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bAISilent=true
	FireEndAnim="None"
	FireRate=0.0750000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_TranqP'
	ShakeRotMag=(X=32.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=480.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
