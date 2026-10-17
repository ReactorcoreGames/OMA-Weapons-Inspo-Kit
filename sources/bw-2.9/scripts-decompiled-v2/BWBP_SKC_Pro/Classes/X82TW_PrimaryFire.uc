class X82TW_PrimaryFire extends X82PrimaryFire;

simulated function ModeDoFire()
{
	super(BallisticProInstantFire).ModeDoFire();
	// End:0x74
	if((Instigator != none) && Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo) != none)
	{
		Class'BallisticProV55.Mut_Ballistic'.static.GetBPRI(Instigator.PlayerReplicationInfo).AddFireStat(int(load), int(BW.InventoryGroup));
	}
	//return;	
}

defaultproperties
{
	BrassOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	FirePushbackForce=0.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire4',Volume=10.0000000,Radius=750.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireRate=0.5300000
	aimerror=0.0000000
}
