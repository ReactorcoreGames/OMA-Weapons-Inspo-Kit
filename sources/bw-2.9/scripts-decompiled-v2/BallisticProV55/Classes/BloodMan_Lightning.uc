class BloodMan_Lightning extends BloodMan_Bullet
	config(BallisticProV55);

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
	if((int(Victim.Level.NetMode) == int(NM_DedicatedServer)) || Class'Engine.GameInfo'.static.NoBlood())
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
	// End:0x166
	if(((default.bUseBloodSplats && !Class'Engine.GameInfo'.static.UseLowGore()) && default.DecalChance > float(0)) && default.DecalChance > FRand())
	{
		t = Victim.Trace(TraceHit, TraceNorm, HitLoc + (hitRay * default.SplatRange), HitLoc, false);
		// End:0x166
		if((t != none) && t.bWorldGeometry)
		{
			DecalRot = Rotator(-TraceNorm);
			DecalRot.Roll = Rand(65536);
			Victim.Spawn(GetWallSplat(bs),,, TraceHit, DecalRot);
		}
	}
	// End:0x1BB
	if((default.bUseBloodEffects && default.EffectChance > float(0)) && default.EffectChance > FRand())
	{
		HitFx = Victim.Spawn(GetBloodEffect(bs), Victim,, HitLoc, Rotator(hitRay));
	}
	//return;	
}

static function DoSeverEffects(Pawn Victim, name Bone, Vector hitRay, float GibPerterbation, float Damage)
{
	local Class<BallisticBloodSet> bs;

	bs = GetBloodSet(Victim);
	// End:0x1E
	if(bs == none)
	{
		return;
	}
	// End:0x3F
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

defaultproperties
{
	DecalChance=0.5000000
}
