class PKMRocketFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	Emitters[0]=MeshEmitter'BallisticProV55.G5FlashEmitter.MeshEmitter2'
	Emitters[1]=SpriteEmitter'BallisticProV55.G5FlashEmitter.SpriteEmitter3'
}
