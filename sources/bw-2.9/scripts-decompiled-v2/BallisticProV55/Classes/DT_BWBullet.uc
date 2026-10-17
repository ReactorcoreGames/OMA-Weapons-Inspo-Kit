class DT_BWBullet extends BallisticDamageType
	config(BallisticProV55);

static function PlayHitSound(Pawn Victim)
{
	local Class<BallisticBloodSet> bs;

	bs = Class'BallisticProV55.BWBloodSetHunter'.static.GetBloodSetFor(Victim);
	// End:0xA7
	if(bs != none)
	{
		// End:0x6D
		if(default.bHeaddie && bs.default.BulletHitHeadSound != none)
		{
			Victim.PlaySound(bs.default.BulletHitHeadSound,, default.TransientSoundVolume,, default.TransientSoundRadius);			
		}
		else
		{
			// End:0xA7
			if(bs.default.BulletHitSound != none)
			{
				Victim.PlaySound(bs.default.BulletHitSound,, default.TransientSoundVolume,, default.TransientSoundRadius);
			}
		}
	}
	//return;	
}

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
	// End:0x68
	if(xPawn(Victim) != none)
	{
		PlayHitSound(Victim);
		// End:0x68
		if(((default.EffectChance > float(0)) && default.EffectChance > FRand()) && BallisticPawn(Victim) == none)
		{
			DoBloodEffects(HitLocation, Damage, Momentum, Victim, bLowDetail);
		}
	}
	return super(DamageType).GetPawnDamageEffect(HitLocation, Damage, Momentum, Victim, bLowDetail);
	//return;	
}

defaultproperties
{
	EffectChance=1.0000000
	BloodManagerName="BallisticProV55.BloodMan_Bullet"
	bOnlySeverLimbs=true
	bSeverPreventsBlood=true
	bUseMotionBlur=true
	TagMultiplier=0.6000000
	TagDuration=0.1350000
	bMetallic=true
	DamageDescription=",Bullet,"
	bInstantHit=true
	bRagdollBullet=true
	bBulletHit=true
	PawnDamageSounds[0]=SoundGroup'BW_Core_WeaponSound.BulletImpacts.BulletFlesh'
	VehicleDamageScaling=0.3500000
	VehicleMomentumScaling=0.1500000
	TransientSoundVolume=2.0000000
}
