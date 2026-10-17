class MutUseSniper extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local int i;
	local WeaponLocker L;

	bSuperRelevant = 0;
	// End:0x51
	if(xWeaponBase(Other) != none)
	{
		// End:0x4E
		if(xWeaponBase(Other).WeaponType == Class'XWeapons.SniperRifle')
		{
			xWeaponBase(Other).WeaponType = Class'UTClassic.ClassicSniperRifle';
		}		
	}
	else
	{
		// End:0x93
		if(SniperRiflePickup(Other) != none)
		{
			ReplaceWith(Other, "UTClassic.ClassicSniperRiflePickup");			
		}
		else
		{
			// End:0xD4
			if(SniperAmmoPickup(Other) != none)
			{
				ReplaceWith(Other, "UTClassic.ClassicSniperAmmoPickup");				
			}
			else
			{
				// End:0x165
				if(WeaponLocker(Other) != none)
				{
					L = WeaponLocker(Other);
					i = 0;
					J0xFB:

					// End:0x160 [Loop If]
					if(i < L.Weapons.Length)
					{
						// End:0x156
						if(L.Weapons[i].WeaponClass == Class'XWeapons.SniperRifle')
						{
							L.Weapons[i].WeaponClass = Class'UTClassic.ClassicSniperRifle';
						}
						i++;
						// [Loop Continue]
						goto J0xFB;
					}
					return true;					
				}
				else
				{
					return true;
				}
			}
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	GroupName="Arena"
	FriendlyName="Sniper Rifles"
	Description="Replace all lightning guns with sniper rifles."
}
