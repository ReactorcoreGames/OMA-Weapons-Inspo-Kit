class FLASHAttachment extends BallisticAttachment;

var name BackBones[4];
var name FrontBones[4];
var byte Index;

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x102
	if(AltMuzzleFlashClass != none)
	{
		// End:0xED
		if(AltMuzzleFlash == none)
		{
			AltMuzzleFlash = Spawn(AltMuzzleFlashClass, self);
			// End:0x96
			if(Emitter(AltMuzzleFlash) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(AltMuzzleFlash), DrawScale * FlashScale);
			}
			AltMuzzleFlash.SetDrawScale(DrawScale * FlashScale);
			// End:0xD5
			if(DGVEmitter(AltMuzzleFlash) != none)
			{
				DGVEmitter(AltMuzzleFlash).InitDGV();
			}
			AttachToBone(AltMuzzleFlash, BackBones[int(Index)]);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
	}
	// End:0x1C8
	if(MuzzleFlashClass != none)
	{
		// End:0x1B3
		if(MuzzleFlash == none)
		{
			MuzzleFlash = Spawn(MuzzleFlashClass, self);
			// End:0x15C
			if(Emitter(MuzzleFlash) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(MuzzleFlash), DrawScale * FlashScale);
			}
			MuzzleFlash.SetDrawScale(DrawScale * FlashScale);
			// End:0x19B
			if(DGVEmitter(MuzzleFlash) != none)
			{
				DGVEmitter(MuzzleFlash).InitDGV();
			}
			AttachToBone(MuzzleFlash, FrontBones[int(Index)]);
		}
		MuzzleFlash.Trigger(self, Instigator);
	}
	Index++;
	// End:0x1E5
	if(int(Index) > 3)
	{
		Index = 0;
	}
	//return;	
}

defaultproperties
{
	BackBones[0]="back1"
	BackBones[1]="back2"
	BackBones[2]="back3"
	BackBones[3]="back4"
	FrontBones[0]="tip"
	FrontBones[1]="tip2"
	FrontBones[2]="tip3"
	FrontBones[3]="tip4"
	WeaponClass=Class'BWBP_SKC_Pro.FLASHLauncher'
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.G5BackFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="back1"
	FlashScale=1.2000000
	BrassMode=3
	InstantMode=3
	FlashMode=2
	ReloadAnim="Reload_MG"
	ReloadAnimRate=0.9700000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.FLASH_TPm'
	DrawScale=0.6000000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=5.0000000)
}
