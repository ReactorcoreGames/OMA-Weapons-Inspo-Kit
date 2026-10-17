class FlakAttachment extends xWeaponAttachment;

var Class<FlakMuzFlash3rd> mMuzFlashClass;
var xEmitter mMuzFlash3rd;

simulated function Destroyed()
{
	// End:0x17
	if(mMuzFlash3rd != none)
	{
		mMuzFlash3rd.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated event ThirdPersonEffects()
{
	local Rotator R;

	// End:0x9A
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && int(FlashCount) > 0)
	{
		WeaponLight();
		// End:0x57
		if(mMuzFlash3rd == none)
		{
			mMuzFlash3rd = Spawn(mMuzFlashClass);
			AttachToBone(mMuzFlash3rd, 'tip');
		}
		// End:0x9A
		if(mMuzFlash3rd != none)
		{
			R.Roll = Rand(65536);
			SetBoneRotation('Bone_Flash', R, 0, 1.0000000);
			mMuzFlash3rd.mStartParticles++;
		}
	}
	super.ThirdPersonEffects();
	//return;	
}

defaultproperties
{
	mMuzFlashClass=Class'XEffects.FlakMuzFlash3rd'
	bHeavy=true
	LightType=1
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=255.0000000
	LightRadius=4.0000000
	Mesh=SkeletalMesh'Weapons.Flak_3rd'
}
