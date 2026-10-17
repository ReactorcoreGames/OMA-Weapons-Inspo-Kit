class BloodMan_Bullet extends BloodManager
	config(BallisticProV55);

static function Class<BallisticBloodSet> GetBloodSet(Pawn Victim)
{
	return Class'BallisticProV55.BWBloodSetHunter'.static.GetBloodSetFor(Victim);
	//return;	
}

static function BloodHitScreenFX(Class<BallisticBloodSet> bs, Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	local PlayerController PC;
	local Actor A;
	local Vector CamLoc;
	local Rotator CamRot;
	local Class<Actor> FXClass;

	PC = Victim.Level.GetLocalPlayerController();
	// End:0xE6
	if(PC != none)
	{
		PC.PlayerCalcView(A, CamLoc, CamRot);
		// End:0xE6
		if((VSize(HitLoc - CamLoc) < float(200)) && (Vector(CamRot) Dot Normal(HitLoc - CamLoc)) > 0.7000000)
		{
			FXClass = GetScreenEffect(bs);
			// End:0xE6
			if((FXClass != none) && BallisticPlayer(PC) != none)
			{
				BallisticPlayer(PC).DrawCanvasScreenBlood(FXClass, PC, CamLoc + (Vector(CamRot) * float(16)), CamRot);
			}
		}
	}
	//return;	
}

static function ExtraBloodHitFX(Class<BallisticBloodSet> bs, Pawn Victim, name Bone, Vector HitLoc, Vector hitRay, int Damage)
{
	// End:0x57
	if((default.bUseScreenFX && !Class'Engine.GameInfo'.static.UseLowGore()) && Damage > (5 + Rand(30)))
	{
		BloodHitScreenFX(bs, Victim, Bone, HitLoc, hitRay, Damage);
	}
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
	ExtraBloodHitFX(bs, Victim, Bone, Victim.GetBoneCoords(Bone).Origin, hitRay, int(Damage));
	// End:0xF8
	if(default.bUseBloodEffects)
	{
		FXClass = bs.static.GetDismemberEffectFor(Victim, Bone);
		// End:0xF8
		if(FXClass != none)
		{
			GoreEffect = BW_HitGoreEmitter(Victim.Spawn(FXClass, Victim,, Victim.GetBoneCoords(Bone).Origin, Victim.Rotation));
			// End:0xF8
			if(GoreEffect != none)
			{
				GoreEffect.InitHitForce(hitRay, GibPerterbation);
			}
		}
	}
	// End:0x160
	if(default.bUseChunks && !Class'Engine.GameInfo'.static.UseLowGore())
	{
		bs.static.MakeGibsFor(Victim, Bone, hitRay, GibPerterbation, FMin(Damage / float(40), 4.0000000), bs.static.GetGibInfoFor(Bone));
	}
	//return;	
}

static function DoSeverStump(Pawn Victim, name Bone, Vector hitRay, float Damage)
{
	local Actor Stump;
	local Class<BallisticBloodSet> bs;
	local Actor Spurty;
	local Class<Emitter> SC;

	// End:0x0D
	if(Victim == none)
	{
		return;
	}
	// End:0x36
	if(xPawn(Victim) != none)
	{
		xPawn(Victim).HideBone(Bone);
	}
	bs = GetBloodSet(Victim);
	// End:0x54
	if(bs == none)
	{
		return;
	}
	// End:0xDC
	if(default.bUseStumps && !Class'Engine.GameInfo'.static.UseLowGore())
	{
		Stump = bs.static.GetStumpFor(Victim, Bone, false);
		// End:0xDC
		if(Stump != none)
		{
			// End:0xDC
			if(BallisticPawn(Victim) != none)
			{
				BallisticPawn(Victim).Stumps[BallisticPawn(Victim).Stumps.Length] = Stump;
			}
		}
	}
	// End:0x104
	if(default.bUseBloodEffects)
	{
		SC = bs.static.GetStumpDripper(Victim, Bone);
	}
	// End:0x1E7
	if(SC != none)
	{
		Spurty = Victim.Spawn(SC, Victim,, Victim.Location, Victim.Rotation);
		// End:0x1E7
		if(Spurty != none)
		{
			// End:0x1A5
			if(Bone == 'pelvis')
			{
				Bone = 'spine';
				Victim.AttachToBone(Spurty, Bone);
				Spurty.SetRelativeRotation(rot(32768, 0, 0));				
			}
			else
			{
				Victim.AttachToBone(Spurty, Bone);
			}
			// End:0x1E7
			if(BallisticPawn(Victim) != none)
			{
				BallisticPawn(Victim).ListGoreEffect(Spurty);
			}
		}
	}
	//return;	
}

