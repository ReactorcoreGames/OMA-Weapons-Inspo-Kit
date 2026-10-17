class WrenchMeleeFire extends BallisticMeleeFire;

var float RepairAmount;

function DoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir, int PenetrateCount, int WallCount, optional Vector WaterHitLocation)
{
	local float Dmg;
	local Class<DamageType> HitDT;
	local Actor Victim;
	local Vector ForceDir, BoneTestLocation, ClosestLocation, testDir;
	local DestroyableObjective HealObjective;
	local Vehicle HealVehicle;
	local int AdjustedDamage, AdjustedRepair;

	// End:0x41
	if(Other.IsA('Monster'))
	{
		Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);		
	}
	else
	{
		// End:0x10D
		if(Other.IsA('xPawn'))
		{
			ClosestLocation = Other.Location;
			ClosestLocation.Z += HitLocation - Other.Location.Z;
			BoneTestLocation = Dir;
			BoneTestLocation *= VSize(ClosestLocation - HitLocation);
			BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(HitLocation - TraceStart));
			BoneTestLocation += HitLocation;
			Dmg = GetDamage(Other, BoneTestLocation, TraceStart, Dir, Victim, HitDT);			
		}
		else
		{
			Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
		}
	}
	// End:0x1B4
	if(Instigator != none)
	{
		AdjustedDamage = int((Dmg * Instigator.DamageScaling) * DamageType.default.VehicleDamageScaling);
		AdjustedRepair = int(RepairAmount * Instigator.DamageScaling);
		// End:0x1B4
		if(Instigator.HasUDamage())
		{
			AdjustedDamage *= float(2);
			AdjustedRepair *= float(2);
		}
	}
	HealObjective = DestroyableObjective(Other);
	// End:0x1E8
	if(HealObjective == none)
	{
		HealObjective = DestroyableObjective(Other.Owner);
	}
	// End:0x23F
	if((HealObjective != none) && HealObjective.TeamLink(Instigator.GetTeamNum()))
	{
		HealObjective.HealDamage(AdjustedRepair, Instigator.Controller, HitDT);
		return;
	}
	HealVehicle = Vehicle(Other);
	// End:0x2A6
	if((HealVehicle != none) && HealVehicle.TeamLink(Instigator.GetTeamNum()))
	{
		HealVehicle.HealDamage(AdjustedRepair, Instigator.Controller, HitDT);
		return;
	}
	// End:0x2EB
	if((WrenchDeployable(Other) != none) && Other.Instigator == Instigator)
	{
		WrenchDeployable(Other).AddHealth(AdjustedRepair);
		return;
	}
	// End:0x323
	if(HoldTime > float(0))
	{
		Dmg += ((Dmg * 1.1500000) * (FMin(HoldTime, MaxBonusHoldTime) / MaxBonusHoldTime));		
	}
	else
	{
		// End:0x381
		if((ThisModeNum == 2) && HoldStartTime != float(0))
		{
			Dmg += ((Dmg * 1.1500000) * (FMin(Level.TimeSeconds - HoldStartTime, MaxBonusHoldTime) / MaxBonusHoldTime));
			HoldStartTime = 0.0000000;
		}
	}
	// End:0x3E5
	if(bCanBackstab)
	{
		testDir = Dir;
		testDir.Z = 0.0000000;
		// End:0x3D2
		if((Vector(Victim.Rotation) Dot testDir) > 0.2000000)
		{
			Dmg *= 1.5000000;
		}
		Dmg = float(Min(int(Dmg), 230));
	}
	// End:0x4BC
	if((((HookStopFactor != float(0)) && HookPullForce != float(0)) && Pawn(Victim) != none) && Pawn(Victim).bProjTarget)
	{
		ForceDir = Normal(Other.Location - TraceStart);
		ForceDir.Z *= 0.3000000;
		Pawn(Victim).AddVelocity(((Normal(Victim.Acceleration) * HookStopFactor) * -FMin(Pawn(Victim).GroundSpeed, VSize(Victim.Velocity))) - (ForceDir * HookPullForce));
	}
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, float(KickForce) * Dir, HitDT);
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

defaultproperties
{
	RepairAmount=75.0000000
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=-1536,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=1536,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1280,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-2560,Roll=0))
	WallHitPoint=1
	NumSwipePoints=3
	FatiguePerStrike=0.2500000
	TraceRange=(Min=150.0000000,Max=150.0000000)
	Damage=80.0000000
	DamageType=Class'BWBP_OP_Pro.DTWrenchHit'
	DamageTypeHead=Class'BWBP_OP_Pro.DTWrenchHitHead'
	DamageTypeArm=Class'BWBP_OP_Pro.DTWrenchHit'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.Wrench.Wrench-Swing',Volume=1.0000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSmash"
	FireAnim="Smash"
	FireRate=1.2500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Wrench'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=128.0000000,Z=0.0000000)
	ShakeRotRate=(X=2500.0000000,Y=2500.0000000,Z=2500.0000000)
	ShakeRotTime=2.5000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
