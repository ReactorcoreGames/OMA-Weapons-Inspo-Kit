class xJuggMaleSoundGroup extends xPawnSoundGroup;

static function Sound GetHitSound()
{
	// End:0x12
	if(FRand() < 0.0100000)
	{
		return Sound'NewDeath.MaleJugg.mj_hit15';
	}
	return default.PainSounds[Rand(default.PainSounds.Length)];
	//return;	
}

defaultproperties
{
	Sounds[0]=SoundGroup'PlayerSounds.Final.Land'
	Sounds[1]=SoundGroup'PlayerSounds.Final.CorpseLanded'
	Sounds[2]=SoundGroup'PlayerSounds.Final.HitUnderWaterJuggMale'
	Sounds[3]=Sound'PlayerSounds.JumpSounds.MaleJump1'
	Sounds[4]=SoundGroup'PlayerSounds.Final.LandGruntJuggMale'
	Sounds[5]=SoundGroup'PlayerSounds.Final.GaspJuggMale'
	Sounds[6]=SoundGroup'PlayerSounds2.Final.Drowning'
	Sounds[7]=SoundGroup'PlayerSounds.Final.BreathAgainJuggMale'
	Sounds[8]=Sound'PlayerSounds.JumpSounds.MaleDodge'
	Sounds[9]=Sound'PlayerSounds.JumpSounds.MaleJump2'
	DeathSounds[0]=Sound'NewDeath.MaleJugg.mj_death01'
	DeathSounds[1]=Sound'NewDeath.MaleJugg.mj_death05'
	DeathSounds[2]=Sound'NewDeath.MaleJugg.mj_death07'
	DeathSounds[3]=Sound'NewDeath.MaleJugg.mj_death08'
	DeathSounds[4]=Sound'NewDeath.MaleJugg.mj_death11'
	PainSounds[0]=Sound'NewDeath.MaleJugg.mj_hit01'
	PainSounds[1]=Sound'NewDeath.MaleJugg.mj_hit02'
	PainSounds[2]=Sound'NewDeath.MaleJugg.mj_hit06'
	PainSounds[3]=Sound'NewDeath.MaleJugg.mj_hit07'
	PainSounds[4]=Sound'NewDeath.MaleJugg.mj_hit11'
	PainSounds[5]=Sound'NewDeath.MaleJugg.mj_hit13'
}
