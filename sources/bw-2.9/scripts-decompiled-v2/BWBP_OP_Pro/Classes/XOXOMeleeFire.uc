class XOXOMeleeFire extends BallisticMeleeFire;

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local bool bWasAlive;

	// End:0x62
	if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
	{
		// End:0x62
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}
	}
	// End:0x12F
	if(((((BallisticPawn(Instigator) != none) && XOXOStaff(Instigator.Weapon) != none) && Victim.bProjTarget) && xPawn(Victim) != none) && (Pawn(Victim).GetTeamNum() != Instigator.GetTeamNum()) || Instigator.GetTeamNum() == 255)
	{
		BallisticPawn(Instigator).GiveAttributedHealth(int(float(Damage) * 0.6600000), int(Instigator.HealthMax), Instigator, true);
	}
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x19F
	if(bWasAlive && Pawn(Victim).Health <= 0)
	{
		Class'BWBP_OP_Pro.XOXOLewdness'.static.DistributeLewd(HitLocation, Instigator, Pawn(Victim), Weapon);
	}
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_OP_Pro.DTXOXOStab'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStab'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStab'
	KickForce=100
	HookStopFactor=1.7000000
	HookPullForce=100.0000000
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BWBP_OP_Sounds.XOXO.XOXO-Stab',Volume=0.5000000,Radius=12.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepStab"
	FireAnim="Stab"
	FireAnimRate=1.3500000
	TweenTime=0.0000000
	FireRate=0.6000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_XOXO'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.0500000
}
