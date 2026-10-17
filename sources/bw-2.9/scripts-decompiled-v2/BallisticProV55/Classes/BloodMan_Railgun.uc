class BloodMan_Railgun extends BloodMan_Bullet
	config(BallisticProV55);

static function DoSeverStump(Pawn Victim, name Bone, Vector hitRay, float Damage)
{
	local Actor t;
	local Vector TraceHit, TraceNorm;
	local Class<BallisticBloodSet> bs;
	local BallisticDecal D;

	super.DoSeverStump(Victim, Bone, hitRay, Damage);
	// End:0x74
	if(((int(Victim.Level.NetMode) == int(NM_DedicatedServer)) || Class'Engine.GameInfo'.static.UseLowGore()) || (Bone != 'spine') && Bone != 'pelvis')
	{
		return;
	}
	bs = GetBloodSet(Victim);
	// End:0x92
	if(bs == none)
	{
		return;
	}
	// End:0x1B2
	if(default.bUseBloodExplodes)
	{
		t = Victim.Trace(TraceHit, TraceNorm, Victim.Location + (hitRay * default.SplatRange), Victim.Location, false);
		// End:0x1B2
		if((t != none) && t.bWorldGeometry)
		{
			Class<BallisticDecal>(bs.default.ExplodeSplat).default.bWaitForInit = true;
			D = BallisticDecal(Victim.Spawn(bs.default.ExplodeSplat,,, TraceHit, Rotator(-TraceNorm)));
			// End:0x193
			if(D != none)
			{
				D.SetDrawScale(D.DrawScale * 0.6000000);
				D.InitDecal();
			}
			Class<BallisticDecal>(bs.default.ExplodeSplat).default.bWaitForInit = false;
		}
	}
	Victim.Spawn(bs.default.ExplodeEffect, Victim,, Victim.Location, Rotator(hitRay));
	//return;	
}

