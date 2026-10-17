class FlameSwordPrimaryFire extends BallisticMeleeFire;

var() array<name> SliceAnims;
var int SliceAnim;

simulated event ModeDoFire()
{
	FireAnim = SliceAnims[SliceAnim];
	SliceAnim++;
	// End:0x2F
	if(SliceAnim >= SliceAnims.Length)
	{
		SliceAnim = 0;
	}
	super.ModeDoFire();
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local int i, LastTargetHealth;
	local Pawn PawnTarget;
	local FlameSwordActorFire Burner;

	PawnTarget = Pawn(Target);
	// End:0x2F
	if(PawnTarget != none)
	{
		LastTargetHealth = PawnTarget.Health;
	}
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x1B1
	if((((PawnTarget != none) && PawnTarget.Health > 0) && PawnTarget.Health < LastTargetHealth) && Vehicle(Target) == none)
	{
		i = 0;
		J0xA7:

		// End:0x114 [Loop If]
		if(i < Target.Attached.Length)
		{
			// End:0x10A
			if(FlameSwordActorFire(Target.Attached[i]) != none)
			{
				FlameSwordActorFire(Target.Attached[i]).AddFuel(2.0000000);
				// [Explicit Break]
				goto J0x114;
			}
			i++;
			// [Loop Continue]
			goto J0xA7;
		}
		J0x114:

		// End:0x1B1
		if(i >= Target.Attached.Length)
		{
			Burner = Spawn(Class'BWBP_OP_Pro.FlameSwordActorFire', Target,, Target.Location + vect(0.0000000, 0.0000000, -30.0000000));
			Burner.Initialize(Target);
			// End:0x1B1
			if(Instigator != none)
			{
				Burner.Instigator = Instigator;
				Burner.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

defaultproperties
{
	SliceAnims[0]="Swing1"
	SliceAnims[1]="Swing2"
	SliceAnims[2]="Swing3"
	FatiguePerStrike=0.1000000
	bCanBackstab=false
	TraceRange=(Min=165.0000000,Max=165.0000000)
	DamageType=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FlameSwordHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	KickForce=100
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Swing',Volume=4.0000000,Radius=256.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Slash1"
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=256.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.8000000
}
