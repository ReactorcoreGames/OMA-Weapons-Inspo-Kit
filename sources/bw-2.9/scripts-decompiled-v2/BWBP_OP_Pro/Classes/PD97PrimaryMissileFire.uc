class PD97PrimaryMissileFire extends BallisticProProjectileFire;

simulated function PlayFiring()
{
	// End:0x2B
	if(PD97Bloodhound(BW).bNeedRotate)
	{
		PD97Bloodhound(BW).CycleDrum();
	}
	// End:0x87
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		BW.IdleAnim = 'OpenIdle';
		BW.ReloadAnim = 'OpenReload';
		AimedFireAnim = 'OpenSightFire';
		FireAnim = 'OpenFire';		
	}
	else
	{
		BW.IdleAnim = 'Idle';
		BW.ReloadAnim = 'Reload';
		AimedFireAnim = 'SightFire';
		FireAnim = 'Fire';
	}
	super(BallisticFire).PlayFiring();
	PD97Bloodhound(BW).ShellFired();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x82
	if(proj != none)
	{
		proj.Instigator = Instigator;
		PD97Rocket(proj).Master = PD97Bloodhound(BW);
		PD97Rocket(proj).LastLoc = PD97Bloodhound(BW).GetRocketTarget();
	}
	//return;	
}

defaultproperties
{
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.PD97.PD97-RocketFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	PreFireAnim="None"
	FireAnimRate=1.1000000
	FireForce="AssaultRifleAltFire"
	FireRate=0.2000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-3.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-70.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.PD97Rocket'
	BotRefireRate=0.7000000
	WarnTargetPct=0.3000000
}
