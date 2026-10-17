class DTM75Railgun extends DT_BWBullet
	config(BallisticProV55);

static function ModifyHit(Pawn Victim, out float Damage, Vector Momentum, out Vector HitLocation, out Vector hitRay, out name HitBone)
{
	// End:0xE1
	if(Damage > float(100 + Rand(50)))
	{
		// End:0x42
		if((HitBone == 'lshoulder') || HitBone == 'rshoulder')
		{
			HitBone = 'spine';			
		}
		else
		{
			// End:0x70
			if((HitBone == 'lthigh') || HitBone == 'rthigh')
			{
				HitBone = 'pelvis';				
			}
			else
			{
				// End:0x8D
				if(HitBone == 'lfoot')
				{
					HitBone = 'lthigh';					
				}
				else
				{
					// End:0xAA
					if(HitBone == 'rfoot')
					{
						HitBone = 'rthigh';						
					}
					else
					{
						// End:0xC7
						if(HitBone == 'lfarm')
						{
							HitBone = 'lshoulder';							
						}
						else
						{
							// End:0xE1
							if(HitBone == 'rfarm')
							{
								HitBone = 'rshoulder';
							}
						}
					}
				}
			}
		}
	}
	//return;	
}

defaultproperties
{
	DeathStrings[0]="%o was railed by %k."
	DeathStrings[1]="%k's rail slug put a corkscrew through %o."
	DeathStrings[2]="%k derailed %o's skin."
	DeathStrings[3]="%o got %vs nebulised by %k's railgun."
	DeathStrings[4]="%o saw the light at the end of %k's M75 muzzle."
	AimedString="Scoped"
	BloodManagerName="BallisticProV55.BloodMan_Railgun"
	bOnlySeverLimbs=false
	FlashThreshold=0
	FlashV=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	FlashF=0.2500000
	DisplacementType=1
	AimDisplacementDamageThreshold=110
	AimDisplacementDuration=0.6500000
	TagMultiplier=0.4000000
	TagDuration=0.4000000
	bSnipingDamage=true
	InvasionDamageScaling=2.0000000
	DamageIdent="Sniper"
	DamageDescription=",Bullet,Electro,"
	WeaponClass=Class'BallisticProV55.M75Railgun'
	DeathString="%o was railed by %k."
	FemaleSuicide="%o derailed herself."
	MaleSuicide="%o derailed himself."
	bExtraMomentumZ=true
	VehicleDamageScaling=1.0000000
}
