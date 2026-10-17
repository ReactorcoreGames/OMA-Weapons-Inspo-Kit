class BWBloodSetHunter extends BloodSetHunter;

static function Class<BallisticBloodSet> GetBloodSetFor(Pawn Victim)
{
	// End:0x3F
	if((BallisticPawn(Victim) != none) && BallisticPawn(Victim).BloodSet != none)
	{
		return BallisticPawn(Victim).BloodSet;
	}
	return super.GetBloodSetFor(Victim);
	//return;	
}

static function Class<BallisticBloodSet> PickBloodSet(Pawn Victim, out int Weight)
{
	// End:0x47
	if((BallisticPawn(Victim) != none) && BallisticPawn(Victim).BloodSet != none)
	{
		Weight = 10;
		return BallisticPawn(Victim).BloodSet;
	}
	// End:0x54
	if(Weight > 1)
	{
		return none;
	}
	Weight = 1;
	// End:0x17A
	if(Victim != none)
	{
		// End:0x139
		if(xPawn(Victim) != none)
		{
			// End:0xAF
			if((xPawn(Victim) != none) && Class<xAlienGibGroup>(xPawn(Victim).GibGroupClass) != none)
			{
				return Class'BallisticProV55.BloodSetGreen';				
			}
			else
			{
				// End:0xE8
				if((xPawn(Victim) != none) && Class<xBotGibGroup>(xPawn(Victim).GibGroupClass) != none)
				{
					return Class'BallisticProV55.BloodSetPurple';					
				}
				else
				{
					// End:0x121
					if((xPawn(Victim) != none) && Class<SPECIES_Jugg>(xPawn(Victim).Species) != none)
					{
						return Class'BallisticProV55.BloodSet_Jugg';						
					}
					else
					{
						// End:0x139
						if(Victim.bIsFemale)
						{
							return Class'BallisticProV55.BloodSet_DefaultFemale';
						}
					}
				}
			}
		}
		// End:0x17A
		if((Victim.PlayerReplicationInfo != none) && Victim.PlayerReplicationInfo.CharacterName == "Abaddon")
		{
			return Class'BallisticProV55.BloodSet_Abaddon';
		}
	}
	return Class'BallisticProV55.BloodSetDefault';
	//return;	
}

