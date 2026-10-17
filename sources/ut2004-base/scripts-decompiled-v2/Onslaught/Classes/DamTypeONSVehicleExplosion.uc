class DamTypeONSVehicleExplosion extends DamageType
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
	DeathString="%k took out %o with a vehicle explosion."
	FemaleSuicide="%o was a little too close to the vehicle she blew up."
	MaleSuicide="%o was a little too close to the vehicle he blew up."
	ThemSuicide="%o was a little too close to the vehicle they blew up."
	bDetonatesGoop=true
	bThrowRagdoll=true
	bFlaming=true
	GibPerterbation=0.1500000
}
