class VSKPrimaryFire extends BallisticInstantFire;

var() Sound ScopedFireSound;
var() Sound RegularFireSound;
var() bool bDOT;

simulated function IgniteActor(Actor A)
{
	local VSKActorPoison PF;

	PF = Spawn(Class'BWBP_SKC_Pro.VSKActorPoison');
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

	// End:0x67
	if((xPawn(Victim) != none) && bDOT)
	{
		// End:0x67
		if(Level.Game.ReduceDamage(Damage, xPawn(Victim), Instigator, HitLocation, Dummy, DamageType) > 0)
		{
			IgniteActor(Victim);
		}
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Damage), Instigator, HitLocation, MomentumDir, DamageType);
	// End:0xBE
	if(Victim.bCanBeDamaged && bDOT)
	{
		DoTazerBlurEffect(Victim);
	}
	//return;	
}

defaultproperties
{
	ScopedFireSound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-SuperShot'
	RegularFireSound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-Shot'
	bDOT=true
	TraceRange=(Min=12000.0000000,Max=15000.0000000)
	Damage=35.0000000
	DamageType=Class'BWBP_SKC_Pro.DT_VSKTranq'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_VSKTranqHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_VSKTranq'
	KickForce=20000
	PenetrateForce=150
	FlashBone="tip2"
	BrassClass=Class'BWBP_SKC_Pro.Brass_Tranq'
	BrassOffset=(X=-80.0000000,Y=1.0000000,Z=0.0000000)
	bCockAfterEmpty=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.VSKSilencedFlash'
	FlashScaleFactor=0.5000000
	FireRecoil=88.0000000
	XInaccuracy=1.7500000
	YInaccuracy=1.7500000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.VSK.VSK-SuperShot',Volume=1.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bAISilent=true
	bPawnRapidFireAnim=true
	FireEndAnim="None"
	FireRate=0.6000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Tranq'
	ShakeRotMag=(X=32.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=480.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-50.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
	aimerror=900.0000000
}
