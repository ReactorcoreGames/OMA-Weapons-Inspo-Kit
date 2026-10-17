class BloodMan_ShotgunShell extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Projector> GetWallSplat(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.ShotgunSplat;
	//return;	
}

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.ShotgunEffect;
	//return;	
}

static function ExtraBloodHitFX(Class<BallisticBloodSet> bs, Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	// End:0x51
	if((default.bUseScreenFX && !Class'Engine.GameInfo'.static.UseLowGore()) && FRand() < 0.2500000)
	{
		BloodHitScreenFX(bs, Victim, Bone, HitLoc, hitRay, Damage);
	}
	//return;	
}

defaultproperties
{
	DecalChance=0.3000000
}
