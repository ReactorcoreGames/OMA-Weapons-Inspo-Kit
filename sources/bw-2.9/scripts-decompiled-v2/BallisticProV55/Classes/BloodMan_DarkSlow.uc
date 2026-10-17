class BloodMan_DarkSlow extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.BluntEffect;
	//return;	
}

static function DoSeverEffects(Pawn Victim, name Bone, Vector hitRay, float GibPerterbation, float Damage)
{
	local BW_HitGoreEmitter GoreEffect;
	local Class<Emitter> FXClass;
	local Class<BallisticBloodSet> bs;

	bs = GetBloodSet(Victim);
	// End:0x1E
	if(bs == none)
	{
		return;
	}
	// End:0xBE
	if(default.bUseBloodEffects)
	{
		FXClass = bs.static.GetDismemberEffectFor(Victim, Bone);
		// End:0xBE
		if(FXClass != none)
		{
			GoreEffect = BW_HitGoreEmitter(Victim.Spawn(FXClass, Victim,, Victim.GetBoneCoords(Bone).Origin, Victim.Rotation));
			// End:0xBE
			if(GoreEffect != none)
			{
				GoreEffect.InitHitForce(hitRay, GibPerterbation);
			}
		}
	}
	// End:0xDF
	if(!default.bUseChunks || Class'Engine.GameInfo'.static.UseLowGore())
	{
		return;
	}
	bs.static.MakeGibsFor(Victim, Bone, hitRay, GibPerterbation, FMin(Damage / float(40), 4.0000000), bs.static.GetGibInfoFor(Bone), true);
	//return;	
}

static function DoSeverStump(Pawn Victim, name Bone, Vector hitRay, float Damage)
{
	local Actor Stump;
	local Class<BallisticBloodSet> bs;
	local Emitter Fire;

	// End:0x0D
	if(Victim == none)
	{
		return;
	}
	bs = GetBloodSet(Victim);
	// End:0x2B
	if(bs == none)
	{
		return;
	}
	// End:0x54
	if(xPawn(Victim) != none)
	{
		xPawn(Victim).HideBone(Bone);
	}
	Stump = bs.static.GetStumpFor(Victim, Bone, true);
	// End:0xBF
	if((Stump != none) && BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).Stumps[BallisticPawn(Victim).Stumps.Length] = Stump;
	}
	Fire = Victim.Spawn(Class'BallisticProV55.BG_StumpFire', Victim,, Victim.Location);
	// End:0x104
	if(Bone == 'pelvis')
	{
		Bone = 'spine';
	}
	Victim.AttachToBone(Fire, Bone);
	//return;	
}

