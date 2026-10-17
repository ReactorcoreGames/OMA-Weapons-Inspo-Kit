class AkeronPrimaryFire extends BallisticProProjectileFire;

var Actor MuzzleFlashes[3];
var name FlashBones[3];
var byte Index;

function InitEffects()
{
	local int i;

	// End:0x1B
	if(AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0xB2
	if(MuzzleFlashClass != none)
	{
		i = 0;
		J0x2D:

		// End:0xB2 [Loop If]
		if(i < 3)
		{
			// End:0xA8
			if((MuzzleFlashes[i] == none) || MuzzleFlashes[i].bDeleteMe)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlashes[i], MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, FlashBones[i]);
			}
			i++;
			// [Loop Continue]
			goto J0x2D;
		}
	}
	//return;	
}

function FlashMuzzleFlash()
{
	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	// End:0xA8
	if(MuzzleFlashes[int(Index)] != none)
	{
		MuzzleFlashes[int(Index)].Trigger(Weapon, Instigator);
	}
	Index++;
	// End:0xC5
	if(int(Index) > 2)
	{
		Index = 0;
	}
	// End:0xD6
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

simulated function DestroyEffects()
{
	local int i;

	super(WeaponFire).DestroyEffects();
	i = 0;
	J0x0D:

	// End:0x4A [Loop If]
	if(i < 3)
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(MuzzleFlashes[i]);
		MuzzleFlashes[i] = none;
		i++;
		// [Loop Continue]
		goto J0x0D;
	}
	//return;	
}

defaultproperties
{
	FlashBones[0]="tip"
	FlashBones[1]="tip2"
	FlashBones[2]="tip3"
	SpawnOffset=(X=10.0000000,Y=10.0000000,Z=-3.0000000)
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	FireRecoil=128.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.Akeron.Akeron-Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bInstantHit=true
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireRate=0.7000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_Akeron'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BWBP_OP_Pro.AkeronRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=0.2500000
}
