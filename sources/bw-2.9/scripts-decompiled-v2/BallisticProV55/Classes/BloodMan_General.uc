class BloodMan_General extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.BluntEffect;
	//return;	
}

