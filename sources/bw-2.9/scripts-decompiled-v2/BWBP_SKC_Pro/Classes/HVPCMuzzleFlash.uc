class HVPCMuzzleFlash extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	Emitters[0]=SpriteEmitter'BallisticProV55.HVCMk9RedMuzzleFlash.SpriteEmitter5'
	Emitters[1]=BeamEmitter'BallisticProV55.HVCMk9RedMuzzleFlash.BeamEmitter5'
	Emitters[2]=BeamEmitter'BallisticProV55.HVCMk9RedMuzzleFlash.BeamEmitter6'
	Emitters[3]=SpriteEmitter'BallisticProV55.HVCMk9RedMuzzleFlash.SpriteEmitter6'
	Emitters[4]=SpriteEmitter'BallisticProV55.HVCMk9RedMuzzleFlash.SpriteEmitter8'
}
