class RocketAttachment extends xWeaponAttachment;

var Class<xEmitter> MuzFlashClass;
var xEmitter MuzFlash;

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

	// End:0x9F
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		// End:0x5C
		if(MuzFlash == none)
		{
			MuzFlash = Spawn(MuzFlashClass);
			// End:0x5C
			if(MuzFlash != none)
			{
				AttachToBone(MuzFlash, 'tip');
			}
		}
		// End:0x9F
		if(MuzFlash != none)
		{
			MuzFlash.mStartParticles++;
			R.Roll = Rand(65536);
			SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	MuzFlashClass=Class'XEffects.RocketMuzFlash3rd'
	bHeavy=true
	Mesh=SkeletalMesh'Weapons.RocketLauncher_3rd'
}
