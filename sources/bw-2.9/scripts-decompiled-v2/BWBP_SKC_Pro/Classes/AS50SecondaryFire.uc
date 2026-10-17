class AS50SecondaryFire extends BallisticProInstantFire;

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	BW.TargetedHurtRadius(5.0000000, 96.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local int i;
	local AS50ActorFire Burner;

	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x172
	if(((Pawn(Target) != none) && Pawn(Target).Health > 0) && Vehicle(Target) == none)
	{
		i = 0;
		J0x68:

		// End:0xD5 [Loop If]
		if(i < Target.Attached.Length)
		{
			// End:0xCB
			if(AS50ActorFire(Target.Attached[i]) != none)
			{
				AS50ActorFire(Target.Attached[i]).AddFuel(2.0000000);
				// [Explicit Break]
				goto J0xD5;
			}
			i++;
			// [Loop Continue]
			goto J0x68;
		}
		J0xD5:

		// End:0x172
		if(i >= Target.Attached.Length)
		{
			Burner = Spawn(Class'BWBP_SKC_Pro.AS50ActorFire', Target,, Target.Location + vect(0.0000000, 0.0000000, -30.0000000));
			Burner.Initialize(Target);
			// End:0x172
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
	TraceRange=(Min=15000.0000000,Max=15000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_AS50Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_AS50Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_AS50Limb'
	PDamageFactor=0.0000000
	WallPDamageFactor=0.8500000
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMGInc'
	BrassBone="breach"
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireRecoil=768.0000000
	FirePushbackForce=255.0000000
	FireChaos=1.0000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_SKC_Sounds.AS50.AS50-Fire',Volume=5.1000000,Radius=512.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	FireAnim="CFire"
	FireEndAnim="None"
	FireRate=0.3500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50Inc'
	ShakeRotMag=(X=450.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=12400.0000000,Y=12400.0000000,Z=12400.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-5.5000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.2500000
	BotRefireRate=0.5000000
	WarnTargetPct=0.4000000
	aimerror=950.0000000
}
