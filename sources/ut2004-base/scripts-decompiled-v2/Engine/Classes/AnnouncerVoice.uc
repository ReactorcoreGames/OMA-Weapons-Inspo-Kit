class AnnouncerVoice extends Info
	abstract
	native
	notplaceable
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

struct CachedSound
{
	var name CacheName;
	var Sound CacheSound;
};

var cache string SoundPackage;
var cache string FallbackSoundPackage;
var string AlternateFallbackSoundPackage;
var localized cache string AnnouncerName;
var array<CachedSound> CachedSounds;
var bool bPrecachedBaseSounds;
var bool bPrecachedGameSounds;
var const cache bool bEnglishOnly;

function Sound GetSound(name AName)
{
	local Sound NewSound;
	local int i;

	i = 0;
	J0x07:

	// End:0x4C [Loop If]
	if(i < CachedSounds.Length)
	{
		// End:0x42
		if(AName == CachedSounds[i].CacheName)
		{
			return CachedSounds[i].CacheSound;
		}
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	NewSound = Sound(DynamicLoadObject((SoundPackage $ ".") $ string(AName), Class'Engine.Sound', true));
	// End:0x92
	if(NewSound == none)
	{
		NewSound = PrecacheSound(AName);
	}
	return NewSound;
	//return;	
}

function Sound PrecacheSound(name AName)
{
	local Sound NewSound;

	NewSound = Sound(DynamicLoadObject((SoundPackage $ ".") $ string(AName), Class'Engine.Sound', true));
	// End:0x59
	if((NewSound == none) && FallbackSoundPackage != "")
	{
		NewSound = PrecacheFallbackPackage(FallbackSoundPackage, AName);
	}
	// End:0x88
	if((NewSound == none) && AlternateFallbackSoundPackage != "")
	{
		NewSound = PrecacheFallbackPackage(AlternateFallbackSoundPackage, AName);
	}
	// End:0xFD
	if(NewSound == none)
	{
		Warn((((((("Could not find " $ string(AName)) $ " in ") $ SoundPackage) $ " nor in fallback package ") $ FallbackSoundPackage) $ "nor in Alternate") $ AlternateFallbackSoundPackage);
	}
	return NewSound;
	//return;	
}

function Sound PrecacheFallbackPackage(string Package, name AName)
{
	local Sound NewSound;
	local int i;

	NewSound = Sound(DynamicLoadObject((Package $ ".") $ string(AName), Class'Engine.Sound', true));
	// End:0xD6
	if(NewSound != none)
	{
		i = 0;
		J0x3C:

		// End:0x8C [Loop If]
		if(i < CachedSounds.Length)
		{
			// End:0x82
			if(CachedSounds[i].CacheName == AName)
			{
				CachedSounds[i].CacheSound = NewSound;
				return NewSound;
			}
			i++;
			// [Loop Continue]
			goto J0x3C;
		}
		CachedSounds.Length = CachedSounds.Length + 1;
		CachedSounds[CachedSounds.Length - 1].CacheName = AName;
		CachedSounds[CachedSounds.Length - 1].CacheSound = NewSound;
		return NewSound;
	}
	return none;
	//return;	
}

function PrecacheAnnouncements(bool bRewardSounds)
{
	local Class<GameInfo> GameClass;
	local Actor A;

	// End:0x49
	if(!bPrecachedGameSounds)
	{
		GameClass = Level.GetGameClass();
		// End:0x49
		if(GameClass != none)
		{
			GameClass.static.PrecacheGameAnnouncements(self, bRewardSounds);
			bPrecachedGameSounds = true;
		}
	}
	// End:0x70
	foreach DynamicActors(Class'Engine.Actor', A)
	{
		A.PrecacheAnnouncer(self, bRewardSounds);		
	}	
	// End:0x211
	if(!bPrecachedBaseSounds)
	{
		bPrecachedBaseSounds = true;
		// End:0x1A3
		if(bRewardSounds)
		{
			PrecacheSound('Headshot');
			PrecacheSound('Headhunter');
			PrecacheSound('Berzerk');
			PrecacheSound('Booster');
			PrecacheSound('FlackMonkey');
			PrecacheSound('Combowhore');
			PrecacheSound('Invisible');
			PrecacheSound('Speed');
			PrecacheSound('Camouflaged');
			PrecacheSound('Pint_sized');
			PrecacheSound('first_blood');
			PrecacheSound('adrenalin');
			PrecacheSound('Double_Kill');
			PrecacheSound('MultiKill');
			PrecacheSound('MegaKill');
			PrecacheSound('UltraKill');
			PrecacheSound('MonsterKill_F');
			PrecacheSound('LudicrousKill_F');
			PrecacheSound('HolyShit_F');
			PrecacheSound('Killing_Spree');
			PrecacheSound('Rampage');
			PrecacheSound('Dominating');
			PrecacheSound('Unstoppable');
			PrecacheSound('GodLike');
			PrecacheSound('WhickedSick');			
		}
		else
		{
			PrecacheSound('one');
			PrecacheSound('two');
			PrecacheSound('three');
			PrecacheSound('four');
			PrecacheSound('five');
			PrecacheSound('six');
			PrecacheSound('seven');
			PrecacheSound('eight');
			PrecacheSound('nine');
			PrecacheSound('ten');
		}
	}
	//return;	
}

defaultproperties
{
	AlternateFallbackSoundPackage="AnnouncerAssault"
}
