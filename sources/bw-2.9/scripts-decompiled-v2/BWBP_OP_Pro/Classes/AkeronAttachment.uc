class AkeronAttachment extends BallisticAttachment;

var name BackBones[3];
var name FrontBones[3];
var byte Index;
var Actor BackFlashes[3];
var Actor FrontFlashes[3];

simulated function FlashMuzzleFlash(byte Mode)
{
	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x14A
	if(AltMuzzleFlashClass != none)
	{
		// End:0x12D
		if(BackFlashes[int(Index)] == none)
		{
			BackFlashes[int(Index)] = Spawn(AltMuzzleFlashClass, self);
			// End:0xB6
			if(Emitter(BackFlashes[int(Index)]) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(BackFlashes[int(Index)]), DrawScale * FlashScale);
			}
			BackFlashes[int(Index)].SetDrawScale(DrawScale * FlashScale);
			// End:0x10D
			if(DGVEmitter(BackFlashes[int(Index)]) != none)
			{
				DGVEmitter(BackFlashes[int(Index)]).InitDGV();
			}
			AttachToBone(BackFlashes[int(Index)], BackBones[int(Index)]);
		}
		BackFlashes[int(Index)].Trigger(self, Instigator);
	}
	// End:0x258
	if(MuzzleFlashClass != none)
	{
		// End:0x23B
		if(FrontFlashes[int(Index)] == none)
		{
			FrontFlashes[int(Index)] = Spawn(MuzzleFlashClass, self);
			// End:0x1C4
			if(Emitter(FrontFlashes[int(Index)]) != none)
			{
				Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(FrontFlashes[int(Index)]), DrawScale * FlashScale);
			}
			FrontFlashes[int(Index)].SetDrawScale(DrawScale * FlashScale);
			// End:0x21B
			if(DGVEmitter(FrontFlashes[int(Index)]) != none)
			{
				DGVEmitter(FrontFlashes[int(Index)]).InitDGV();
			}
			AttachToBone(FrontFlashes[int(Index)], FrontBones[int(Index)]);
		}
		FrontFlashes[int(Index)].Trigger(self, Instigator);
	}
	Index++;
	// End:0x275
	if(int(Index) > 2)
	{
		Index = 0;
	}
	//return;	
}

simulated event Destroyed()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x51 [Loop If]
	if(i < 3)
	{
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(FrontFlashes[i]);
		Class'BCoreProV55.BUtil'.static.KillEmitterEffect(BackFlashes[i]);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	BackBones[0]="backblast"
	BackBones[1]="backblast2"
	BackBones[2]="backblast3"
	FrontBones[0]="tip"
	FrontBones[1]="tip2"
	FrontBones[2]="tip3"
	WeaponClass=Class'BWBP_OP_Pro.AkeronLauncher'
	MuzzleFlashClass=Class'BallisticProV55.G5FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.G5BackFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.7500000
	BrassMode=3
	InstantMode=3
	ReloadAnimRate=0.4600000
	Mesh=SkeletalMesh'BWBP_OP_Anim.Akeron_TPm'
	RelativeLocation=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=-32768,Yaw=0,Roll=0)
	DrawScale=0.2800000
}
