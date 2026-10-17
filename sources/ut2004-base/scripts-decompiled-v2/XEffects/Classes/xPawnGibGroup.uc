class xPawnGibGroup extends Object
	abstract;

enum EGibType
{
	EGT_Calf,                       // 0
	EGT_Forearm,                    // 1
	EGT_Hand,                       // 2
	EGT_Head,                       // 3
	EGT_Torso,                      // 4
	EGT_Upperarm                    // 5
};

var(Gib) array< Class<Gib> > Gibs;
var Class<xEmitter> BloodHitClass;
var Class<xEmitter> LowGoreBloodHitClass;
var Class<xEmitter> BloodGibClass;
var Class<xEmitter> LowGoreBloodGibClass;
var Class<xEmitter> LowGoreBloodEmitClass;
var Class<xEmitter> BloodEmitClass;
var Class<xEmitter> NoBloodEmitClass;
var Class<xEmitter> NoBloodHitClass;
var Sound GibSounds[3];

static function PrecacheContent(LevelInfo Level)
{
	local int i;

	// End:0xAC
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		// End:0x4C
		if(Class'Engine.GameInfo'.static.NoBlood())
		{
			default.NoBloodEmitClass.static.PrecacheContent(Level);
			default.NoBloodHitClass.static.PrecacheContent(Level);
		}
		// End:0x6B
		if(default.LowGoreBloodHitClass != none)
		{
			default.LowGoreBloodHitClass.static.PrecacheContent(Level);
		}
		// End:0x8A
		if(default.LowGoreBloodGibClass != none)
		{
			default.LowGoreBloodGibClass.static.PrecacheContent(Level);
		}
		// End:0xA9
		if(default.LowGoreBloodEmitClass != none)
		{
			default.LowGoreBloodEmitClass.static.PrecacheContent(Level);
		}		
	}
	else
	{
		// End:0xCB
		if(default.BloodHitClass != none)
		{
			default.BloodHitClass.static.PrecacheContent(Level);
		}
		// End:0xEA
		if(default.BloodGibClass != none)
		{
			default.BloodGibClass.static.PrecacheContent(Level);
		}
		// End:0x109
		if(default.BloodEmitClass != none)
		{
			default.BloodEmitClass.static.PrecacheContent(Level);
		}
		i = 0;
		J0x110:

		// End:0x18D [Loop If]
		if(i < default.Gibs.Length)
		{
			// End:0x160
			if(default.Gibs[i].default.Skins.Length > 0)
			{
				Level.AddPrecacheMaterial(default.Gibs[i].default.Skins[0]);
			}
			Level.AddPrecacheStaticMesh(default.Gibs[i].default.StaticMesh);
			i++;
			// [Loop Continue]
			goto J0x110;
		}
	}
	//return;	
}

static function Class<Gib> GetGibClass(xPawnGibGroup.EGibType gibType)
{
	return default.Gibs[int(gibType)];
	//return;	
}

static function Class<xEmitter> GetBloodEmitClass()
{
	// End:0x30
	if(Class'Engine.GameInfo'.static.UseLowGore())
	{
		// End:0x2A
		if(Class'Engine.GameInfo'.static.NoBlood())
		{
			return default.NoBloodEmitClass;
		}
		return default.LowGoreBloodEmitClass;
	}
	return default.BloodEmitClass;
	//return;	
}

static function Sound GibSound()
{
	return default.GibSounds[Rand(3)];
	//return;	
}

defaultproperties
{
	Gibs[0]=Class'XEffects.GibOrganicRedCalf'
	Gibs[1]=Class'XEffects.GibOrganicRedForearm'
	Gibs[2]=Class'XEffects.GibOrganicRedForearm'
	Gibs[3]=Class'XEffects.GibOrganicRedHead'
	Gibs[4]=Class'XEffects.GibOrganicRedTorso'
	Gibs[5]=Class'XEffects.GibOrganicRedUpperArm'
	BloodHitClass=Class'XEffects.BloodSmallHit'
	LowGoreBloodHitClass=Class'XEffects.AlienSmallHit'
	BloodGibClass=Class'XEffects.BloodExplosion'
	LowGoreBloodGibClass=Class'XEffects.AlienBloodExplosion'
	LowGoreBloodEmitClass=Class'XEffects.AlienBloodJet'
	BloodEmitClass=Class'XEffects.BloodJet'
	NoBloodEmitClass=Class'XEffects.BotSparks'
	NoBloodHitClass=Class'XEffects.FastBotSparks'
	GibSounds[0]=Sound'PlayerSounds.NewGibs.NewGib1'
	GibSounds[1]=Sound'PlayerSounds.NewGibs.NewGib3'
	GibSounds[2]=Sound'PlayerSounds.NewGibs.NewGib4'
}
