class BloodManager extends Effects
	config(BallisticProV55);

var Class<BallisticBloodSet> BloodSet;
var() float SplatRange;
var() float BloodDelay;
var() float DecalChance;
var() float EffectChance;
var() float DripperThreshold;
var() float DripperChance;
var() globalconfig bool bUseBloodSplats;
var() globalconfig bool bUseBloodExplodes;
var() globalconfig bool bUseStumps;
var() globalconfig bool bUseChunks;
var() globalconfig bool bUseBloodEffects;
var() globalconfig bool bUseScreenFX;
var() globalconfig int GibMultiplier;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		BloodSet;
}

simulated function PostNetBeginPlay()
{
	// End:0x1B
	if(BloodDelay >= LifeSpan)
	{
		LifeSpan += BloodDelay;
	}
	super(Actor).PostNetBeginPlay();
	// End:0x45
	if(int(Level.NetMode) == int(NM_Client))
	{
		Initialize(BloodSet);
	}
	//return;	
}

simulated function Initialize(Class<BallisticBloodSet> bs)
{
	BloodSet = bs;
	// End:0x26
	if(BloodDelay > 0.0000000)
	{
		SetTimer(BloodDelay, false);		
	}
	else
	{
		SpawnEffects();
	}
	//return;	
}

simulated event Timer()
{
	SpawnEffects();
	//return;	
}

simulated function bool CanSpawnStuff()
{
	// End:0x21
	if(!bUseBloodSplats || Class'Engine.GameInfo'.static.UseLowGore())
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
	// End:0xB9
	if((default.DecalChance > float(0)) && default.DecalChance > FRand())
	{
		End = Location + (Vector(Rotation) * default.SplatRange);
		t = Trace(HitLoc, HitNorm, End, Location, false);
		// End:0xB9
		if((t != none) && t.bWorldGeometry)
		{
			Spawn(GetWallSplat(BloodSet),,, HitLoc, Rotator(-HitNorm));
		}
	}
	// End:0xEE
	if((default.EffectChance > float(0)) && default.EffectChance > FRand())
	{
		Spawn(GetBloodEffect(BloodSet),,, Location, Rotation);
	}
	//return;	
}

static function StartSpawnBlood(Vector HitLocation, Vector Momentum, Pawn Victim)
{
	local BloodManager BM;

	// End:0x0D
	if(Victim == none)
	{
		return;
	}
	BM = Victim.Spawn(default.Class,,, HitLocation, Rotator(Momentum));
	BM.Initialize(GetBloodSet(Victim));
	//return;	
}

static function Class<Projector> GetWallSplat(Class<BallisticBloodSet> bs, optional name Bone)
{
	return bs.default.BulletSplat;
	//return;	
}

static function Class<Actor> GetBloodEffect(Class<BallisticBloodSet> bs, optional name Bone)
{
	// End:0x1E
	if(Bone == 'head')
	{
		return bs.default.BulletHeadEffect;
	}
	return bs.default.BulletEffect;
	//return;	
}

static function Class<BallisticBloodSet> GetBloodSet(Pawn Victim)
{
	return Class'BCoreProV55.BloodSetHunter'.static.GetBloodSetFor(Victim);
	//return;	
}

static function Class<Actor> GetScreenEffect(Class<BallisticBloodSet> bs)
{
	return bs.default.ScreenEffectMisc;
	//return;	
}

static function ExtraBloodHitFX(Class<BallisticBloodSet> bs, Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	//return;	
}

static function DoBloodHit(Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	local Actor HitFx, t;
	local Vector TraceHit, TraceNorm, BoneDir, BoneLoc;
	local Class<BallisticBloodSet> bs;
	local Class<Projector> DecalClass;

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
	// End:0x133
	if(((default.bUseBloodSplats && !Class'Engine.GameInfo'.static.UseLowGore()) && default.DecalChance > float(0)) && default.DecalChance > FRand())
	{
		DecalClass = GetWallSplat(bs, Bone);
		// End:0x133
		if(DecalClass != none)
		{
			t = Victim.Trace(TraceHit, TraceNorm, HitLoc + (hitRay * default.SplatRange), HitLoc, false);
			// End:0x133
			if((t != none) && t.bWorldGeometry)
			{
				Victim.Spawn(GetWallSplat(bs, Bone),,, TraceHit, Rotator(-TraceNorm));
			}
		}
	}
	ExtraBloodHitFX(bs, Victim, Bone, HitLoc, hitRay, Damage);
	// End:0x164
	if(!default.bUseBloodEffects)
	{
		return;
	}
	// End:0x1B3
	if((default.EffectChance > float(0)) && default.EffectChance > FRand())
	{
		HitFx = Victim.Spawn(GetBloodEffect(bs, Bone), Victim,, HitLoc, Rotator(hitRay));
	}
	// End:0x32D
	if(((((!Class'Engine.GameInfo'.static.UseLowGore() && default.DripperChance > float(0)) && float(Damage) >= default.DripperThreshold) && default.DripperChance > FRand()) && Victim.Health > 0) && bs.default.WoundDripper != none)
	{
		// End:0x23D
		if(Bone == 'pelvis')
		{
			Bone = 'spine';
		}
		BoneLoc = Victim.GetBoneCoords(Bone).Origin;
		BoneDir = BoneLoc - HitLoc;
		BoneDir.Z = 0.0000000;
		// End:0x2D5
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
	//return;	
}

static function DoSeverEffects(Pawn Victim, name Bone, Vector hitRay, float GibPerterbation, float Damage)
{
	//return;	
}

static function DoSeverStump(Pawn Victim, name Bone, Vector hitRay, float Damage)
{
	//return;	
}

defaultproperties
{
	SplatRange=384.0000000
	DecalChance=1.0000000
	EffectChance=1.0000000
	DripperThreshold=10.0000000
	DripperChance=0.5000000
	bUseBloodSplats=true
	bUseBloodExplodes=true
	bUseStumps=true
	bUseChunks=true
	bUseBloodEffects=true
	bUseScreenFX=true
	GibMultiplier=1
	DrawType=0
	RemoteRole=2
	LifeSpan=2.0000000
}
