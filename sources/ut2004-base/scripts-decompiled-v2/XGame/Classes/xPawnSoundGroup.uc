class xPawnSoundGroup extends Object
	abstract;

enum ESoundType
{
	EST_Land,                       // 0
	EST_CorpseLanded,               // 1
	EST_HitUnderWater,              // 2
	EST_Jump,                       // 3
	EST_LandGrunt,                  // 4
	EST_Gasp,                       // 5
	EST_Drown,                      // 6
	EST_BreatheAgain,               // 7
	EST_Dodge,                      // 8
	EST_DoubleJump                  // 9
};

var() array<Sound> Sounds;
var() array<Sound> DeathSounds;
var() array<Sound> PainSounds;

static function Sound GetHitSound()
{
	return default.PainSounds[Rand(default.PainSounds.Length)];
	//return;	
}

static function Sound GetDeathSound()
{
	return default.DeathSounds[Rand(default.DeathSounds.Length)];
	//return;	
}

static function Sound GetSound(xPawnSoundGroup.ESoundType soundType)
{
	return default.Sounds[int(soundType)];
	//return;	
}

defaultproperties
{
	Sounds[0]=SoundGroup'PlayerSounds.Final.Land'
	Sounds[1]=SoundGroup'PlayerSounds.Final.CorpseLanded'
}
