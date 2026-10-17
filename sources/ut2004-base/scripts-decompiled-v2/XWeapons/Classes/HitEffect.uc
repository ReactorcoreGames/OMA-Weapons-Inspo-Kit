class HitEffect extends Effects;

var() Class<Actor> HitEffectDefault;
var() Class<Actor> HitEffectRock;
var() Class<Actor> HitEffectDirt;
var() Class<Actor> HitEffectMetal;
var() Class<Actor> HitEffectWood;
var() Class<Actor> HitEffectPlant;
var() Class<Actor> HitEffectFlesh;
var() Class<Actor> HitEffectIce;
var() Class<Actor> HitEffectSnow;
var() Class<Actor> HitEffectWater;
var() Class<Actor> HitEffectGlass;

static function Class<Actor> GetHitEffect(Actor Victim, Vector HitLocation, Vector HitNormal)
{
	// End:0x11
	if(Victim == none)
	{
		return default.HitEffectDefault;
	}
	switch(Victim.SurfaceType)
	{
		// End:0x2C
		case 1:
			return default.HitEffectRock;
		// End:0x37
		case 2:
			return default.HitEffectDirt;
		// End:0x42
		case 3:
			return default.HitEffectMetal;
		// End:0x4D
		case 4:
			return default.HitEffectWood;
		// End:0x58
		case 5:
			return default.HitEffectPlant;
		// End:0x63
		case 6:
			return default.HitEffectFlesh;
		// End:0x6E
		case 7:
			return default.HitEffectIce;
		// End:0x79
		case 8:
			return default.HitEffectSnow;
		// End:0x84
		case 9:
			return default.HitEffectWater;
		// End:0x8F
		case 10:
			return default.HitEffectGlass;
		// End:0xFFFF
		default:
			return default.HitEffectDefault;
			break;
	}
	//return;	
}

defaultproperties
{
	HitEffectDefault=Class'XEffects.xHeavyWallHitEffect'
	HitEffectRock=Class'XEffects.xHeavyWallHitEffect'
	HitEffectDirt=Class'XEffects.DirtImpact'
	HitEffectMetal=Class'XEffects.xHeavyWallHitEffect'
	HitEffectWood=Class'XEffects.pclImpactSmoke'
	HitEffectPlant=Class'XEffects.pclImpactSmoke'
	HitEffectFlesh=Class'XEffects.pclredsmoke'
	HitEffectIce=Class'XEffects.xHeavyWallHitEffect'
	HitEffectSnow=Class'XEffects.xHeavyWallHitEffect'
	HitEffectWater=Class'XEffects.xHeavyWallHitEffect'
	HitEffectGlass=Class'XEffects.xHeavyWallHitEffect'
}
