class BloodMan_Blunt extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.BluntEffect;
	//return;	
}

static function Class<Projector> GetWallSplat(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.ShotgunSplat;
	//return;	
}

defaultproperties
{
	SplatRange=200.0000000
	DripperThreshold=20.0000000
}
