class DefibFistsPrimaryFire extends BallisticMeleeFire;

var int ElectroDamageBonus;
var int ElectroHeal;
var int RequiredBonusCharge;
var bool bPunchLeft;
var FullSound DischargedFireSound;

event ModeDoFire()
{
	local float F;

	super.ModeDoFire();
	F = FRand();
	// End:0x42
	if(F > 0.5000000)
	{
		// End:0x34
		if(bPunchLeft)
		{
			FireAnim = 'PunchL1';			
		}
		else
		{
			FireAnim = 'PunchR1';
		}		
	}
	else
	{
		// End:0x59
		if(bPunchLeft)
		{
			FireAnim = 'PunchL2';			
		}
		else
		{
			FireAnim = 'PunchR2';
		}
	}
	// End:0x78
	if(bPunchLeft)
	{
		bPunchLeft = false;		
	}
	else
	{
		bPunchLeft = true;
	}
	//return;	
}

function ServerPlayFiring()
{
	// End:0x71
	if(DefibFists(BW).bDischarged)
	{
		Weapon.PlayOwnedSound(DischargedFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);		
	}
	else
	{
		// End:0xD8
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	// End:0x127
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	//return;	
}

function PlayFiring()
{
	// End:0x49
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xF1
	if(DefibFists(BW).bDischarged)
	{
		Weapon.PlayOwnedSound(DischargedFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);		
	}
	else
	{
		// End:0x158
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	//return;	
}

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local int PrevHealth;
	local BallisticPawn BPawn;

	// End:0x24
	if((Mover(Target) != none) || Vehicle(Target) != none)
	{
		return;
	}
	BPawn = BallisticPawn(Target);
	// End:0xFF
	if(IsValidHealTarget(BPawn))
	{
		// End:0xFD
		if(DefibFists(BW).ElectroCharge >= RequiredBonusCharge)
		{
			PrevHealth = int(BPawn.ShieldStrength);
			BPawn.GiveAttributedShield(ElectroHeal, Instigator);
			DefibFists(Weapon).PointsHealed += (BPawn.ShieldStrength - float(PrevHealth));
			DefibFists(BW).ElectroCharge -= RequiredBonusCharge;
			DefibFists(BW).LastRegen = Level.TimeSeconds + 0.5000000;
		}
		return;
	}
	// End:0x142
	if(DefibFists(Weapon).ElectroCharge >= RequiredBonusCharge)
	{
		Damage += ElectroDamageBonus;
		DefibFists(BW).ElectroCharge -= RequiredBonusCharge;
	}
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	DefibFists(BW).LastRegen = Level.TimeSeconds + float(1);
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
	ElectroDamageBonus=30
	ElectroHeal=10
	RequiredBonusCharge=20
	DischargedFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.0000000,Radius=32.0000000,Slot=0,Pitch=0.0000000,bAtten=true,bNoOverride=false)
	FatiguePerStrike=0.0150000
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BWBP_OP_Pro.DTShockGauntlet'
	DamageTypeHead=Class'BWBP_OP_Pro.DTShockGauntlet'
	DamageTypeArm=Class'BWBP_OP_Pro.DTShockGauntlet'
	KickForce=1000
	bUseWeaponMag=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="PunchL1"
	FireAnimRate=1.2500000
	FireRate=0.4000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_DefibCharge'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
