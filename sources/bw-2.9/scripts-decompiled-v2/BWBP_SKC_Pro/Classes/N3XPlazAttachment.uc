class N3XPlazAttachment extends BallisticMeleeAttachment;

var() Sound DischargeSound;
var bool bPulse;
var bool bShock;
var bool bOldPulse;
var bool bOldShock;

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
	Spawn(Class'BWBP_SKC_Pro.IE_N3XDischarge', Instigator,, Instigator.Location);
	//return;	
}

simulated function DoShockWave()
{
	Spawn(Class'BWBP_SKC_Pro.IE_N3XDischarge', Instigator,, Instigator.Location);
	Instigator.PlaySound(DischargeSound, 0, 1.8000000,, 192.0000000, 1.0000000, false);
	//return;	
}

defaultproperties
{
	DischargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-WaterDischarge'
	MeleeAltStrikeAnim="Punchies_UppercutRight"
	WeaponClass=Class'BWBP_SKC_Pro.N3XPlaz'
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	AmbientSound=Sound'BWBP_SKC_Sounds.NEX.NEX-Idle'
	Mesh=SkeletalMesh'BWBP_SKC_Anim.PlasEdgeAxe_TPm'
	DrawScale=0.1300000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=256.0000000
	TransientSoundVolume=2.0000000
	TransientSoundRadius=256.0000000
}
