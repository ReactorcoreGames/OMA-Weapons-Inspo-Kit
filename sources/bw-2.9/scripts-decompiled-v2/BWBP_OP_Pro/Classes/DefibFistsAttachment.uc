class DefibFistsAttachment extends BallisticMeleeAttachment;

var() Sound DischargeSound;
var bool bPulse;
var bool bShock;
var bool bOldPulse;
var bool bOldShock;
var Actor RightOne;
var Actor LeftOne;
var Actor LSparks;
var Actor RSparks;
var bool bDischarged;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bPulse, bShock;
}

simulated function DoWave(bool bIsShock)
{
	// End:0x46
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		// End:0x34
		if(bIsShock)
		{
			bShock = !bShock;			
		}
		else
		{
			bPulse = !bPulse;
		}		
	}
	else
	{
		// End:0x58
		if(bIsShock)
		{
			DoShockWave();			
		}
		else
		{
			DoPulseWave();
		}
	}
	//return;	
}

simulated function PostNetReceive()
{
	super.PostNetReceive();
	// End:0x2D
	if(bPulse != bOldPulse)
	{
		bOldPulse = bPulse;
		DoPulseWave();		
	}
	else
	{
		// End:0x51
		if(bShock != bOldShock)
		{
			bOldShock = bShock;
			DoShockWave();
		}
	}
	//return;	
}

simulated function DoPulseWave()
{
	Spawn(Class'BWBP_OP_Pro.IE_DefibDischarge', Instigator,, Instigator.Location);
	//return;	
}

simulated function DoShockWave()
{
	Spawn(Class'BWBP_OP_Pro.IE_DefibDischarge', Instigator,, Instigator.Location);
	Instigator.PlaySound(DischargeSound, 0, 1.8000000,, 192.0000000, 1.0000000, false);
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x38
	if(Instigator != none)
	{
		LeftOne = Spawn(Class'BWBP_OP_Pro.DefibFistsLeftBlades');
		Instigator.AttachToBone(LeftOne, 'bip01 l hand');
	}
	// End:0x6A
	if(Instigator != none)
	{
		RightOne = Spawn(Class'BWBP_OP_Pro.DefibFistsRightBlades');
		Instigator.AttachToBone(RightOne, 'Bip01 R Hand');
	}
	//return;	
}

simulated event Tick(float dt)
{
	// End:0xDE
	if((Instigator.IsLocallyControlled() && int(Level.DetailMode) == int(2)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) >= 2)
	{
		// End:0x8E
		if(LSparks == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(LSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'LElectrode');
			LeftOne.AttachToBone(LSparks, 'LElectrode');
		}
		// End:0xD6
		if(RSparks == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(RSparks, Class'BWBP_OP_Pro.DefibFistsTazerEffect', DrawScale, self, 'RElectrode');
			RightOne.AttachToBone(RSparks, 'RElectrode');
		}
		bDischarged = false;
	}
	super(BallisticAttachment).Tick(dt);
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(LeftOne != none)
	{
		LeftOne.Destroy();
	}
	// End:0x2E
	if(RightOne != none)
	{
		RightOne.Destroy();
	}
	// End:0x45
	if(LSparks != none)
	{
		LSparks.Destroy();
	}
	// End:0x5C
	if(RSparks != none)
	{
		RSparks.Destroy();
	}
	super(BallisticAttachment).Destroyed();
	//return;	
}

defaultproperties
{
	DischargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-WaterDischarge'
	MeleeAltStrikeAnim="Punchies_UppercutRight"
	WeaponClass=Class'BWBP_OP_Pro.DefibFists'
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	IdleHeavyAnim="Punchies_Idle"
	IdleRifleAnim="Punchies_Idle"
	MeleeStrikeAnim="Punchies_JabLeft"
	DrawScale=0.6000000
}
