class BloodMan_MAGSAW extends BloodMan_Bullet
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
	local Vector TraceHit, TraceNorm, BoneLoc, BoneDir;
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
	ExtraBloodHitFX(bs, Victim, Bone, HitLoc, hitRay, Damage);
	// End:0xEA
	if((default.bUseBloodEffects && default.EffectChance > float(0)) && default.EffectChance > FRand())
	{
		// End:0xEA
		if((GetBloodEffect(bs, Bone)) != none)
		{
			HitFx = Victim.Spawn(GetBloodEffect(bs, Bone), Victim,, HitLoc, Rotator(hitRay));
		}
	}
	// End:0xFE
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		return;
	}
	// End:0x262
	if(((((default.DripperChance > float(0)) && float(Damage) >= default.DripperThreshold) && default.DripperChance > FRand()) && Victim.Health > 0) && bs.default.WoundDripper != none)
	{
		// End:0x172
		if(Bone == 'pelvis')
		{
			Bone = 'spine';
		}
		BoneLoc = Victim.GetBoneCoords(Bone).Origin;
		BoneDir = BoneLoc - HitLoc;
		BoneDir.Z = 0.0000000;
		// End:0x20A
		if(Bone == 'head')
		{
			HitLoc = ((vect(0.0000000, 0.0000000, 1.0000000) * HitLoc.Z) + (BoneLoc * vect(1.0000000, 1.0000000, 0.0000000))) - (Normal(BoneDir) * float(6));			
		}
		else
		{
			HitLoc += (BoneDir * 0.4000000);
		}
		HitFx = Victim.Spawn(bs.default.WoundDripper, Victim,, HitLoc, Rotator(-hitRay));
		HitFx.SetBase(Victim);
	}
	// End:0x353
	if(((default.bUseBloodSplats && default.DecalChance > float(0)) && default.DecalChance > FRand()) && (GetWallSplat(bs)) != none)
	{
		hitRay = hitRay >> rot(6000, 6000, 0);
		DecalRot = Rotator(hitRay);
		DecalRot.Roll = -8192 + Rand(16384);
		t = Victim.Trace(TraceHit, TraceNorm, HitLoc + (hitRay * default.SplatRange), HitLoc, false);
		// End:0x353
		if((t != none) && t.bWorldGeometry)
		{
			Victim.Spawn(GetWallSplat(bs),,, TraceHit, DecalRot);
		}
	}
	//return;	
}

defaultproperties
{
	DecalChance=0.6000000
	EffectChance=0.6000000
	DripperThreshold=8.0000000
	DripperChance=0.8000000
}
