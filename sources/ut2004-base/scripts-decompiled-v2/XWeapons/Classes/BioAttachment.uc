class BioAttachment extends xWeaponAttachment;

var xEmitter MuzFlash3rd;

simulated function Destroyed()
{
	// End:0x17
	if(MuzFlash3rd != none)
	{
		MuzFlash3rd.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Rotator R;

	// End:0xA5
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x62
		if(MuzFlash3rd == none)
		{
			MuzFlash3rd = Spawn(Class'XEffects.BioMuzFlash1st');
			MuzFlash3rd.bHidden = false;
			AttachToBone(MuzFlash3rd, 'tip');
		}
		// End:0xA5
		if(MuzFlash3rd != none)
		{
			R.Roll = Rand(65536);
			SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
			MuzFlash3rd.mStartParticles++;
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	bHeavy=true
	Mesh=SkeletalMesh'Weapons.BioRifle_3rd'
}
