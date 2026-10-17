class Mut_Pickups extends Mutator
	config(BallisticProV55)
	hidedropdown
	cacheexempt
	hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var globalconfig bool bRemoveAmmoPacks;
var globalconfig bool bRemoveUDamage;
var globalconfig bool bRemoveShieldPack;
var globalconfig bool bRemoveSuperShieldPack;
var globalconfig bool bRemoveBandages;
var globalconfig bool bRemoveHealthPack;
var globalconfig bool bRemoveSuperHealthPack;
var globalconfig bool bRemoveAdrenaline;
var globalconfig bool bAnimatedPickups;

simulated function bool CheckReplacement(Actor Other, out byte bSuperRelevant)
{
	local bool bRes;

	bRes = super.CheckReplacement(Other, bSuperRelevant);
	// End:0x41
	if(bRemoveAmmoPacks && Other.IsA('IP_AmmoPack'))
	{
		bRes = false;		
	}
	else
	{
		// End:0x81
		if(bRemoveBandages && Other.IsA('IP_Bandage') || Other.IsA('MiniHealthPack'))
		{
			bRes = false;			
		}
		else
		{
			// End:0xC1
			if(bRemoveSuperShieldPack && Other.IsA('IP_BigArmor') || Other.IsA('SuperShieldPack'))
			{
				bRes = false;				
			}
			else
			{
				// End:0x101
				if(bRemoveShieldPack && Other.IsA('IP_SmallArmor') || Other.IsA('ShieldPack'))
				{
					bRes = false;					
				}
				else
				{
					// End:0x141
					if(bRemoveUDamage && Other.IsA('IP_UDamage') || Other.IsA('UDamagePack'))
					{
						bRes = false;						
					}
					else
					{
						// End:0x181
						if(bRemoveAdrenaline && Other.IsA('AdrenalinePickup') || Other.IsA('IP_Adrenaline'))
						{
							bRes = false;							
						}
						else
						{
							// End:0x1C1
							if(bRemoveHealthPack && Other.IsA('HealthPack') || Other.IsA('IP_HealthKit'))
							{
								bRes = false;								
							}
							else
							{
								// End:0x1FE
								if(bRemoveSuperHealthPack && Other.IsA('SuperHealthPack') || Other.IsA('IP_SuperHealthKit'))
								{
									bRes = false;
								}
							}
						}
					}
				}
			}
		}
	}
	return bRes;
	//return;	
}

defaultproperties
{
	FriendlyName="BallisticPro - Equipment"
	Description="BallisticPro - Equipment - Internal"
	RemoteRole=2
}
