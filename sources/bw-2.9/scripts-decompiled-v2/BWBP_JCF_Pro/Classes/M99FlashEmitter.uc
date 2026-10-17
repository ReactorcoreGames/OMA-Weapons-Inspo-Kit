class M99FlashEmitter extends BallisticEmitter;

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
	Emitters[0]=MeshEmitter'BallisticProV55.R78FlashEmitter.MeshEmitter8'
	Emitters[1]=SpriteEmitter'BallisticProV55.R78FlashEmitter.SpriteEmitter13'
	Emitters[2]=SpriteEmitter'BallisticProV55.R78FlashEmitter.SpriteEmitter14'
}
