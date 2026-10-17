class X93PainterAttachment extends xWeaponAttachment;

var LinkMuzFlashProj3rd MuzFlash;

simulated function Destroyed()
{
	// End:0x17
	if(MuzFlash != none)
	{
		MuzFlash.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Rotator R;

	// End:0x84
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x84
		if(int(FiringMode) == 0)
		{
			// End:0x40
			if(MuzFlash == none)
			{
			}
			// End:0x84
			if(MuzFlash != none)
			{
				MuzFlash.Trigger(self, none);
				R.Roll = Rand(65536);
				SetBoneRotation('bone flashA', R, 0, 1.0000000);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	Mesh=SkeletalMesh'Weapons.Painter_3rd'
}
