class MutUseLightning extends Mutator
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
		if(xWeaponBase(Other).WeaponType == Class'UTClassic.ClassicSniperRifle')
		{
			xWeaponBase(Other).WeaponType = Class'XWeapons.SniperRifle';
		}		
	}
	else
	{
		// End:0x8B
		if(ClassicSniperRiflePickup(Other) != none)
		{
			ReplaceWith(Other, "XWeapons.SniperRiflePickup");			
		}
		else
		{
			// End:0xC4
			if(ClassicSniperAmmoPickup(Other) != none)
			{
				ReplaceWith(Other, "XWeapons.SniperAmmoPickup");				
			}
			else
			{
				// End:0x155
				if(WeaponLocker(Other) != none)
				{
					L = WeaponLocker(Other);
					i = 0;
					J0xEB:

					// End:0x150 [Loop If]
					if(i < L.Weapons.Length)
					{
						// End:0x146
						if(L.Weapons[i].WeaponClass == Class'UTClassic.ClassicSniperRifle')
						{
							L.Weapons[i].WeaponClass = Class'XWeapons.SniperRifle';
						}
						i++;
						// [Loop Continue]
						goto J0xEB;
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
	FriendlyName="Lightning Guns"
	Description="Replace all sniper rifles with lightning guns."
}
