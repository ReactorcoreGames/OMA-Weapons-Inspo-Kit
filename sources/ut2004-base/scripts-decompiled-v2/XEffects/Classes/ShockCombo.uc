class ShockCombo extends Actor
	notplaceable;

var ShockComboFlare Flare;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x5D
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'XEffects.ShockComboExpRing');
		Flare = Spawn(Class'XEffects.ShockComboFlare');
		Spawn(Class'XEffects.ShockComboCore');
		Spawn(Class'XEffects.ShockComboSphereDark');
		Spawn(Class'XEffects.ShockComboVortex');
		Spawn(Class'XEffects.ShockComboWiggles');
		Spawn(Class'XEffects.ShockComboFlash');
	}
	//return;	
}

auto simulated state Combo
{Begin:

	Sleep(0.9000000);
	// End:0xD0
	if(Flare != none)
	{
		Flare.mStartParticles = 2;
		Flare.mRegenRange[0] = 0.0000000;
		Flare.mRegenRange[1] = 0.0000000;
		Flare.mLifeRange[0] = 0.3000000;
		Flare.mLifeRange[1] = 0.3000000;
		Flare.mSizeRange[0] = 150.0000000;
		Flare.mSizeRange[1] = 150.0000000;
		Flare.mGrowthRate = -500.0000000;
		Flare.mAttenKa = 0.9000000;
	}
	LightType = 0;
	stop;				
}

defaultproperties
{
	LightType=1
	LightEffect=21
	LightHue=195
	LightSaturation=100
	LightBrightness=255.0000000
	LightRadius=10.0000000
	DrawType=0
	bDynamicLight=true
	bNetTemporary=true
	RemoteRole=2
	LifeSpan=2.0000000
	bCollideActors=true
	ForceType=2
	ForceRadius=300.0000000
	ForceScale=-500.0000000
}
