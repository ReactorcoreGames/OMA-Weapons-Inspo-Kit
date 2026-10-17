class FlameSwordMeleeFire extends BallisticMeleeFire;

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
	SwipePoints[0]=(Weight=6,offset=(Pitch=6000,Yaw=4000,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=4500,Yaw=3000,Roll=0))
	SwipePoints[2]=(Weight=4,offset=(Pitch=3000,Yaw=2000,Roll=0))
	SwipePoints[3]=(Weight=3,offset=(Pitch=1500,Yaw=1000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[5]=(Weight=1,offset=(Pitch=-1500,Yaw=-1500,Roll=0))
	SwipePoints[6]=(Weight=0,offset=(Pitch=-3000,Yaw=0,Roll=0))
	WallHitPoint=4
	FatiguePerStrike=0.4000000
	TraceRange=(Min=175.0000000,Max=175.0000000)
	Damage=65.0000000
	DamageType=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	DamageTypeHead=Class'BWBP_OP_Pro.DT_FlameSwordHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DT_FlameSwordChest'
	KickForce=2000
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-Swing',Volume=1.0000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSwing"
	FireAnim="Swing3"
	PreFireAnimRate=2.0000000
	TweenTime=0.0000000
	FireRate=0.7000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
