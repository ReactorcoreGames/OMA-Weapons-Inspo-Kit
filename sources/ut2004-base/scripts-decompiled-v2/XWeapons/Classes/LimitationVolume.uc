class LimitationVolume extends Volume;

var(Limits) bool bLimitTransDisc;
var(Limits) bool bLimitProjectiles;
var(Limits) Class<Actor> LimitEffectClass;

event Touch(Actor Other)
{
	// End:0x8B
	if((bLimitTransDisc && TransBeacon(Other) != none) || bLimitProjectiles && Projectile(Other) != none)
	{
		// End:0x69
		if(LimitEffectClass != none)
		{
			Spawn(LimitEffectClass,,, Other.Location, Other.Rotation);
		}
		Projectile(Other).bNoFX = true;
		Other.Destroy();
	}
	//return;	
}

