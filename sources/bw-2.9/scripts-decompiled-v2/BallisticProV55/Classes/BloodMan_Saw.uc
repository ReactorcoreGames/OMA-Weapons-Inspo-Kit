class BloodMan_Saw extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	// End:0x34
	if((Bone == 'head') && bs.default.SawHeadEffect != none)
	{
		return bs.default.SawHeadEffect;
	}
	return bs.default.SawEffect;
	//return;	
}

static function Class<Projector> GetWallSplat(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.SawSplat;
	//return;	
}

static function Class<Actor> GetScreenEffect(Class<BallisticBloodSet> bs)
{
	return bs.default.ScreenEffectSaw;
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

static function DoBloodHit(Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	local Actor HitFx, t;
	local Vector TraceHit, TraceNorm;
	local Class<BallisticBloodSet> bs;
	local Rotator DecalRot;

	// End:0x38
	if((int(Victim.Level.NetMode) == int(NM_DedicatedServer)) || Class'Engine.GameInfo'.static.UseLowGore())
	{
		return;
	}
	bs = GetBloodSet(Victim);
	// End:0x56
	if(bs == none)
	{
		return;
	}
	hitRay = Normal(hitRay + (VRand() * 0.7000000));
	ExtraBloodHitFX(bs, Victim, Bone, HitLoc, hitRay, Damage);
	// End:0x150
	if((default.bUseBloodSplats && default.DecalChance > float(0)) && default.DecalChance > FRand())
	{
		t = Victim.Trace(TraceHit, TraceNorm, HitLoc + (hitRay * default.SplatRange), HitLoc, false);
		// End:0x150
		if((t != none) && t.bWorldGeometry)
		{
			DecalRot = Rotator(-TraceNorm);
			DecalRot.Roll = Rand(65536);
			Victim.Spawn(GetWallSplat(bs),,, TraceHit, DecalRot);
		}
	}
	// End:0x1A5
	if((default.bUseBloodEffects && default.EffectChance > float(0)) && default.EffectChance > FRand())
	{
		HitFx = Victim.Spawn(GetBloodEffect(bs), Victim,, HitLoc, Rotator(hitRay));
	}
	//return;	
}

defaultproperties
{
	DecalChance=0.4000000
}
