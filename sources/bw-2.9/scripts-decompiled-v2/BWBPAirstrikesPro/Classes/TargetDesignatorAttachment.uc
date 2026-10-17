class TargetDesignatorAttachment extends BallisticAttachment;

var LinkMuzFlashProj3rd MuzFlash;

simulated function Destroyed()
{
	// End:0x17
	if(MuzFlash != none)
	{
		MuzFlash.Destroy();
	}
	super.Destroyed();
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
	WeaponClass=Class'BWBPAirstrikesPro.TargetDesignator'
	Mesh=SkeletalMesh'BWBP_OP_Anim.Designator_TPm'
	RelativeLocation=(X=0.0000000,Y=-15.0000000,Z=5.0000000)
	DrawScale=0.1500000
}
