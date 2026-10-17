class CX85SecondaryFire extends BallisticProInstantFire;

var() FullSound TargetLockSound;

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0xE5
	if(CX85AssaultWeapon(BW).AltAmmo < 1)
	{
		// End:0xA2
		if(!bPlayedDryFire && DryFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(DryFireSound.Sound, DryFireSound.Slot, DryFireSound.Volume, DryFireSound.bNoOverride, DryFireSound.Radius, DryFireSound.Pitch, DryFireSound.bAtten);
			bPlayedDryFire = true;
		}
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;
	}
	return true;
	//return;	
}

function DoFireEffect()
{
	super(BallisticInstantFire).DoFireEffect();
	CX85AssaultWeapon(BW).AltAmmo--;
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local CX85DartDirect proj, MasterProj;
	local Rotator R;
	local float boneDist;

	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x28A
	if(((Damage > 0) && Pawn(Target) != none) && Pawn(Target).Health > 0)
	{
		R = Rotator(MomentumDir);
		R.Roll = Rand(65536);
		// End:0xBB
		foreach Target.BasedActors(Class'BWBP_OP_Pro.CX85DartDirect', proj)
		{
			// End:0xBA
			if(proj.Instigator == Instigator)
			{
				MasterProj = proj;
				// End:0xBB
				break;
			}			
		}		
		// End:0x104
		if(MasterProj != none)
		{
			proj = Spawn(Class'BWBP_OP_Pro.CX85DartDirect', MasterProj,, HitLocation, R);
			proj.Tracked = Pawn(Target);			
		}
		else
		{
			CX85AssaultWeapon(BW).bPendingReceive = true;
			proj = Spawn(Class'BWBP_OP_Pro.CX85DartDirect', BW,, HitLocation, R);
			proj.Tracked = Pawn(Target);
			proj.SetMaster();
		}
		proj.Instigator = Instigator;
		proj.SetPhysics(0);
		proj.bHardAttach = true;
		// End:0x1F5
		if((Target != Instigator) && int(Target.DrawType) == int(2))
		{
			Target.AttachToBone(proj, Target.GetClosestBone(HitLocation, MomentumDir, boneDist));			
		}
		else
		{
			proj.SetBase(Target);
		}
		proj.SetRotation(R);
		proj.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		Weapon.PlayOwnedSound(TargetLockSound.Sound, TargetLockSound.Slot, TargetLockSound.Volume, TargetLockSound.bNoOverride, TargetLockSound.Radius, TargetLockSound.Pitch, TargetLockSound.bAtten);
	}
	//return;	
}

defaultproperties
{
	TargetLockSound=(Sound=Sound'AssaultSounds.HumanShip.TargetCycle01',Volume=1.3500000,Radius=0.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	MaxWaterTraceRange=5000.0000000
	DamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeHead=Class'BWBP_OP_Pro.DTCX85Dart'
	DamageTypeArm=Class'BWBP_OP_Pro.DTCX85Dart'
	FlashBone="tip2"
	bUseWeaponMag=false
	FireRecoil=256.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.OA-SMG.OA-SMG_FireDart',Volume=1.3500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	PreFireAnim="None"
	FireAnim="FireAlt"
	FireForce="AssaultRifleAltFire"
	FireRate=0.3500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_CX85Darts'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
