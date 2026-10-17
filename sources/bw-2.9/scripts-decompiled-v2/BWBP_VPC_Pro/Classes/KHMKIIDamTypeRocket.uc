class KHMKIIDamTypeRocket extends BE_DT_Manager
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
	DeathStrings[0]="%o got caught in %k's underTOW."
	DeathStrings[1]="%o's limp body got TOWed away by %k."
	DeathStrings[2]="%o with his foot fetish mistook %k's TOW for a toe."
	DeathStrings[3]="%o was splattered like so many spanish tomatos by %k's TOW Missiles."
	FemaleSuicides[0]="%o stuck her ugly face infront of her own TOW Missiles."
	FemaleSuicides[1]="%o was inspecting the integrity of her TOW Missiles with her obscene face."
	FemaleSuicides[2]="%o got carried away with the little red button that launches TOW Missiles."
	FemaleSuicides[3]="%o proved why children shouldn't play with loaded Cobras."
	MaleSuicides[0]="%o stuck his ugly face infront of his own TOW Missiles."
	MaleSuicides[1]="%o was inspecting the integrity of his TOW Missiles with his obscene face."
	MaleSuicides[2]="%o got carried away with the little red button that launches TOW Missiles."
	MaleSuicides[3]="%o proved why children shouldn't play with loaded Cobras."
	WeaponClass=Class'XWeapons.RocketLauncher'
	bDelayedDamage=true
	bThrowRagdoll=true
	bFlaming=true
	GibPerterbation=0.1500000
	KDamageImpulse=20000.0000000
	VehicleMomentumScaling=1.3000000
}
