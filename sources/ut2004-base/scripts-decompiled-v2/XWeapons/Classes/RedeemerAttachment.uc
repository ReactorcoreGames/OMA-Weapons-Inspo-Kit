class RedeemerAttachment extends xWeaponAttachment;

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
				SetBoneRotation('bone flash', R, 0, 1.0000000);
			}
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	bHeavy=true
	CullDistance=5000.0000000
	Mesh=SkeletalMesh'Weapons.Redeemer_3rd'
	RelativeLocation=(X=-35.0000000,Y=0.0000000,Z=0.0000000)
	RelativeRotation=(Pitch=0,Yaw=49152,Roll=32768)
	DrawScale=0.6000000
}
