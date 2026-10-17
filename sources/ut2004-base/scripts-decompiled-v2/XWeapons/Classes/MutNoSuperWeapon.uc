class MutNoSuperWeapon extends Mutator
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	bSuperRelevant = 0;
	// End:0x8F
	if(xWeaponBase(Other) != none)
	{
		// End:0x51
		if(xWeaponBase(Other).WeaponType == Class'XWeapons.Painter')
		{
			xWeaponBase(Other).WeaponType = Class'XWeapons.SniperRifle';			
		}
		else
		{
			// End:0x8A
			if(xWeaponBase(Other).WeaponType == Class'XWeapons.Redeemer')
			{
				xWeaponBase(Other).WeaponType = Class'XWeapons.RocketLauncher';				
			}
			else
			{
				return true;
			}
		}		
	}
	else
	{
		// End:0x156
		if(WeaponPickup(Other) != none)
		{
			// End:0xF6
			if(string(Other.Class) == "xWeapons.PainterPickup")
			{
				ReplaceWith(Other, "xWeapons.SniperRiflePickup");				
			}
			else
			{
				// End:0x151
				if(string(Other.Class) == "xWeapons.RedeemerPickup")
				{
					ReplaceWith(Other, "xWeapons.RocketLauncherPickup");					
				}
				else
				{
					return true;
				}
			}			
		}
		else
		{
			return true;
		}
	}
	return false;
	//return;	
}

defaultproperties
{
	GroupName="SuperWeapon"
	FriendlyName="No SuperWeapons"
	Description="SuperWeapon pickups are removed from the map."
}
