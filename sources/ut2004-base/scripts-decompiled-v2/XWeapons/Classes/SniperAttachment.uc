class SniperAttachment extends xWeaponAttachment;

var() LightningCharge3rd Charge;

simulated function Destroyed()
{
	// End:0x17
	if(Charge != none)
	{
		Charge.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	// End:0x48
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x42
		if(Charge == none)
		{
			Charge = Spawn(Class'XEffects.LightningCharge3rd');
			AttachToBone(Charge, 'tip');
		}
		WeaponLight();
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	LightType=1
	LightEffect=13
	LightHue=165
	LightSaturation=170
	LightBrightness=255.0000000
	LightRadius=5.0000000
	LightPeriod=3
	Mesh=SkeletalMesh'Weapons.Sniper_3rd'
}
