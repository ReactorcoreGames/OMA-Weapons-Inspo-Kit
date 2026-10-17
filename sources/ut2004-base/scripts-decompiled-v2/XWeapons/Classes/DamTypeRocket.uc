class DamTypeRocket extends WeaponDamageType
	abstract;

static function GetHitEffects(out Class<xEmitter> HitEffects[4], int VictimHealth)
{
	HitEffects[0] = Class'XEffects.HitSmoke';
	// End:0x28
	if(VictimHealth <= 0)
	{
		HitEffects[1] = Class'XEffects.HitFlameBig';		
	}
	else
	{
		// End:0x41
		if(FRand() < 0.8000000)
		{
			HitEffects[1] = Class'XEffects.HitFlame';
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'XWeapons.RocketLauncher'
	DeathString="%o rode %k's rocket into oblivion."
	FemaleSuicide="%o fired her rocket prematurely."
	MaleSuicide="%o fired his rocket prematurely."
	ThemSuicide="%o fired their rocket prematurely."
	bDetonatesGoop=true
	bDelayedDamage=true
	bThrowRagdoll=true
	bFlaming=true
	GibPerterbation=0.1500000
	KDamageImpulse=20000.0000000
	VehicleMomentumScaling=1.3000000
}
