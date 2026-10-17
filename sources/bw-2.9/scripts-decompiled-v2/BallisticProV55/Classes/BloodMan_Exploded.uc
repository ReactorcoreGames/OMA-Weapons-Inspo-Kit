class BloodMan_Exploded extends BloodMan_Bullet
	config(BallisticProV55);

static function Class<Projector> GetWallSplat(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.ExplodeSplat;
	//return;	
}

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.ExplodeEffect;
	//return;	
}

simulated function bool CanSpawnStuff()
{
	// End:0x21
	if(!bUseBloodExplodes || Class'Engine.GameInfo'.static.UseLowGore())
	{
		return false;
	}
	return true;
	//return;	
}

simulated function SpawnEffects()
{
	local Actor t;
	local Vector HitLoc, HitNorm, End;

	// End:0x28
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || !CanSpawnStuff())
	{
		return;
	}
	End = Location + (Vector(Rotation) * default.SplatRange);
	t = Trace(HitLoc, HitNorm, End, Location, false);
	// End:0x9E
	if((t != none) && t.bWorldGeometry)
	{
		Spawn(GetWallSplat(BloodSet),,, HitLoc, Rotator(-HitNorm));
	}
	t = Trace(HitLoc, HitNorm, Location - (vect(0.0000000, 0.0000000, 1.0000000) * default.SplatRange), Location, false);
	// End:0x113
	if((t != none) && t.bWorldGeometry)
	{
		Spawn(GetWallSplat(BloodSet),,, HitLoc, rot(-16384, 0, 0));
	}
	Spawn(GetBloodEffect(BloodSet),,, Location, Rotation);
	//return;	
}

static function DoBloodHit(Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	//return;	
}

static function DoSeverStump(Pawn Victim, name Bone, Vector hitRay, float Damage)
{
	local Actor t;
	local Vector TraceHit, TraceNorm;
	local Class<BallisticBloodSet> bs;

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
	// End:0x1C1
	if(default.bUseBloodExplodes)
	{
		t = Victim.Trace(TraceHit, TraceNorm, Victim.Location + (hitRay * default.SplatRange), Victim.Location, false);
		// End:0x128
		if((t != none) && t.bWorldGeometry)
		{
			Victim.Spawn(GetWallSplat(bs),,, TraceHit, Rotator(-TraceNorm));
		}
		t = Victim.Trace(TraceHit, TraceNorm, Victim.Location - (vect(0.0000000, 0.0000000, 1.0000000) * default.SplatRange), Victim.Location, false);
		// End:0x1C1
		if((t != none) && t.bWorldGeometry)
		{
			Victim.Spawn(GetWallSplat(bs),,, TraceHit, rot(-16384, 0, 0));
		}
	}
	// End:0x1FC
	if(default.bUseBloodEffects)
	{
		Victim.Spawn(GetBloodEffect(bs), Victim,, Victim.Location, Rotator(hitRay));
	}
	//return;	
}

defaultproperties
{
	SplatRange=400.0000000
}
