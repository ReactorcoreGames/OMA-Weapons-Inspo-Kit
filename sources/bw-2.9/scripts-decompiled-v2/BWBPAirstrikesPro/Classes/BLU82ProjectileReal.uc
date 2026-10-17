class BLU82ProjectileReal extends BLU82Projectile;

function BeginPlay()
{
	super(Actor).BeginPlay();
	//return;	
}

function Timer()
{
	//return;	
}

state Dying
{
	function BeginState()
	{
		bHidden = true;
		SetPhysics(0);
		SetCollision(false, false, false);
		ShakeView();
		InitialState = 'Dying';
		// End:0x3B
		if(SmokeTrail != none)
		{
			SmokeTrail.Destroy();
		}
		//return;		
	}
Begin:

	PlaySound(Sound'WeaponSounds.Misc.redeemer_explosionsound');
	HurtRadius(Damage, DamageRadius * 0.5000000, MyDamageType, MomentumTransfer, Location);
	Sleep(0.5000000);
	HurtRadius(Damage, DamageRadius, MyDamageType, MomentumTransfer, Location);
	Destroy();
	stop;				
}

defaultproperties
{
	StaticMesh=StaticMesh'VMWeaponsSM.PlayerWeaponsGroup.bomberBomb'
}
