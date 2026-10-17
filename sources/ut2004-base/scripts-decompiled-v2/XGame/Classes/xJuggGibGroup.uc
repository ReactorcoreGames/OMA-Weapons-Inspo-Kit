class xJuggGibGroup extends xPawnGibGroup;

static function Class<xEmitter> GetBloodEmitClass()
{
	// End:0x12
	if(FRand() < 0.4000000)
	{
		return Class'XEffects.BotSparks';
	}
	// End:0x42
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		// End:0x3C
		if(Class'Engine.GameInfo'.static.NoBlood())
		{
			return default.NoBloodEmitClass;
		}
		return default.LowGoreBloodEmitClass;
	}
	return default.BloodEmitClass;
	//return;	
}

