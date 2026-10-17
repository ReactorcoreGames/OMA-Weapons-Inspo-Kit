class ONSPowerCoreBlue extends ONSPowerCore
	config
	hidecategories(Lighting,LightColor,Karma,Force,DestroyableObjective);

var ONSPowerCoreEnergy PCEnergyEffect;

simulated function PowerCoreDestroyed()
{
	super.PowerCoreDestroyed();
	// End:0x1D
	if(PCEnergyEffect != none)
	{
		PCEnergyEffect.Destroy();
	}
	//return;	
}

simulated function CheckShield()
{
	super.CheckShield();
	// End:0xAE
	if(int(CoreStage) == 0)
	{
		// End:0x74
		if((PCEnergyEffect != none) && (PCEnergyEffect.IsA('ONSPowerCoreEnergyRed') && int(DefenderTeamIndex) == 1) || PCEnergyEffect.IsA('ONSPowerCoreEnergyBlue') && int(DefenderTeamIndex) == 0)
		{
			PCEnergyEffect.Destroy();
		}
		// End:0xAB
		if(PCEnergyEffect == none)
		{
			// End:0x9D
			if(int(DefenderTeamIndex) == 0)
			{
				PCEnergyEffect = Spawn(Class'Onslaught.ONSPowerCoreEnergyRed');				
			}
			else
			{
				PCEnergyEffect = Spawn(Class'Onslaught.ONSPowerCoreEnergyBlue');
			}
		}		
	}
	else
	{
		// End:0xC5
		if(PCEnergyEffect != none)
		{
			PCEnergyEffect.Destroy();
		}
	}
	//return;	
}

defaultproperties
{
	DefenderTeamIndex=1
}
