class PD97SecondaryTracerFire extends BallisticProProjectileFire;

var PD97TrackerProj ActiveProj;

function PlayFiring()
{
	// End:0x3D
	if((BW.MagAmmo - ConsumedLoad) < 1)
	{
		FireAnim = 'OpenTazerFire';
		BW.IdleAnim = 'OpenTazerIdle';		
	}
	else
	{
		FireAnim = 'TazerFire';
		BW.IdleAnim = 'TazerIdle';
	}
	super(BallisticFire).PlayFiring();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x6A
	if(proj != none)
	{
		proj.Instigator = Instigator;
		PD97TrackerProj(proj).Master = PD97Bloodhound(BW);
		ActiveProj = PD97TrackerProj(proj);
	}
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x82
	if(int(BW.Role) == int(ROLE_Authority))
	{
		// End:0x3D
		if(ActiveProj != none)
		{
			ActiveProj.Destroy();
		}
		// End:0x82
		if((PD97Bloodhound(BW) != none) && PD97Bloodhound(BW).ActiveBeacon != none)
		{
			PD97Bloodhound(BW).ActiveBeacon.Destroy();
		}
	}
	// End:0x102
	if(PD97Bloodhound(BW) != none)
	{
		// End:0xD3
		if(FireAnim == 'OpenTazerFire')
		{
			PD97Bloodhound(BW).IdleAnim = 'OpenIdle';
			PD97Bloodhound(BW).PlayAnim('OpenTazerEnd');			
		}
		else
		{
			PD97Bloodhound(BW).IdleAnim = 'Idle';
			PD97Bloodhound(BW).PlayAnim('TazerEnd');
		}
	}
	super.ModeDoFire();
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=15.0000000,Y=10.0000000,Z=-9.0000000)
	FlashBone="Tazer"
	bUseWeaponMag=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Tazer.BloodhoundTazerFire',Volume=2.2500000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	PreFireAnim="None"
	FireAnim="TazerFire"
	FireForce="AssaultRifleAltFire"
	FireRate=0.9000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_BloodhoundDarts'
	AmmoPerFire=0
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.PD97TrackerProj'
	BotRefireRate=0.3000000
	WarnTargetPct=0.3000000
}
