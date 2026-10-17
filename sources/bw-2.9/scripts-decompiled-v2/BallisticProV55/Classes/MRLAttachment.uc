class MRLAttachment extends BallisticAttachment;

var byte BarrelIndex;

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x9D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x15C
	if((int(Mode) == 0) && MuzzleFlashClass != none)
	{
		// End:0x10F
		if(MuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
			MRLFlashEmitter(MuzzleFlash).InitMRLFlash(MuzzleFlash.DrawScale);
		}
		MRLFlashEmitter(MuzzleFlash).SetBarrelIndex(int(BarrelIndex));
		BarrelIndex++;
		// End:0x147
		if(int(BarrelIndex) > 17)
		{
			BarrelIndex = 0;
		}
		MuzzleFlash.Trigger(self, Instigator);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.MRocketLauncher'
	MuzzleFlashClass=Class'BallisticProV55.MRLFlashEmitter'
	BrassMode=3
	InstantMode=3
	FlashMode=2
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.MRL_TPm'
	DrawScale=0.2500000
}
