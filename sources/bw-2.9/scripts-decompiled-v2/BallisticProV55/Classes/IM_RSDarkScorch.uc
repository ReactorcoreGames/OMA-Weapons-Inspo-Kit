class IM_RSDarkScorch extends BCImpactManager;

static function EvilStartSpawn(Vector V, Vector Norm, int Surface, Actor OwnedBy, optional float DelayTime)
{
	default.HitDelay = DelayTime;
	StartSpawn(V, Norm, Surface, OwnedBy, 0);
	//return;	
}

defaultproperties
{
	HitDecals[0]=Class'BallisticProV55.AD_RX22AScorch'
	HitSoundVolume=1.0000000
	HitSoundRadius=1024.0000000
	EffectBackOff=96.0000000
}
